# 🗺️ BlackRoad OS — Full Connection & Integration Mapping

**Last updated:** 2025-12-11
**Purpose:** Create a unified source-of-truth for all connections across infra, repos, domains, deployments, DNS, and credentials.
**Use:** Feed into Codex to generate corrections, workflows, infra fixes, DNS patches, and GitHub automation.

---

## 0. Overview
Document captures every active endpoint, domain, repository, cloud service, and integration path.

**Sections**
1. Cloudflare
2. Domains & DNS
3. Railway Deployments
4. Vercel Deployments
5. GitHub Org & Repos
6. DigitalOcean
7. Stripe
8. Google Workspace
9. USPTO & Trademark infra
10. Agents & Automations layer
11. Error States / Fix Queue
12. Codex Prompt Templates
13. Platform Integrations (NEW)
14. Mobile App Integrations (NEW)
15. AI/ML Model Registry (NEW)

---

## 0.1 Quick Integration Reference

| Platform | Config File | Status |
|----------|-------------|--------|
| Railway | `railway.toml` | ✅ Active |
| Vercel | `vercel.json` | ✅ Configured |
| Cloudflare Workers | `wrangler.toml` | ✅ Configured |
| Docker | `Dockerfile` | ✅ Active |
| DigitalOcean | `integrations/cloud/digitalocean/` | ✅ Configured |
| Raspberry Pi | `integrations/iot/raspberry-pi/` | ✅ Configured |
| Clerk Auth | `integrations/auth/clerk/` | ✅ Configured |
| Stripe Payments | `integrations/payments/stripe/` | ✅ Configured |
| Asana | `integrations/productivity/asana/` | ✅ Configured |
| Notion | `integrations/productivity/notion/` | ✅ Configured |
| Hugging Face | `integrations/ai/huggingface/` | ✅ Configured |
| AI Models | `integrations/ai/models/` | ✅ Registry Ready |
| Tunnels | `integrations/networking/tunnels/` | ✅ Configured |
| Warp | `integrations/mobile/warp/` | ✅ Configured |
| Shellfish | `integrations/mobile/shellfish/` | ✅ Configured |
| Working Copy | `integrations/mobile/working-copy/` | ✅ Configured |
| Pyto | `integrations/mobile/pyto/` | ✅ Configured |

---

## 1. Cloudflare (dash.cloudflare.com)

**Tabs found:**
- Pages: `blackroad-os-ideas`
- Workers & Pages Upload
- Primary domain management for `blackroad.io` and others

### 1.1 Cloudflare Zones
- `blackroad.io` → **status:** 521
- `blackroad.systems` → TODO: map subdomains
- `blackroad.me` → placeholder
- `blackroad.network`
- `blackroadai.com`
- (*List all domains owned in GoDaddy and paste here after the next step.*)

### 1.2 Cloudflare DNS (per domain)
Use this template for each domain:

```
Domain: <domain>
Apex Root (@):
    CNAME → <target> (Railway/Vercel)
    Proxy: ON/OFF
www:
    CNAME → <target>
Subdomains:
    <sub> → <cloud-service>
TLS Mode:
    <Flexible / Full / Full Strict>
Workers Routes:
    <route pattern> → <worker>
Pages Bindings:
    <project> → <repo> → <deployment>
```

---

## 2. Domains (GoDaddy)

Source tab: `https://account.godaddy.com/products`

Document all domains you own and their authoritative DNS host (Cloudflare, GoDaddy, Vercel).

```
Domain: <domain>
Registrar: GoDaddy
DNS Managed At: <Cloudflare / GoDaddy / Vercel>
Connected Services:
    - Website: <URL>
    - API: <URL>
    - Subdomains: <map from Cloudflare section>
Renewal Date: <date>
```

---

## 3. Railway Deployments (railway.com)

Open tabs:
- Project: railway-blackroad-os
- Dashboard
- Error page: blackroad-os-operator-production.up.railway.app (500/521)

```
Service: <railway service name>
Environment: <production / staging>
Public URL: <*.up.railway.app>
Custom Domain: <domain/subdomain>
Bound Variables:
    - PORT:
    - API_URL:
    - DB_URL:
Health:
    /health endpoint → <working / failing>
Error States:
    <from logs>
```

---

## 4. Vercel (vercel.com)

```
Project: <project name>
Framework: <Next.js/Static>
Production Domain: <domain>
Preview: <vercel.app URL>
Connected Repo: <GitHub repo>
Environment Variables:
    <list of keys>
Build Status:
    <success/fail/reason>
```

---

## 5. GitHub Organization (BlackRoad OS)

Open tabs:
- Org listing
- Repo list (24 repos)
- Teams setup earlier

```
Repo: <repo name>
Purpose: <one-liner>
Connected Services:
    - Railway: <service>
    - Vercel: <project>
    - Cloudflare Pages: <site>
    - DigitalOcean: <droplet>
Deploy Targets:
    main → <production>
    dev → <staging>
    feature/* → <preview>
Workflows:
    - build.yml: <status>
    - tests.yml: <status>
Permissions:
    Team: <team name> (read/write/admin)
Branch Rules:
    <rules>
```

