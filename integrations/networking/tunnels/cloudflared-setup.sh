#!/bin/bash
# Cloudflare Tunnel Setup Script
# Sets up cloudflared for BlackRoad OS

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${GREEN}[SETUP]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }
info() { echo -e "${BLUE}[INFO]${NC} $1"; }

# Check requirements
check_requirements() {
    log "Checking requirements..."

    if ! command -v curl &> /dev/null; then
        error "curl is required but not installed"
    fi

    if [ -z "$CLOUDFLARE_API_TOKEN" ] && [ -z "$TUNNEL_TOKEN" ]; then
        warn "No Cloudflare credentials found"
        warn "Set CLOUDFLARE_API_TOKEN for interactive setup"
        warn "Or set TUNNEL_TOKEN for token-based setup"
    fi
}

# Install cloudflared
install_cloudflared() {
    if command -v cloudflared &> /dev/null; then
        log "cloudflared already installed: $(cloudflared --version)"
        return 0
    fi

    log "Installing cloudflared..."

    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)

    case "$ARCH" in
        x86_64) ARCH="amd64" ;;
        aarch64|arm64) ARCH="arm64" ;;
        armv7l) ARCH="arm" ;;
        *) error "Unsupported architecture: $ARCH" ;;
    esac

    case "$OS" in
        linux)
            if command -v apt-get &> /dev/null; then
                curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH}.deb" -o /tmp/cloudflared.deb
                sudo dpkg -i /tmp/cloudflared.deb
                rm /tmp/cloudflared.deb
            else
                curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH}" -o /tmp/cloudflared
                chmod +x /tmp/cloudflared
                sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
            fi
            ;;
        darwin)
            if command -v brew &> /dev/null; then
                brew install cloudflare/cloudflare/cloudflared
            else
                curl -L "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-darwin-${ARCH}.tgz" | tar xz
                sudo mv cloudflared /usr/local/bin/
            fi
            ;;
        *)
            error "Unsupported OS: $OS"
            ;;
    esac

    log "cloudflared installed: $(cloudflared --version)"
}

# Login to Cloudflare
login_cloudflare() {
    if [ -f ~/.cloudflared/cert.pem ]; then
        log "Already logged in to Cloudflare"
        return 0
    fi

    log "Logging in to Cloudflare..."
    info "A browser window will open for authentication"
    cloudflared tunnel login
}

# Create tunnel
create_tunnel() {
    TUNNEL_NAME="${1:-blackroad-tunnel}"

    log "Creating tunnel: $TUNNEL_NAME"

    # Check if tunnel exists
    if cloudflared tunnel list | grep -q "$TUNNEL_NAME"; then
        log "Tunnel '$TUNNEL_NAME' already exists"
        TUNNEL_ID=$(cloudflared tunnel list | grep "$TUNNEL_NAME" | awk '{print $1}')
    else
        cloudflared tunnel create "$TUNNEL_NAME"
        TUNNEL_ID=$(cloudflared tunnel list | grep "$TUNNEL_NAME" | awk '{print $1}')
    fi

    log "Tunnel ID: $TUNNEL_ID"
    echo "$TUNNEL_ID"
}

