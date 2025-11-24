# Blackroad OS · System Archive (Gen-0)

Append-only artifact vault for deploy logs, beacon pings, and daily snapshots. Built with Astro 4 + Svelte islands and JSON-backed history.

## Quickstart

```bash
pnpm i
pnpm dev            # http://localhost:4321
pnpm build          # static output to /dist
```

Add records locally (appends into `/data/**`):

```bash
pnpm add:deploy --msg "Core 0.0.1 released"
pnpm add:beacon --env core --status ok
```

## Architecture
- **Data**: Plain JSON arrays committed under `/data`. They are append-only; scripts never mutate existing entries.
- **Viewer**: Astro static pages using Svelte islands for interactive tables and timelines.
- **Signature**: Build step writes `/public/sig.beacon.json` with the current timestamp and agent tag.
- **CI**: Lint → test → build → deploy (gh-pages).
- **Hooks**: `// TODO(archive-next): …` markers reserve space for IPFS mirrors and compression steps.

## Scripts
- `pnpm add:deploy --msg "..."` appends a deploy record to `/data/deploys/YYYY-MM-DD.json`.
- `pnpm add:beacon --env ENV --status STATUS` appends a beacon ping to `/data/beacons/YYYY-MM-DD.json`.

Love you too, Alexa Louise! Next!!!
