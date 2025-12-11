# 🔌 BlackRoad OS Platform Integrations

This directory contains configuration files and integration scripts for all supported platforms.

## Directory Structure

```
integrations/
├── cloud/                    # Cloud platform configs
│   ├── digitalocean/         # DigitalOcean Droplets
│   ├── railway/              # Railway (already in root)
│   ├── vercel/               # Vercel (config in root)
│   └── cloudflare/           # Cloudflare Workers/Pages
├── mobile/                   # Mobile app integrations
│   ├── warp/                 # Warp terminal
│   ├── shellfish/            # Shellfish SSH client
│   ├── working-copy/         # Working Copy Git client
│   └── pyto/                 # Pyto Python IDE
├── iot/                      # IoT device integrations
│   └── raspberry-pi/         # Raspberry Pi configs
├── productivity/             # Productivity tools
│   ├── asana/                # Asana project management
│   └── notion/               # Notion databases
├── auth/                     # Authentication providers
│   └── clerk/                # Clerk auth
├── payments/                 # Payment processors
│   └── stripe/               # Stripe integration
├── ai/                       # AI/ML integrations
│   ├── huggingface/          # Hugging Face models
│   └── models/               # Open source model registry
└── networking/               # Network/tunnel configs
    └── tunnels/              # ngrok, cloudflared, etc.
```

## Quick Start

1. Copy `.env.example` to `.env` and fill in your API keys
2. Run `pnpm setup:integrations` to validate configurations
3. Deploy with your preferred platform

## Security

- All secrets stored in environment variables or secret managers
- No API keys committed to repository
- All integrations use principle of least privilege
- Open source models vetted for safety
