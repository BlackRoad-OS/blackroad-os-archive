---
id: blackroad-os-api
title: BlackRoad OS API
type: repo
status: active
timeframe: 2023-
primary_repo: blackroad-os-api
linked_repos:
  - blackroad-os-core
  - blackroad-os-api-gateway
  - blackroad-os-operator
summary: Unified API surface exposing OS capabilities to web, console, and packs.
why_it_matters: Provides consistent, authenticated entry points for every client surface and integration.
risk_if_lost: Clients would fragment across legacy endpoints and lose a trusted contract for platform access.
recommended_action: keep-live
---

# BlackRoad OS API – Archive Cover Sheet

## Narrative
The API repo defines service contracts, request flows, and orchestration that present BlackRoad capabilities to all clients. It aligns SDKs, policies, and telemetry around a single gateway front door.

## History
Born from multiple microservice experiments, the API consolidated endpoints into a single spec, then layered on gateway policies and observability to stabilize external access.

## Current Role
It powers the public and partner-facing interfaces for the console, web, and packs, routing through the gateway and operator-managed deployments.

## Dependencies
- Deployed through `blackroad-os-operator` and fronted by `blackroad-os-api-gateway`.
- Consumes shared contracts from `blackroad-os-core`.
- Exposes data used by `blackroad-os-web` and Prism Console.

## Migration / Future
Continue converging legacy endpoints, adopt schema-first workflows with the archive catalog, and automate policy sync with the gateway repo.
