# 🗺️ BlackRoad OS — Full Connection & Integration Mapping

**Last updated:** 2025-11-24  
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

## 13. Export Options
- **Push to repo:** Drop this file into the target repo (e.g., `blackroad-os-infra/CONNECTION_MAP.md`).
- **Convert to Google Doc:** Export with structured headings for quick sharing across teams.
