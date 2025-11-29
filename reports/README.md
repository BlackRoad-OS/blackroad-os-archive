# 📑 Reports

**Purpose:** Incident postmortems, infra audits, upgrade notes  
**Updated:** 2025-11-25

---

## Overview

This directory contains **reports** — important documents that summarize incidents, audits, and upgrades.

## 🧪 Invariants

Every report must have:
- 🧬 **Stable ID:** `REPORT-YYYYMMDD-XXX`
- ⏱️ **Timestamp:** Precise with timezone/UTC
- 🧭 **Context tags:** type, incident (if applicable)

## Report Types

### Postmortems 📑
After-action reports for incidents.

### Audits ⚖️
Infrastructure, security, or compliance audits.

### Upgrade Notes 🚀
Documentation of major system upgrades.

## Entry Format

```markdown
# Report: [report-title]

**ID:** REPORT-YYYYMMDD-XXX  
**Type:** [postmortem | audit | upgrade-notes]  
**Incident ID:** [if applicable]  
**Created:** YYYY-MM-DD HH:MM:SS UTC  
**Author:** [agent:name | human:username]

---

## Executive Summary
[1-2 paragraph overview]

## Timeline
- **HH:MM:** Event 1
- **HH:MM:** Event 2

## Impact
[What was affected]

## Root Cause
[What caused the issue]

## Action Items
- [ ] Action 1
- [ ] Action 2

## Lessons Learned
[Key takeaways]
```

## File Naming

Use: `YYYY-MM-DD-report-type-XXX.md`

Example: `2025-11-25-postmortem-api-outage-001.md`

---

*For compliance-sensitive records, tag clearly:* `// COMPLIANCE-SENSITIVE ARCHIVE RECORD` ⚖️
