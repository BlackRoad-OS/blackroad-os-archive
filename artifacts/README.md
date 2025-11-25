# 📸 Artifacts

**Purpose:** System artifacts and state bundles — config exports, schema snapshots, diagrams  
**Updated:** 2025-11-25

---

## Overview

This directory contains **artifacts** — serialized "state at time T" bundles and important system exports.

## 🧪 Invariants

Every artifact must have:
- 🧬 **Stable ID:** `ARTIFACT-YYYYMMDD-XXX`
- ⏱️ **Timestamp:** Precise with timezone/UTC
- 🧭 **Context tags:** type, service, source

## Entry Format

```markdown
# Artifact: [artifact-name]

**ID:** ARTIFACT-YYYYMMDD-XXX  
**Type:** [config | schema | diagram | state-bundle]  
**Service:** [service-name]  
**Env:** [production | staging | etc.]  
**Captured At:** YYYY-MM-DD HH:MM:SS UTC  
**Captured By:** [agent:name | human:username]  
**Source:** `BlackRoad-OS/[repo-name]` @ `[commit]`

---

## Description
[What this artifact captures and why it's important]

## Content
[The actual artifact content or reference to external storage]

## Related
- [Links to related artifacts, deploys, or incidents]
```

## File Naming

Use: `YYYY-MM-DD-artifact-name-XXX.md`

Example: `2025-11-25-api-config-snapshot-001.md`

---

*This is append-only history. Corrections are new entries that reference old ones.* 📸
