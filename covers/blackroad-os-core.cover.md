---
id: blackroad-os-core
title: BlackRoad OS Core
type: repo
status: active
timeframe: 2023-
primary_repo: blackroad-os-core
linked_repos:
  - blackroad-os-api
  - blackroad-os-operator
  - blackroad-os-infra
summary: Core substrate for orchestrating services, identity, and platform runtime across the constellation.
why_it_matters: Anchor for platform primitives, routing, and shared libraries that other repos depend on.
risk_if_lost: Core service graph and shared contracts would fragment, slowing every other repo.
recommended_action: keep-live
---

# BlackRoad OS Core – Archive Cover Sheet

## Narrative
BlackRoad OS Core holds the foundational runtime, shared contracts, and base services that knit together the constellation. It provides stable libraries, identity primitives, and platform APIs used by every pack and edge surface.

## History
The repo emerged as the convergence point for early BlackRoad services when separate prototypes needed common auth, logging, and configuration. It replaced ad-hoc glue with maintained modules and deployment conventions.

## Current Role
Today the core repo anchors platform dependencies and publishes reusable packages consumed by the API layer, operator pipelines, and packs. It acts as the canonical source for base images and common schema definitions.

## Dependencies
- Relies on `blackroad-os-operator` for deployment workflows.
- Publishes interfaces consumed by `blackroad-os-api` and `blackroad-os-web`.
- Shares infrastructure modules with `blackroad-os-infra`.

## Migration / Future
Continue hardening shared modules, keep release cadence aligned with operator rollouts, and prepare migration guides for any breaking changes so packs can update smoothly.
