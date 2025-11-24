# Contributing to blackroad-os-archive

Thank you for your interest in contributing to the BlackRoad OS Archive! This repository serves as the long-term memory and institutional record for the BlackRoad OS ecosystem.

## 🎯 What This Archive Is

The `blackroad-os-archive` is:
- 📚 A permanent record of finalized IP, decisions, and milestones
- 🕰️ A time capsule capturing ecosystem snapshots
- 🧵 A cross-repo index for historical context
- 🔐 A clean, text-based, auditable ledger

## ✅ Before Contributing

1. **Read the Cover Sheet:** Start with [`meta/ARCHIVE_COVER_SHEET.md`](./ARCHIVE_COVER_SHEET.md)
2. **Check the Index:** Browse [`catalog/INDEX.md`](../catalog/INDEX.md) to avoid duplicates
3. **Review Workflows:** Understand the process in [`workflows/`](../workflows/)
4. **Ensure Finalization:** Content should be finalized in its source repo first

## 📝 How to Contribute

### Option 1: Request Archival (Recommended)

1. **Finalize your content** in the appropriate source repo
2. **Create an issue** in `blackroad-os-archive` with:
   - Title: `[Archive Request] Your Document Title`
   - Link to source content (repo + path + commit SHA)
   - Category (IP, Snapshot, Legal, Workflow, etc.)
   - Reason for archival
   - Any special context or metadata
3. An AI agent or maintainer will process the request

### Option 2: Direct PR

If you're comfortable with the process:

1. **Fork and clone** this repository
2. **Create a new branch:** `git checkout -b archive/your-topic-name`
3. **Add your content:**
   - Place in appropriate directory (`ip/`, `legal-finance/`, etc.)
   - Follow the metadata header format (see below)
   - Use clean, standalone Markdown
4. **Update the index:**
   - Add entry to `catalog/INDEX.md`
   - Update `catalog/timeline.md` if milestone-worthy
5. **Create a PR** with:
   - Clear description of what's being archived
   - Link to source material
   - Explanation of why it's archive-worthy

## 📋 Metadata Header Format

Every archived document **must** include this metadata header:

```markdown
# [Document Title]

**Category:** [Snapshot | IP | Legal | Finance | Workflow | Protocol]  
**Source Repo:** `BlackRoad-OS/[repo-name]`  
**Source Path:** `path/to/original/file.md`  
**Source Commit:** `[git SHA]`  
**Archived On:** YYYY-MM-DD  
**Archived By:** [agent:name | human:username]  
**Status:** [Final | Living Document | Historical]

---

[Content begins here]
```

## 🚫 What NOT to Contribute

Do **NOT** add:
- ❌ Secrets (API keys, tokens, passwords, private keys)
- ❌ Drafts or work-in-progress (archive only finalized content)
- ❌ Large binary files (images, PDFs, zip files, datasets)
- ❌ Personal identifying information (PII)
- ❌ Sensitive business data not intended for public record
- ❌ Raw logs or operational data (unless summarized)

## 📁 Directory Structure

```
blackroad-os-archive/
├── catalog/          # Indexes and catalogs
│   ├── INDEX.md      # Master index (update this!)
│   ├── services.md   # Repo/service catalog
│   └── timeline.md   # Chronological milestones
├── snapshots/        # Point-in-time ecosystem snapshots
│   └── YYYY-MM-DD/   # Date-based snapshot folders
├── ip/               # Intellectual property artifacts
├── legal-finance/    # Legal and financial documentation
├── workflows/        # Process documentation
└── meta/             # Archive documentation (this file!)
```

## 🔍 Review Process

1. **Automated Checks:**
   - No secrets detected
   - Proper metadata format
   - Links are valid
   - No large files

2. **Human Review:**
   - Content is finalized and appropriate for archive
   - Metadata is complete and accurate
   - Category and location are correct
   - Index is properly updated

3. **Merge:**
   - Once approved, your contribution becomes part of the permanent archive
   - Thank you for contributing to BlackRoad OS history! 🙏

## 📂 Snapshot Contributions

For ecosystem snapshots:

1. **Create dated directory:** `snapshots/YYYY-MM-DD/`
2. **Include these files:**
   - `README.md` - Overview and context for this snapshot
   - `orgs-overview.md` - GitHub orgs and their roles
   - `repos-overview.md` - List of repos with descriptions
   - `infra-state.md` - Infrastructure and hosting state
   - `ip-highlights.md` - Major IP pieces at this time
3. **Add metadata** explaining:
   - Why this snapshot was taken
   - What changed since last snapshot
   - Any significant events or milestones

## 🔁 Workflow Updates

When updating workflows in `workflows/`:

1. Ensure changes reflect current practice
2. Update last-modified date in the document
3. Explain what changed and why in your PR
4. Get review from someone familiar with the process

## 🎨 Style Guidelines

- **Use Markdown** for all content (`.md` files)
- **Write clearly** - future agents and humans will read this
- **Be concise** - archive the essential, not everything
- **Link generously** - connect to source repos and related docs
- **Use emoji sparingly** - for readability, not decoration (unless it's part of BlackRoad's style)
- **Date format:** Always use `YYYY-MM-DD` for consistency

## 🤖 For AI Agents

If you're an AI agent contributing to this archive:

1. **Follow the system prompt** in `.github/copilot-instructions.md`
2. **Use proper metadata format** - this is not optional
3. **Update indexes** - don't forget `catalog/INDEX.md`
4. **Verify no secrets** - scan content before committing
5. **Create clean commits** - descriptive messages, logical grouping
6. **Identify yourself** in the "Archived By" field as `agent:[your-name]`

## ❓ Questions?

- **File an issue** for questions about the archival process
- **Start a discussion** for process improvement ideas
- **Read the workflows** in `workflows/` for detailed guidance
- **Check the cover sheet** at `meta/ARCHIVE_COVER_SHEET.md`

## 🙏 Thank You

Every contribution helps build the collective memory of BlackRoad OS. Whether you're archiving a major protocol or fixing a typo, you're helping ensure this ecosystem's history is preserved with clarity and care.

**Happy archiving!** 🕯️📚💚
