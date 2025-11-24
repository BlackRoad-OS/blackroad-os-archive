# 📚 BlackRoad OS Services & Repositories Catalog

**Last Updated:** 2025-11-24  
**Purpose:** Canonical list of all BlackRoad OS repositories and services  
**Maintained By:** Archive Team & AI Agents

---

## Overview

This catalog provides a comprehensive view of the BlackRoad OS ecosystem, listing all repositories, their purposes, and links to relevant archive content.

---

## 🏛️ Organizations

### BlackRoad-OS
- **Type:** Primary organization
- **Purpose:** Main ecosystem for BlackRoad OS
- **Visibility:** Public
- **URL:** https://github.com/BlackRoad-OS
- **Status:** Active

---

## 📦 Repositories

### Core Infrastructure

#### blackroad-os-archive
- **Purpose:** Archive, ledger, and time capsule for BlackRoad OS
- **Status:** Active
- **Language:** Markdown
- **URL:** https://github.com/BlackRoad-OS/blackroad-os-archive
- **Archive Status:** Self-archiving repository
- **Key Content:**
  - Ecosystem snapshots
  - IP registry
  - Historical records
  - Workflow documentation

#### blackroad-os-core
- **Purpose:** Core platform and runtime (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as content is archived*

#### blackroad-os-api
- **Purpose:** API layer and service interfaces (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as content is archived*

#### blackroad-os-operator
- **Purpose:** Kubernetes operator or orchestration layer (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as content is archived*

---

### Documentation & Research

#### blackroad-os-docs
- **Purpose:** Primary documentation repository (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as finalized docs are archived*

#### blackroad-os-research
- **Purpose:** Research papers, IP development, experimental work (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as IP is registered*

---

### Infrastructure & DevOps

#### blackroad-os-infra
- **Purpose:** Infrastructure as code, deployment configs (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as infrastructure snapshots are archived*

---

### Brand & Design

#### blackroad-os-brand
- **Purpose:** Brand guidelines, design systems (assumed)
- **Status:** Assumed active
- **Archive Pointers:** *To be added as brand artifacts are archived*

---

## 🔗 Archive Integration

### How Repos Connect to Archive

**Source Repos → Archive Flow:**
1. Content created and refined in source repo
2. Finalized content labeled `Status: Ready for Archive`
3. Archive copy created in `blackroad-os-archive`
4. Catalog updated to link back to source
5. Archived version becomes canonical reference

### Archival Status by Repo

| Repository | Archived Items | Last Archival | Archive Location |
|------------|---------------|---------------|------------------|
| blackroad-os-archive | Self | 2025-11-24 | - |
| blackroad-os-core | 0 | - | - |
| blackroad-os-api | 0 | - | - |
| blackroad-os-operator | 0 | - | - |
| blackroad-os-docs | 0 | - | - |
| blackroad-os-research | 0 | - | - |
| blackroad-os-infra | 0 | - | - |
| blackroad-os-brand | 0 | - | - |

---

## 🎯 Repository Categories

### By Function:

**Platform:**
- blackroad-os-core
- blackroad-os-api
- blackroad-os-operator

**Development:**
- blackroad-os-research
- blackroad-os-docs

**Operations:**
- blackroad-os-infra
- blackroad-os-archive

**Brand:**
- blackroad-os-brand

### By Archive Activity:

**Active Archival Sources:**
- blackroad-os-research (expected for IP)
- blackroad-os-docs (expected for finalized docs)
- blackroad-os-infra (expected for architecture snapshots)

**Self-Archiving:**
- blackroad-os-archive (this repo)

**Pending Archival:**
- Others as content is created and finalized

---

## 🔄 Service Relationships

```
┌─────────────────────────────────────────┐
│         blackroad-os-archive            │
│      (Long-term memory & ledger)        │
└─────────────────────────────────────────┘
                    ↑
                    │ Archives finalized content from:
        ┌───────────┼───────────┐
        │           │           │
┌───────┴──────┐ ┌──┴────────┐ ┌┴──────────────┐
│ blackroad-os-│ │blackroad- │ │ blackroad-os- │
│   research   │ │ os-docs   │ │    infra      │
│   (IP dev)   │ │(finalized)│ │ (snapshots)   │
└──────────────┘ └───────────┘ └───────────────┘
```

---

## 📊 Ecosystem Statistics

**Current State (2025-11-24):**
- **Total Organizations:** 1 (BlackRoad-OS)
- **Total Repositories:** 8+ (some assumed)
- **Active Archive Sources:** 3 (research, docs, infra)
- **Archived Items:** 0 (from external repos)
- **Self-Archived Items:** Initial structure

---

## 🆕 Recently Added Repositories

*Track new repositories as they are created*

- **2025-11-24:** blackroad-os-archive (this repo)

---

## 📝 Maintenance Notes

### Update Triggers:
- New repository created → Add to catalog
- Repository archived → Update status
- First archival from repo → Update archive pointers
- Major repo purpose change → Update description

### Review Schedule:
- **Monthly:** Verify all repos listed and statuses current
- **Quarterly:** Review relationships and update diagrams
- **Annually:** Comprehensive audit of entire catalog

### Data Sources:
- GitHub API for repository lists
- Repository README files for descriptions
- Archive index for archival status
- Team input for purposes and statuses

---

## 🔍 Finding Content

### By Repository:
1. Find repo in catalog above
2. Check "Archive Pointers" for links
3. Follow links to specific archived items

### By Topic:
1. Check `catalog/INDEX.md` for topic categories
2. Use GitHub search within archive
3. Review `catalog/timeline.md` for chronological view

### By Date:
1. Check `snapshots/YYYY-MM-DD/repos-overview.md`
2. See historical view of repo landscape
3. Compare across snapshots for changes

---

## 🛠️ For Maintainers

**Adding a New Repository:**
```markdown
#### [repo-name]
- **Purpose:** [clear description]
- **Status:** Active | Archived | Deprecated
- **Language:** [primary language]
- **URL:** https://github.com/BlackRoad-OS/[repo-name]
- **Archive Pointers:** [links to archived content]
```

**Updating Archival Status:**
- Keep table current with each archival
- Update "Archive Pointers" with links
- Note in "Recently Added Repositories" if new

**Archive Integration Workflow:**
- See `workflows/archive-workflow.md` for full process
- Update this catalog as part of archival PR
- Link archive items back to source repos

---

**This catalog is a living document. Keep it current as the ecosystem evolves.** 🌌💚
