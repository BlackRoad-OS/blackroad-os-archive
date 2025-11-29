# 🧾 blackroad-os-archive

> **Memory Vault 📡 — Append-only archive for deploy logs, beacon maps, ping history, and key system artifacts, served via archive.blackroad.io**

---

## 🎯 Mission

`blackroad-os-archive` is the **immutable memory** of the BlackRoad OS ecosystem. It serves to:

- 🧾 **Store logs, snapshots, and artifacts** so we can always reconstruct "what happened when"
- 📡 **Feed Prism/Operator/Agents** with trustworthy historical data
- 🏛️ **Be the institutional memory** — a calm, ordered space where 10,000 agents can answer "what happened when, and why?"

Think of it as the **Library of Alexandria for BlackRoad OS** 🕯️💚

---

## 🏗️ What This Repo Owns (✅)

### 🧾 Append-Only History
- **Deploy logs** — what shipped, when, from where, by whom/which agent 🚀
- **System pings & health snapshots** — uptime, latency, status over time 📡
- **Beacon maps** — which services/envs/orgs are alive + reachable 🗺️

### 📦 Artifacts
- **Key system snapshots** — config exports, schema snapshots, diagrams 📸
- **Important reports** — incident postmortems, infra audits, upgrade notes 📑
- **Serialized state bundles** — "state at time T" snapshots where needed 🧬

### 📡 Archive Feeds
Streams that other systems can read:
- **Prism Console dashboards** 🕹️
- **Operator workflows** (trend-aware decisions) ⚙️
- **Research/analytics** (latency, failure patterns) 🧪

### 🔍 Query & Indexing (Lightweight)
- Index by time, env, service, region, incident ID where possible ⏱️
- Simple APIs/paths for "list artifacts for X day/week/incident" 🧭

---

## 🚫 What This Repo Does NOT Own

- 🚫 Live runtime logic → `blackroad-os-core`, `-web`, `-api`, `-operator` 💻
- 🚫 Infra definitions → `blackroad-os-infra` ☁️
- 🚫 Brand system → `blackroad-os-brand` 🎨
- 🚫 Handbook / policies → `blackroad-os-home` 🏠
- 🚫 Main docs → `blackroad-os-docs` 📚
- 🚫 Raw math/theory → `blackroad-os-research` 🧪

---

## 📁 Structure

```
blackroad-os-archive/
├── catalog/              # 📇 Indexes and catalogs
│   ├── INDEX.md          # Master index of all archived content
│   ├── services.md       # Repository and service catalog
│   └── timeline.md       # Chronological milestone map
├── snapshots/            # 🕰️ Point-in-time ecosystem captures
│   └── YYYY-MM-DD/       # Dated snapshot directories
├── logs/                 # 🚀 Deploy logs and system events
├── pings/                # 📡 Health pings and status history
├── beacons/              # 🗺️ Beacon maps and service reachability
├── artifacts/            # 📸 System artifacts and state bundles
├── reports/              # 📑 Postmortems, audits, upgrade notes
├── ip/                   # 🧬 Intellectual property artifacts
├── legal-finance/        # ⚖️ Legal and financial documentation
├── workflows/            # 🔁 Process documentation
│   ├── archive-workflow.md
│   ├── snapshot-workflow.md
│   └── ip-registration-workflow.md
├── meta/                 # 🧾 Archive documentation
│   ├── ARCHIVE_COVER_SHEET.md
│   └── CONTRIBUTING.md
└── .github/
    └── copilot-instructions.md  # 🤖 AI agent system prompt
```

---

## 🧪 Invariants (VERY IMPORTANT)

### Archive is **APPEND-ONLY**
- ✅ New entries can be added
- ✅ Corrections are new entries that *reference* old ones
- 🚫 Existing history is not silently edited or deleted

### Every Record Must Have
- 🧬 A **stable ID**
- ⏱️ A **precise timestamp** (with timezone/UTC)
- 🧭 **Context tags** (env, service, org, incident, agent if applicable)

---

## 🔐 Security & Compliance

