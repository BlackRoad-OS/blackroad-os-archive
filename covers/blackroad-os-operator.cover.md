---
id: blackroad-os-operator
title: BlackRoad OS Operator
type: repo
status: active
timeframe: 2023-
primary_repo: blackroad-os-operator
linked_repos:
  - blackroad-os-core
  - blackroad-os-api-gateway
  - blackroad-os-infra
summary: Deployment orchestrator and control-plane automation for BlackRoad OS services.
why_it_matters: Keeps services converged, declarative, and policy-compliant across environments.
risk_if_lost: Drift would increase and deployments would become manual and brittle.
recommended_action: keep-live
---

# BlackRoad OS Operator – Archive Cover Sheet

## Narrative
The operator encodes deployment pipelines, rollout strategies, and policy enforcement for the BlackRoad constellation. It provides the reconciliation logic that keeps staging and production aligned.

## History
Evolved from a collection of Terraform scripts and GitHub Actions, the operator centralized deployment definitions into a coherent controller-driven workflow.

## Current Role
Today it triggers builds, applies manifests, and coordinates configuration for the API, core, and surface repos. It integrates with observability hooks to gate releases.

## Dependencies
- Depends on `blackroad-os-infra` for base infrastructure and cluster definitions.
- Coordinates with `blackroad-os-api-gateway` for routing updates.
- Deploys workloads from `blackroad-os-core`, `blackroad-os-api`, and `blackroad-os-web`.

## Migration / Future
Move toward full GitOps parity, expand policy-as-code coverage, and wire archive catalog metadata into release dashboards.