---

## 6. DigitalOcean (Droplets)

Source tab: `cloud.digitalocean.com/droplets`

```
Droplet: <name>
IP: <ip>
Purpose: <service>
Connected Domain: <domain>
Ports:
    80: <service>
    443: <service>
Deployments:
    <agent/scheduler/service>
```

---

## 7. Stripe (dashboard)

```
Stripe Account: BlackRoad OS, Inc.
Verification:
    Status: <pending/resolved>
    Required Docs: <list>
Connected Domains:
    - Login: <domain>
    - Webhooks: <url>
Environment:
    Test Keys: <present/not>
    Live Keys: <present/not>
```

---

## 8. Google Workspace

```
Status: Pending signup
Chosen Domain: <domain>
MX Records Needed:
    - ASPMX.L.GOOGLE.COM
    - ALT1.ASPMX.L.GOOGLE.COM
    - ALT2.ASPMX.L.GOOGLE.COM
    - ALT3.ASPMX.L.GOOGLE.COM
    - ALT4.ASPMX.L.GOOGLE.COM
DNS Applied In: <Cloudflare/GoDaddy>
SPF: v=spf1 include:_spf.google.com ~all
DMARC: <record>
```

---

## 9. USPTO & Trademark Infra

Open tabs:
- TSDR
- TM search
- Fees portal

```
Trademark: <mark>
Serial: <number>
Status: <LIVE / DEAD / Office Action / Pending>
Classes:
    <class list>
Renewals:
    <dates needed>
Connection to BlackRoad Infra:
    - Branding in repos
    - Website claims
```

---

## 10. Agents & Automations Mapping

```
Agent Name: <name>
Repo Home: <repo>
Runtime: <railway/vercel/do>
Endpoints:
    /health
    /v1/<task>
Connected Data:
    - Postgres: <url>
    - Redis: <url>
GitHub Workflows:
    - <workflow name>
Secrets:
    <GitHub secrets key list>
```

---

## 11. Error State Queue

Current known issues:
- `blackroad.io` → 521 Web server is down
- `blackroad-os-operator-production` → error page
- Missing DNS between Cloudflare and Railway
- Missing Pages deployments
- Vercel projects not connected to repos
- GitHub repos missing `.github/workflows`
- Railway health endpoints missing

---

## 12. Codex Prompt Templates

### 12.1 DNS Fix Prompt
```
Codex: Map domain <domain> to <target>.
Create CNAME @ or A records as needed.
Ensure proxy = <on/off>.
Enable Full SSL.
```

### 12.2 Railway Fix Prompt
```
Codex: Verify /health on <service>.
If failing, scaffold minimal FastAPI app with /health.
Push to repo <repo>.
Deploy automatically via Railway.
```

### 12.3 GitHub Workflow Fix Prompt
```
Codex: Add CI/CD workflow to <repo>.
Steps:
  - install deps
  - run tests
  - deploy to Railway/Vercel
```

### 12.4 Cloudflare Pages Fix Prompt
```
Codex: Deploy <repo> as Cloudflare Pages project <name>.
Bind to <domain>.
```

---

## 13. Platform Integrations

All platform configurations are centralized in the `/integrations` directory.

### 13.1 Cloud Platforms

#### DigitalOcean Droplets
```
Config: integrations/cloud/digitalocean/config.yaml
Script: integrations/cloud/digitalocean/deploy.sh
Purpose: VPS hosting for agents and API servers

Droplet Types:
  - blackroad-api-production (s-2vcpu-4gb)
  - blackroad-api-staging (s-1vcpu-2gb)
  - blackroad-agent-runner (s-4vcpu-8gb)

Required Secrets:
  - DIGITALOCEAN_TOKEN
  - DO_VPC_UUID
```

#### Vercel
```
Config: vercel.json (root)
Framework: Astro
Regions: iad1, sfo1, cdg1
Features:
  - Static site hosting
  - Edge functions
  - Preview deployments
```

#### Cloudflare Workers
```
Config: wrangler.toml (root)
Features:
  - Edge computing
  - KV storage
  - Cron triggers

Routes:
  - archive.blackroad.io/* (production)
  - archive-staging.blackroad.io/* (staging)
```

### 13.2 IoT & Edge

#### Raspberry Pi Fleet
```
Config: integrations/iot/raspberry-pi/config.yaml
Setup: integrations/iot/raspberry-pi/setup.sh

Devices:
  - blackroad-hub-01 (Pi 5, 8GB) - Home automation
  - blackroad-ai-edge-01 (Pi 5, 8GB) - AI inference
  - blackroad-dev-pi (Pi 4, 4GB) - Development

Services:
  - Docker + Docker Compose
  - Health check endpoint (:8080/health)
  - Prometheus Node Exporter (:9100)
```

---

## 14. Mobile App Integrations

### 14.1 Warp Terminal
```
Config: integrations/mobile/warp/config.yaml
Purpose: Modern terminal with AI assistance
Features:
  - SSH host configurations
  - Custom workflows
  - Team sharing
```

