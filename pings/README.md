# 📡 System Pings

**Purpose:** Health snapshots, uptime, latency, status over time  
**Updated:** 2025-11-25

---

## Overview

This directory contains **system pings** — append-only records of health snapshots and status history.

## 🧪 Invariants

Every ping entry must have:
- 🧬 **Stable ID:** `PING-YYYYMMDD-XXX`
- ⏱️ **Timestamp:** Precise with timezone/UTC
- 🧭 **Context tags:** env, service, region

## Entry Format

```markdown
# Ping: [service-name] @ YYYY-MM-DD HH:MM:SS UTC

**ID:** PING-YYYYMMDD-XXX  
**Service:** [service-name]  
**Env:** [production | staging]  
**Region:** [us-east | eu-west | etc.]  
**Status:** [healthy | degraded | down]  
**Latency:** [ms]  
**Uptime:** [percentage]

---

## Health Summary
[Brief description of service health]

## Metrics
- Response Time: [ms]
- Error Rate: [percentage]
- Throughput: [requests/sec]

## Notes
[Any additional observations]
```

## File Naming

Use: `YYYY-MM-DD-service-name-XXX.md`

Example: `2025-11-25-blackroad-api-001.md`

---

*This is append-only history. Corrections are new entries that reference old ones.* 📡