### Data here may be **compliance-relevant**:
- ⚖️ Treat as audit-grade: logs must be trustworthy
- 🔐 No secrets (passwords, raw tokens, private keys) 🚫
- 🧼 Avoid sensitive PII; use opaque IDs where possible

### For finance/identity/compliance-critical events:
Tag clearly, e.g.: `// COMPLIANCE-SENSITIVE ARCHIVE RECORD`

**No Secrets Policy:**
- ❌ No API keys, tokens, passwords
- ❌ No database credentials
- ❌ No private keys or certificates
- ✅ Only clean, text-based documentation

---

## 📏 Design Principles

`blackroad-os-archive` = **"what happened"**, not "what should happen":
- 🧭 This is history, not business logic
- 🧾 Prefer explicit, structured formats over free-text blobs

Every artifact/log format should answer:
1. ⏱️ **When** did this happen?
2. 🧭 **What** system/env/service/agent did it involve?
3. 🧬 **What is the minimum data** needed to reconstruct the event?

---

## 🚀 Quick Start

### For Browsing:
1. Start with [`catalog/INDEX.md`](catalog/INDEX.md) - Master index
2. Check [`catalog/timeline.md`](catalog/timeline.md) - Chronological view
3. Browse [`snapshots/`](snapshots/) - Point-in-time captures

### For Contributing:
1. Read [`meta/ARCHIVE_COVER_SHEET.md`](meta/ARCHIVE_COVER_SHEET.md) - What this archive is
2. Review [`meta/CONTRIBUTING.md`](meta/CONTRIBUTING.md) - How to contribute
3. Check [`workflows/`](workflows/) - Process documentation

### For AI Agents:
1. Read [`.github/copilot-instructions.md`](.github/copilot-instructions.md) - Your system prompt
2. Review workflows in [`workflows/`](workflows/)
3. Follow the pre-commit checklist before making changes

---

## 📚 Key Documents

- **[Archive Cover Sheet](meta/ARCHIVE_COVER_SHEET.md)** - The "front door" to the archive
- **[Archive Workflow](workflows/archive-workflow.md)** - How content gets finalized and archived
- **[Snapshot Workflow](workflows/snapshot-workflow.md)** - How to capture ecosystem state
- **[IP Registration Workflow](workflows/ip-registration-workflow.md)** - How to bless intellectual property
- **[Contributing Guidelines](meta/CONTRIBUTING.md)** - How to add to the archive

---

## 🔁 How It Works

### Archival Process:
```
Draft (Source Repo) → Review → Archive → Canonical Status
```

1. Content is created and finalized in source repos (research, docs, infra)
2. Label applied: `Status: Ready for Archive`
3. Archive copy created with metadata header
4. Indexes updated, PR created and reviewed
5. Merged - now canonical reference version

### Snapshot Process:
```
Monthly/Milestone → Capture State → Document → Archive
```

1. Snapshot triggered (monthly, milestone, or on-demand)
2. Ecosystem state captured (orgs, repos, infra, IP)
3. Context and changes documented
4. Snapshot archived with full metadata

---

## 🎯 Success Criteria

If a human/agent is debugging something scary and lands here, they should be able to:

1. 🔍 **Reconstruct the sequence** of key events around a deploy/incident
2. 📸 **See how the system looked** (services, health, configs) at a specific point in time
3. 📊 **Feed Prism/Operator/Research** with reliable historical data without guessing

---

## 🧬 Local Emoji Legend

| Emoji | Meaning |
|-------|---------|
| 🧾 | Archive / history |
| 📡 | Pings / beacons / signals |
| 🚀 | Deploys / releases |
| 🗺️ | Maps of services/envs |
| ⏱️ | Timestamps / timelines |
| 📑 | Reports / postmortems |
| ⚖️ | Compliance-sensitive records |
| 📸 | Snapshots / captures |
| 🧬 | IP / state bundles |

---

## 📊 Current State

- **Total Snapshots:** 1 (Initial: 2025-11-24)
- **Total IP Artifacts:** 1 (Agent Soul Seeds intake: 2025-11-28)
- **Total Workflows:** 3 (Archive, Snapshot, IP Registration)
- **Archive Status:** ✅ Initialized and operational