### 14.2 Shellfish SSH Client
```
Config: integrations/mobile/shellfish/config.yaml
Purpose: iOS SSH/SFTP client
Features:
  - Server connections
  - Port forwarding
  - Files app integration
  - Shortcuts automation
```

### 14.3 Working Copy
```
Config: integrations/mobile/working-copy/config.yaml
Purpose: Git client for iOS
Features:
  - Full Git support
  - GitHub integration
  - Files app provider
```

### 14.4 Pyto Python IDE
```
Config: integrations/mobile/pyto/config.yaml
Purpose: Python development on iOS
Features:
  - Python 3.12 runtime
  - pip package support
  - BlackRoad SDK scripts
```

---

## 15. AI/ML Model Registry

### 15.1 Hugging Face Integration
```
Config: integrations/ai/huggingface/config.yaml
Organization: BlackRoad-OS
Purpose: Model hosting and inference

Features:
  - Model Hub access
  - Inference Endpoints
  - Safe model registry
```

### 15.2 Approved Open Source Models

All models have been reviewed for safety compliance.
Full registry: `integrations/ai/models/registry.yaml`
Safety policy: `integrations/ai/models/safety-policy.md`

#### Large Language Models (~120B+ capacity)
| Model | Parameters | License | Status |
|-------|------------|---------|--------|
| Mistral 7B Instruct | 7B | Apache-2.0 | ✅ Approved |
| Llama 3.2 3B | 3B | Llama-3.2 | ✅ Approved |
| Qwen 2.5 7B | 7B | Apache-2.0 | ✅ Approved |
| Phi-3.5 Mini | 3.8B | MIT | ✅ Approved |
| Llama 3.1 70B | 70B | Llama-3.1 | ✅ Approved |
| Qwen 2.5 72B | 72B | Qwen | ✅ Approved |
| DeepSeek V3 | 671B MoE | DeepSeek | ✅ Approved |

#### Code Models
| Model | Parameters | License | Status |
|-------|------------|---------|--------|
| StarCoder2 7B | 7B | BigCode-OpenRAIL-M | ✅ Approved |
| Qwen Coder 7B | 7B | Apache-2.0 | ✅ Approved |

#### Embedding Models
| Model | Parameters | License | Status |
|-------|------------|---------|--------|
| BGE Large v1.5 | 335M | MIT | ✅ Approved |
| Nomic Embed v1.5 | 137M | Apache-2.0 | ✅ Approved |

### 15.3 Safety Requirements
- All models undergo safety review before approval
- No uncensored/jailbroken variants allowed
- Runtime guardrails required for all deployments
- See `integrations/ai/models/safety-policy.md` for details

---

## 16. Productivity Tools

### 16.1 Asana
```
Config: integrations/productivity/asana/config.yaml
Purpose: Project management
Features:
  - Sprint boards
  - GitHub sync
  - Automation rules
```

### 16.2 Notion
```
Config: integrations/productivity/notion/config.yaml
Purpose: Documentation and knowledge base
Features:
  - Database templates
  - Team directory
  - Meeting notes
```

---

## 17. Authentication & Payments

### 17.1 Clerk (Authentication)
```
Config: integrations/auth/clerk/config.yaml
Features:
  - OAuth (Google, GitHub, Apple)
  - Magic links
  - MFA support
  - Organizations (multi-tenancy)
  - Custom JWT claims
```

### 17.2 Stripe (Payments)
```
Config: integrations/payments/stripe/config.yaml
Products:
  - Free ($0/mo)
  - Pro ($19/mo)
  - Team ($49/seat/mo)
  - Enterprise (custom)
Features:
  - Subscriptions
  - Usage-based billing
  - Customer portal
  - Webhooks
```

---

## 18. Networking & Tunnels

### 18.1 Cloudflare Tunnel (Recommended)
```
Config: integrations/networking/tunnels/config.yaml
Setup: integrations/networking/tunnels/cloudflared-setup.sh
Features:
  - Zero inbound ports
  - DDoS protection
  - Global edge network
```

### 18.2 Other Options
- **ngrok**: Development and testing
- **Tailscale**: Private mesh network
- **WireGuard**: VPN tunnels
- **FRP**: Self-hosted reverse proxy

---

## 19. Environment Variables

Full template: `integrations/.env.example`

Required secrets (set in CI/CD):
```
# Cloud
RAILWAY_TOKEN
VERCEL_TOKEN
CLOUDFLARE_API_TOKEN
DIGITALOCEAN_TOKEN

# Auth
CLERK_SECRET_KEY
CLERK_WEBHOOK_SECRET

# Payments
STRIPE_SECRET_KEY
STRIPE_WEBHOOK_SECRET

# AI
HF_TOKEN
OPENAI_API_KEY
ANTHROPIC_API_KEY

# Productivity
ASANA_API_TOKEN
NOTION_API_KEY

# Tunnels
TUNNEL_TOKEN
NGROK_AUTHTOKEN
```

---

## 20. Export Options
- **Push to repo:** Drop this file into the target repo (e.g., `blackroad-os-infra/CONNECTION_MAP.md`).
- **Convert to Google Doc:** Export with structured headings for quick sharing across teams.
- **Generate configs:** Use templates in `/integrations` to bootstrap new services.