# Configure tunnel
configure_tunnel() {
    TUNNEL_NAME="${1:-blackroad-tunnel}"
    LOCAL_PORT="${2:-8080}"
    HOSTNAME="${3:-tunnel.blackroad.io}"

    log "Configuring tunnel..."

    CONFIG_DIR="/etc/cloudflared"
    sudo mkdir -p "$CONFIG_DIR"

    # Create config file
    sudo tee "$CONFIG_DIR/config.yml" > /dev/null << EOF
tunnel: $TUNNEL_NAME
credentials-file: $CONFIG_DIR/credentials.json

ingress:
  - hostname: $HOSTNAME
    service: http://localhost:$LOCAL_PORT
    originRequest:
      connectTimeout: 30s
      noTLSVerify: false

  # Health check endpoint
  - hostname: health.$HOSTNAME
    service: http://localhost:$LOCAL_PORT/health

  # Catch-all (required)
  - service: http_status:404
EOF

    # Copy credentials
    if [ -f ~/.cloudflared/*.json ]; then
        sudo cp ~/.cloudflared/*.json "$CONFIG_DIR/credentials.json"
        sudo chmod 600 "$CONFIG_DIR/credentials.json"
    fi

    log "Configuration saved to $CONFIG_DIR/config.yml"
}

# Setup DNS
setup_dns() {
    TUNNEL_NAME="${1:-blackroad-tunnel}"
    HOSTNAME="${2:-tunnel.blackroad.io}"

    log "Setting up DNS for $HOSTNAME..."

    # Get tunnel ID
    TUNNEL_ID=$(cloudflared tunnel list | grep "$TUNNEL_NAME" | awk '{print $1}')

    if [ -z "$TUNNEL_ID" ]; then
        error "Could not find tunnel: $TUNNEL_NAME"
    fi

    # Create DNS route
    cloudflared tunnel route dns "$TUNNEL_ID" "$HOSTNAME" || warn "DNS route may already exist"

    log "DNS configured: $HOSTNAME -> $TUNNEL_ID.cfargotunnel.com"
}

# Install systemd service
install_service() {
    log "Installing systemd service..."

    sudo tee /etc/systemd/system/cloudflared.service > /dev/null << 'EOF'
[Unit]
Description=Cloudflare Tunnel for BlackRoad OS
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/cloudflared tunnel --config /etc/cloudflared/config.yml run
Restart=on-failure
RestartSec=10
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

    sudo systemctl daemon-reload
    sudo systemctl enable cloudflared
    log "Service installed and enabled"
}

# Start tunnel
start_tunnel() {
    log "Starting tunnel..."
    sudo systemctl start cloudflared
    sleep 2

    if sudo systemctl is-active --quiet cloudflared; then
        log "Tunnel is running!"
        sudo systemctl status cloudflared --no-pager
    else
        error "Failed to start tunnel. Check: sudo journalctl -u cloudflared -f"
    fi
}

# Quick tunnel (no configuration)
quick_tunnel() {
    LOCAL_PORT="${1:-8080}"

    log "Starting quick tunnel to localhost:$LOCAL_PORT"
    info "This creates a temporary tunnel URL"

    cloudflared tunnel --url "http://localhost:$LOCAL_PORT"
}

# Token-based setup
token_setup() {
    if [ -z "$TUNNEL_TOKEN" ]; then
        error "TUNNEL_TOKEN environment variable not set"
    fi

    log "Setting up tunnel with token..."

    # Install as service with token
    sudo cloudflared service install "$TUNNEL_TOKEN"

    log "Token-based tunnel configured"
    start_tunnel
}

# Main
main() {
    echo "========================================"
    echo "  Cloudflare Tunnel Setup"
    echo "  BlackRoad OS"
    echo "========================================"
    echo ""

    check_requirements
    install_cloudflared

    case "${1:-interactive}" in
        quick)
            quick_tunnel "${2:-8080}"
            ;;
        token)
            token_setup
            ;;
        interactive|*)
            login_cloudflare
            TUNNEL_NAME="${2:-blackroad-tunnel}"
            create_tunnel "$TUNNEL_NAME"
            configure_tunnel "$TUNNEL_NAME" "${3:-8080}" "${4:-tunnel.blackroad.io}"
            setup_dns "$TUNNEL_NAME" "${4:-tunnel.blackroad.io}"
            install_service
            start_tunnel
            ;;
    esac

    echo ""
    log "========================================"
    log "Setup complete!"
    log "========================================"
    info "Check status: sudo systemctl status cloudflared"
    info "View logs: sudo journalctl -u cloudflared -f"
    info "Stop tunnel: sudo systemctl stop cloudflared"
}

main "$@"
