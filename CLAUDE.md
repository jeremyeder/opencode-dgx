# OpenCode DGX - Agentic Development Guide

## Deployment Target

- **Host**: NVIDIA DGX Spark (`jeder-spark.local` / `192.168.1.190`)
- **SSH**: `ssh jeder-spark.local`
- **Deployment path**: `~/opencode-server/`
- **Access URL**: `https://192-168-1-190.nip.io`

## Critical Rules

1. **Container-only deployments** - No host OS modifications without explicit approval
2. **All changes via containers** - Never install packages directly on DGX host

## Common Operations

### Check status

```bash
ssh jeder-spark.local "cd ~/opencode-server && docker compose ps"
```

### View logs

```bash
ssh jeder-spark.local "cd ~/opencode-server && docker compose logs -f"
```

### Restart services

```bash
ssh jeder-spark.local "cd ~/opencode-server && docker compose down && docker compose up -d"
```

### Deploy updates

```bash
# From local repo
scp docker-compose.yml Caddyfile setup.sh .env.example jeder-spark.local:~/opencode-server/
ssh jeder-spark.local "cd ~/opencode-server && docker compose down && docker compose up -d"
```

## Key Technical Details

- **Cookie secret**: Must be exactly 24 bytes base64 (`openssl rand -base64 24`)
- **nip.io DNS**: Requires VPN or Google DNS (8.8.8.8) - AT&T router DNS doesn't resolve it
- **Google OAuth**: Requires public TLD - raw IPs and `.local` domains not allowed
- **OAuth2-proxy version**: v7.6.0

## File Locations

| File                 | Purpose                      |
| -------------------- | ---------------------------- |
| `docker-compose.yml` | Container orchestration      |
| `Caddyfile`          | TLS and reverse proxy config |
| `.env`               | Secrets (not in git)         |
| `.env.example`       | Template for secrets         |
| `setup.sh`           | Initial setup script         |

## Troubleshooting

### DNS not resolving nip.io

- Connect to VPN, or
- Use Google DNS: `nslookup 192-168-1-190.nip.io 8.8.8.8`

### OAuth callback error

- Verify `OPENCODE_URL` in `.env` matches Caddyfile hostname
- Verify Google OAuth redirect URI matches exactly

### Cookie/session issues

- Regenerate cookie secret: `openssl rand -base64 24`
- Restart oauth2-proxy container
