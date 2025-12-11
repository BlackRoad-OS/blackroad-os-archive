#!/bin/bash
# DigitalOcean Deployment Script
# Requires: doctl CLI authenticated

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() { echo -e "${GREEN}[DO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# Check requirements
command -v doctl >/dev/null 2>&1 || error "doctl CLI not installed"
command -v jq >/dev/null 2>&1 || error "jq not installed"

# Validate authentication
log "Validating DigitalOcean authentication..."
doctl account get >/dev/null 2>&1 || error "Not authenticated. Run: doctl auth init"

# Configuration
DROPLET_NAME="${DROPLET_NAME:-blackroad-api-production}"
REGION="${REGION:-nyc3}"
SIZE="${SIZE:-s-2vcpu-4gb}"
IMAGE="${IMAGE:-docker-20-04}"

# Check if droplet exists
EXISTING=$(doctl compute droplet list --format Name --no-header | grep "^${DROPLET_NAME}$" || true)

if [ -n "$EXISTING" ]; then
    log "Droplet $DROPLET_NAME already exists"
    DROPLET_ID=$(doctl compute droplet list --format ID,Name --no-header | grep "$DROPLET_NAME" | awk '{print $1}')
    log "Droplet ID: $DROPLET_ID"
else
    log "Creating droplet: $DROPLET_NAME"
    doctl compute droplet create "$DROPLET_NAME" \
        --region "$REGION" \
        --size "$SIZE" \
        --image "$IMAGE" \
        --tag-names "blackroad-os,production" \
        --enable-monitoring \
        --enable-backups \
        --wait

    DROPLET_ID=$(doctl compute droplet list --format ID,Name --no-header | grep "$DROPLET_NAME" | awk '{print $1}')
fi

# Get droplet IP
DROPLET_IP=$(doctl compute droplet get "$DROPLET_ID" --format PublicIPv4 --no-header)
log "Droplet IP: $DROPLET_IP"

# Wait for SSH
log "Waiting for SSH to be ready..."
for i in {1..30}; do
    if ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no root@"$DROPLET_IP" 'echo ok' 2>/dev/null; then
        break
    fi
    sleep 10
done

# Deploy application
log "Deploying application..."
ssh -o StrictHostKeyChecking=no root@"$DROPLET_IP" << 'EOF'
    # Update system
    apt-get update -qq

    # Install Docker if not present
    if ! command -v docker &> /dev/null; then
        curl -fsSL https://get.docker.com | sh
        systemctl enable docker
        systemctl start docker
    fi

    # Pull and run latest image
    docker pull ghcr.io/blackroad-os/api:latest || true
    docker stop blackroad-api 2>/dev/null || true
    docker rm blackroad-api 2>/dev/null || true
    docker run -d \
        --name blackroad-api \
        --restart=always \
        -p 80:8080 \
        -p 443:8443 \
        -e NODE_ENV=production \
        ghcr.io/blackroad-os/api:latest || echo "Container may need to be built"

    echo "Deployment complete"
EOF

log "Deployment complete!"
log "Access your application at: http://$DROPLET_IP"
