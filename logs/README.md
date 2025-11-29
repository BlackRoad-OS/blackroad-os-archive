# 🚀 Deploy Logs

**Purpose:** What shipped, when, from where, by whom/which agent  
**Updated:** 2025-11-25

---

## Overview

This directory contains **deploy logs** — append-only records of what was deployed, when, and by whom.

## 🧪 Invariants

Every deploy log entry must have:
- 🧬 **Stable ID:** `DEPLOY-YYYYMMDD-XXX`
- ⏱️ **Timestamp:** Precise with timezone/UTC
- 🧭 **Context tags:** env, service, org, agent

## Entry Format

```markdown
# Deploy: [service-name] @ YYYY-MM-DD HH:MM:SS UTC

**ID:** DEPLOY-YYYYMMDD-XXX  
**Service:** [service-name]  
**Env:** [production | staging | development]  
**Version:** [version-tag or commit SHA]  
**Agent:** [agent:name | human:username]  
**Source Repo:** `BlackRoad-OS/[repo-name]`  
**Source Commit:** [full git SHA]

---

## Summary
[Brief description of what was deployed]

## Changes Included
- [Change 1]
- [Change 2]

## Related
- [Links to PRs, issues, or other logs]
```

## File Naming

Use: `YYYY-MM-DD-service-name-XXX.md`

Example: `2025-11-25-blackroad-api-001.md`

---

*This is append-only history. Corrections are new entries that reference old ones.* 🧾
