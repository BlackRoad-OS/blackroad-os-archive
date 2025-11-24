# blackroad-os-archive

Text-first archive and catalog for the BlackRoad OS constellation. This repo maintains validated indexes of repositories, domains, trademarks, and people handles, plus Archive Cover Sheets that explain why each asset matters. No binaries live here—only metadata, templates, and scripts to keep the archive current.

## Key directories
- `catalog/` – YAML catalogs for repos, domains, trademarks, and people.
- `covers/` – Archive Cover Sheets (YAML front-matter + narrative) for every major repo.
- `schemas/` – JSON Schemas validating catalog and cover formats.
- `scripts/` – Utilities to scan GitHub orgs, refresh catalogs, generate cover skeletons, and validate data.
- `snapshots/` – Text descriptions of logical snapshots (never binary dumps).
- `docs/` – Overview, templates, and migration playbooks for maintaining the archive.

## Scripts
- `npm run typecheck` – TypeScript checks for scripts.
- `npm run validate` – Validate catalogs and cover sheets against schemas.
- `npm run generate:covers` – Generate missing cover sheet skeletons from the catalog.
- `npm run refresh:repos` – Merge GitHub data into `catalog/repos.yaml` (requires `GITHUB_TOKEN` and `GITHUB_ORGS`).
