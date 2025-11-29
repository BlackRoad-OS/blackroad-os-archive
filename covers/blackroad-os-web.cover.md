---
id: blackroad-os-web
title: BlackRoad OS Web
type: repo
status: active
timeframe: 2023-
primary_repo: blackroad-os-web
linked_repos:
  - blackroad-os-core
  - blackroad-os-api
  - blackroad-os-brand
summary: Public-facing web experience and marketing layer for BlackRoad OS and its packs.
why_it_matters: Serves as the canonical front door and narrative surface for the ecosystem.
risk_if_lost: Brand presence and onboarding funnels would disappear, weakening discoverability.
recommended_action: keep-live
---

# BlackRoad OS Web – Archive Cover Sheet

## Narrative
This repo powers the primary marketing site, funneling visitors into docs, console, and pack entry points. It showcases launches, brand language, and status updates for the constellation.

## History
Originally launched as a static site, it evolved to integrate API-driven content, release announcements, and richer product storytelling as BlackRoad OS expanded.

## Current Role
The web repo orchestrates the front door experience, pulling metadata from the docs and archive catalogs while exposing links into Prism Console and docs.

## Dependencies
- Consumes service metadata from `blackroad-os-api`.
- Aligns on branding assets defined in `blackroad-os-brand`.
- Publishes updates referenced by `blackroad-os-docs`.

## Migration / Future
Move toward componentized content sourcing from the archive catalog and ensure preview environments are wired through the operator for rapid iteration.