---

## 🎯 What Belongs Here

### ✅ Archive-Worthy:
- 🚀 **Deploy logs** — what shipped, when, from where
- 📡 **System pings** — health snapshots, uptime history
- 🗺️ **Beacon maps** — service/env reachability
- 📸 **System snapshots** — configs, schemas, diagrams
- 📑 **Reports** — postmortems, audits, upgrade notes
- 🧬 **Finalized IP** — protocols, frameworks, research
- ⚖️ **Legal/finance** — corporate structure, contracts (sanitized)

### ❌ NOT Archive-Worthy:
- 🚫 Work-in-progress drafts
- 🚫 Secrets or credentials
- 🚫 Large binary files
- 🚫 Raw logs or operational data (unless summarized)
- 🚫 Temporary notes

---

## 🔐 Quality Standards

**Quality Standards:**
- All content is Markdown or small text configs
- Every item has complete metadata
- Indexes are kept current
- Links are functional
- History is clean and professional

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](meta/CONTRIBUTING.md).

**Quick Links:**
- [Request archival](../../issues/new) - Create an issue to archive content
- [Report issue](../../issues/new) - Report problems with the archive
- [Suggest improvement](../../discussions/new) - Propose process improvements

---

## 📞 Support

- **Issues:** File in this repo
- **Discussions:** Use GitHub Discussions
- **Documentation:** See [`meta/`](meta/) directory

---

## 📜 License

[To be determined]

---

**Remember:** This archive is designed to last. Every addition should make the history clearer, not noisier. Quality over quantity. Clarity over completeness. 🕯️💚
# Blackroad OS · System Archive (Gen-0)

Append-only artifact vault for deploy logs, beacon pings, and daily snapshots. Built with Astro 4 + Svelte islands and JSON-backed history.

## Quickstart

```bash
pnpm i
pnpm dev            # http://localhost:4321
pnpm build          # static output to /dist
```

Add records locally (appends into `/data/**`):

```bash
pnpm add:deploy --msg "Core 0.0.1 released"
pnpm add:beacon --env core --status ok
```

## Architecture
- **Data**: Plain JSON arrays committed under `/data`. They are append-only; scripts never mutate existing entries.
- **Viewer**: Astro static pages using Svelte islands for interactive tables and timelines.
- **Signature**: Build step writes `/public/sig.beacon.json` with the current timestamp and agent tag.
- **CI**: Lint → test → build → deploy (gh-pages).
- **Hooks**: `// TODO(archive-next): …` markers reserve space for IPFS mirrors and compression steps.

## Scripts
- `pnpm add:deploy --msg "..."` appends a deploy record to `/data/deploys/YYYY-MM-DD.json`.
- `pnpm add:beacon --env ENV --status STATUS` appends a beacon ping to `/data/beacons/YYYY-MM-DD.json`.

# blackroad-os-archive

Text-first archive and catalog for the BlackRoad OS constellation. This repo maintains validated indexes of repositories, domains, trademarks, and people handles, plus Archive Cover Sheets that explain why each asset matters. No binaries live here—only metadata, templates, and scripts to keep the archive current.

## Key directories
- `catalog/` – YAML catalogs for repos, domains, trademarks, and people.
- `covers/` – Archive Cover Sheets (YAML front-matter + narrative) for every major repo.
- `schemas/` – JSON Schemas validating catalog and cover formats.
- `scripts/` – Utilities to scan GitHub orgs, refresh catalogs, generate cover skeletons, and validate data.
- `snapshots/` – Text descriptions of logical snapshots (never binary dumps).
- `docs/` – Overview, templates, and migration playbooks for maintaining the archive.

## Scripts
- `npm run typecheck` – TypeScript checks for scripts.
- `npm run validate` – Validate catalogs and cover sheets against schemas.
- `npm run generate:covers` – Generate missing cover sheet skeletons from the catalog.
- `npm run refresh:repos` – Merge GitHub data into `catalog/repos.yaml` (requires `GITHUB_TOKEN` and `GITHUB_ORGS`).
