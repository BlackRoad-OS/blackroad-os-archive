---
id: blackroad-os-prism-console
title: BlackRoad OS Prism Console
type: repo
status: active
timeframe: 2024-
primary_repo: blackroad-os-prism-console
linked_repos:
  - blackroad-os-api
  - blackroad-os-core
  - blackroad-os-operator
summary: Administrative console for orchestrating modules, packs, and environment states across BlackRoad OS.
why_it_matters: Provides operators and creators with visibility and controls over deployments, packs, and telemetry.
risk_if_lost: Operational command surface would vanish, forcing manual scripts and reducing governance.
recommended_action: keep-live
---

# BlackRoad OS Prism Console – Archive Cover Sheet

## Narrative
Prism Console is the UI layer that surfaces system health, deployments, and configuration knobs in one workspace. It is the primary control plane for operators and creators managing packs and releases.

## History
The console started as a thin dashboard over CI outputs and gradually evolved into a fully-featured admin interface as the number of packs and environments grew.

## Current Role
Today Prism Console consumes APIs from the core and operator to show topology, push releases, and review alerts. It links out to docs and archive entries for context.

## Dependencies
- Fetches data from `blackroad-os-api`.
- Uses shared components from `blackroad-os-core` and branding from `blackroad-os-brand`.
- Depends on `blackroad-os-operator` for deployment actions.

## Migration / Future
Integrate catalog insights directly into the UI, add runbooks for archived components, and standardize access control flows.
