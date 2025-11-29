# BlackRoad OS Archive Overview

The **BlackRoad OS Archive** is the canonical, text-first index for the BlackRoad constellation. It catalogs repositories, domains, trademarks, and people handles, and maintains Archive Cover Sheets that explain why each asset matters and how to preserve it. This repo is intentionally binary-free: it points to artifacts stored elsewhere and records how to retrieve or snapshot them.

## What lives here
- **Catalogs** in `/catalog/` for repos, domains, trademarks, and people.
- **Schemas** in `/schemas/` to validate catalog entries and cover sheets.
- **Archive Cover Sheets** in `/covers/` describing each major repo or project.
- **Scripts** in `/scripts/` to scan GitHub orgs, refresh catalogs, generate cover skeletons, and validate data.
- **Snapshots** in `/snapshots/` to describe logical snapshots (never binary blobs).

## How it pairs with other repos
- **blackroad-os-infra**: Source of infrastructure definitions and snapshot storage locations referenced from the archive.
- **blackroad-os-docs**: Public-facing documentation that can surface curated entries from the archive.
- **blackroad-os-research**: Home for experiments and theoretical work that the archive lists and tracks as experimental or legacy.

## Principles
- Text-first, no binary assets.
- Schema-validated to prevent drift.
- Clearly marked statuses (active, experimental, legacy, archived) with cover sheets for anything deprecated.
- Easy to regenerate and sync using the provided scripts.
