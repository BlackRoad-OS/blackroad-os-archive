---
id: blackroad-os-archive
title: BlackRoad OS Archive
type: repo
status: active
timeframe: 2024-
primary_repo: blackroad-os-archive
linked_repos:
  - blackroad-os-docs
  - blackroad-os-infra
  - blackroad-os-prism-console
summary: Canonical catalog of repositories, domains, trademarks, and archive cover sheets for the BlackRoad constellation.
why_it_matters: Provides a single source of truth for what exists, its status, and how to preserve it.
risk_if_lost: Institutional memory would fragment and teams could not coordinate migrations or preservation.
recommended_action: keep-live
---

# BlackRoad OS Archive – Archive Cover Sheet

## Narrative
This repo maintains the text-first archive for BlackRoad OS, holding catalogs, schemas, and cover sheets. It is designed to be lightweight and free of binaries while pointing to where artifacts live.

## History
Created to consolidate disparate spreadsheets, docs, and chat threads about the BlackRoad constellation into a searchable, validated index.

## Current Role
The archive curates repos, domains, trademarks, and people references, runs validation to keep metadata fresh, and seeds cover sheets for every major project.

## Dependencies
- References infrastructure details from `blackroad-os-infra` for storage locations.
- Links to public-facing explanations in `blackroad-os-docs`.
- Surfaces metadata into `blackroad-os-prism-console` dashboards.

## Migration / Future
Automate syncing with GitHub orgs, integrate with docs publishing, and add snapshot manifests in `snapshots/` as projects transition to legacy status.
