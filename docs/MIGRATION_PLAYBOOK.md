# Migration Playbook

Use this checklist to migrate legacy or out-of-date repos into the modern BlackRoad OS constellation.

1. **Catalog it**
   - Add the repo entry to `catalog/repos.yaml` with status `legacy` or `archived`.
   - Include owner handles, tags, and any known domains.

2. **Generate and fill a Cover Sheet**
   - Run `npm run generate:covers` to create a skeleton if missing.
   - Complete the narrative, history, and why-it-matters sections in `/covers/<repo>.cover.md`.

3. **Decide the path forward**
   - Choose whether to merge into a core repo, split into packs, or deprecate.
   - Note the recommended action on the cover sheet (`keep-live`, `snapshot`, `deprecate`, or `merge`).

4. **Link to the canonical destination**
   - Update the cover sheet to reference modern equivalents (e.g., `blackroad-os-core`, `blackroad-os-operator`).
   - Set the GitHub repo status to `archived` if it will no longer receive updates.

5. **Update infrastructure + docs**
   - Ensure redirects or gateway rules are in place via `blackroad-os-operator` and `blackroad-os-api-gateway`.
   - Add cross-links in `blackroad-os-docs` or Prism Console so stakeholders can find the new home.

6. **Snapshot (text-only) references**
   - Document snapshot metadata in `/snapshots/` if necessary (never store binaries here).

7. **Validate**
   - Run `npm run validate` to check schema compliance and ensure legacy items have cover sheets.
