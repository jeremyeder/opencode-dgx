# opencode-dgx

Self-hosted OpenCode server with Google OAuth authentication for Red Hat developers.

## Architecture

```
┌─────────────┐     ┌───────────────┐     ┌──────────┐
│   Caddy     │────▶│ OAuth2-proxy  │────▶│ OpenCode │
│  (TLS/443)  │     │ (Google Auth) │     │  (:4096) │
└─────────────┘     └───────────────┘     └──────────┘
```

- **Caddy**: TLS termination with self-signed certificates
- **OAuth2-proxy**: Google OAuth, restricted to `@redhat.com` emails
- **OpenCode**: AI coding agent server

## Prerequisites

- Docker and Docker Compose
- Google Cloud OAuth credentials
- VPN connection (for nip.io DNS resolution)

## Quick Start

```bash
# Clone and setup
git clone https://github.com/jeremyeder/opencode-dgx.git
cd opencode-dgx
./setup.sh

# Edit .env with your credentials
vim .env

# Update Caddyfile hostname to match your IP
vim Caddyfile

# Start services
./setup.sh
```

## Google OAuth Setup

1. Go to [Google Cloud Console - Credentials](https://console.cloud.google.com/apis/credentials)
2. Create OAuth 2.0 Client ID (Web application)
3. Add authorized redirect URI: `https://<your-ip-with-dashes>.nip.io/oauth2/callback`
4. Copy Client ID and Secret to `.env`

## Configuration

Edit `.env`:

| Variable               | Description                                     |
| ---------------------- | ----------------------------------------------- |
| `OPENCODE_URL`         | Full URL (e.g., `https://192-168-1-190.nip.io`) |
| `GOOGLE_CLIENT_ID`     | OAuth client ID from GCP                        |
| `GOOGLE_CLIENT_SECRET` | OAuth client secret from GCP                    |
| `EMAIL_DOMAIN`         | Allowed email domain (default: `redhat.com`)    |
| `ANTHROPIC_API_KEY`    | Anthropic API key                               |
| `OPENAI_API_KEY`       | OpenAI API key                                  |
| `GOOGLE_API_KEY`       | Google AI API key                               |
| `PROJECTS_DIR`         | Host directory to mount as `/projects`          |

Edit `Caddyfile` to match your `OPENCODE_URL` hostname.

## Usage

```bash
# Start
docker compose up -d

# View logs
docker compose logs -f

# Stop
docker compose down

# Restart after config changes
docker compose down && docker compose up -d
```

## Access

1. Connect to VPN (required for nip.io DNS)
2. Navigate to your `OPENCODE_URL`
3. Accept self-signed certificate warning
4. Sign in with `@redhat.com` Google account

## DNS Note

nip.io provides wildcard DNS: `192-168-1-190.nip.io` resolves to `192.168.1.190`.

Some ISP DNS servers don't resolve nip.io. Use VPN or configure DNS to use `8.8.8.8`.
