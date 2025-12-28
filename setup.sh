#!/bin/bash
set -euo pipefail

echo "OpenCode Self-Hosted Setup"
echo "=========================="

if [ ! -f .env ]; then
    cp .env.example .env
    
    # Cookie secret must be exactly 24 bytes base64 encoded
    COOKIE_SECRET=$(openssl rand -base64 24)
    sed -i '' "s|^COOKIE_SECRET=.*|COOKIE_SECRET=${COOKIE_SECRET}|" .env
    
    echo "Created .env with generated COOKIE_SECRET"
    echo ""
    echo "Edit .env and configure:"
    echo "  1. OPENCODE_URL (e.g., https://192-168-1-190.nip.io)"
    echo "  2. GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET"
    echo "  3. At least one LLM API key"
    echo "  4. Update Caddyfile hostname to match OPENCODE_URL"
    echo ""
    echo "Then run: ./setup.sh"
    exit 0
fi

if grep -q "^GOOGLE_CLIENT_ID=$" .env || grep -q "your-client-id" .env; then
    echo "ERROR: GOOGLE_CLIENT_ID not configured in .env"
    exit 1
fi

if grep -q "^OPENCODE_URL=$" .env; then
    echo "ERROR: OPENCODE_URL not configured in .env"
    exit 1
fi

echo "Starting OpenCode..."
docker compose up -d

OPENCODE_URL=$(grep "^OPENCODE_URL=" .env | cut -d= -f2)
echo ""
echo "OpenCode running at: ${OPENCODE_URL}"
echo ""
echo "View logs: docker compose logs -f"
echo "Stop:      docker compose down"
