#!/bin/bash
# Raspberry Pi Setup Script for BlackRoad OS
# Run on fresh Raspberry Pi OS installation

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

# Check if running on Raspberry Pi
if ! grep -q "Raspberry Pi" /proc/device-tree/model 2>/dev/null; then
    warn "Not running on Raspberry Pi hardware (simulation mode)"
fi

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    error "Please run as root (sudo ./setup.sh)"
fi

log "Starting BlackRoad OS Raspberry Pi Setup..."

# Update system
log "Updating system packages..."
apt-get update -qq
apt-get upgrade -y -qq

# Install essential packages
log "Installing essential packages..."
apt-get install -y -qq \
    git \
    curl \
    wget \
    vim \
    htop \
    tmux \
    ufw \
    fail2ban \
    python3-pip \
    python3-venv \
    build-essential \
    libffi-dev \
    libssl-dev

# Install Docker
if ! command -v docker &> /dev/null; then
    log "Installing Docker..."
    curl -fsSL https://get.docker.com | sh
    usermod -aG docker pi 2>/dev/null || usermod -aG docker $SUDO_USER
    systemctl enable docker
    systemctl start docker
fi

# Install Docker Compose
if ! command -v docker-compose &> /dev/null; then
    log "Installing Docker Compose..."
    apt-get install -y -qq docker-compose-plugin
fi

# Configure UFW Firewall
log "Configuring firewall..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 80/tcp
ufw allow 443/tcp
ufw --force enable

# Configure Fail2Ban
log "Configuring Fail2Ban..."
cat > /etc/fail2ban/jail.local << 'EOF'
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
findtime = 600
EOF
systemctl enable fail2ban
systemctl restart fail2ban

# SSH Hardening
log "Hardening SSH configuration..."
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
cat >> /etc/ssh/sshd_config << 'EOF'

# BlackRoad OS SSH Hardening
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
MaxAuthTries 3
ClientAliveInterval 300
ClientAliveCountMax 2
X11Forwarding no
EOF

# Disable password auth only if SSH keys exist
if [ -f /home/pi/.ssh/authorized_keys ] || [ -f /home/$SUDO_USER/.ssh/authorized_keys ]; then
    systemctl restart sshd
    log "SSH hardening applied with key-based auth"
else
    warn "No SSH keys found - keeping password auth enabled"
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
fi

# Install Prometheus Node Exporter
log "Installing Prometheus Node Exporter..."
apt-get install -y -qq prometheus-node-exporter
systemctl enable prometheus-node-exporter
systemctl start prometheus-node-exporter

# Create BlackRoad directories
log "Creating BlackRoad directories..."
mkdir -p /opt/blackroad/{config,data,logs}
chown -R pi:pi /opt/blackroad 2>/dev/null || chown -R $SUDO_USER:$SUDO_USER /opt/blackroad

# Create Docker network
log "Creating Docker network..."
docker network create blackroad-net 2>/dev/null || true

# Set hostname (optional)
if [ -n "$BLACKROAD_HOSTNAME" ]; then
    log "Setting hostname to $BLACKROAD_HOSTNAME..."
    hostnamectl set-hostname "$BLACKROAD_HOSTNAME"
fi

# Enable hardware interfaces
log "Enabling hardware interfaces..."
raspi-config nonint do_i2c 0 2>/dev/null || true
raspi-config nonint do_spi 0 2>/dev/null || true
raspi-config nonint do_serial_hw 0 2>/dev/null || true

# Create health check endpoint
log "Creating health check service..."
cat > /opt/blackroad/health.py << 'EOF'
#!/usr/bin/env python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import subprocess
import os

class HealthHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/health':
            # Get system stats
            with open('/proc/loadavg') as f:
                load = f.read().split()[0]
            with open('/proc/meminfo') as f:
                mem = f.read()

            response = {
                'status': 'healthy',
                'hostname': os.uname().nodename,
                'load': load,
                'docker': subprocess.run(['docker', 'ps', '-q'], capture_output=True).returncode == 0
            }

            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            self.wfile.write(json.dumps(response).encode())
        else:
            self.send_response(404)
            self.end_headers()

    def log_message(self, format, *args):
        pass  # Suppress logging

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 8080), HealthHandler)
    print('Health server running on port 8080')
    server.serve_forever()
EOF
chmod +x /opt/blackroad/health.py

# Create systemd service for health check
cat > /etc/systemd/system/blackroad-health.service << 'EOF'
[Unit]
Description=BlackRoad Health Check Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 /opt/blackroad/health.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable blackroad-health
systemctl start blackroad-health

# Summary
log "=========================================="
log "BlackRoad OS Raspberry Pi Setup Complete!"
log "=========================================="
info "Services installed:"
info "  - Docker & Docker Compose"
info "  - UFW Firewall (ports 22, 80, 443)"
info "  - Fail2Ban"
info "  - Prometheus Node Exporter (:9100)"
info "  - Health Check Endpoint (:8080/health)"
info ""
info "Next steps:"
info "  1. Add your SSH public key to ~/.ssh/authorized_keys"
info "  2. Deploy services with: docker compose up -d"
info "  3. Check health at: http://$(hostname -I | awk '{print $1}'):8080/health"
info ""
warn "Reboot recommended to apply all changes"
