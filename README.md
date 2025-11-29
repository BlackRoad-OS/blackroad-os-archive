# 🕯️ blackroad-os-archive

> **Archive, Ledger, & Time Capsule for BlackRoad OS**

Append-only archive for BlackRoad OS: deploy logs, beacon maps, ping history, and key system artifacts, served via archive.blackroad.io.

---

## 🎯 Purpose

`blackroad-os-archive` is the **institutional memory** of the BlackRoad OS ecosystem. It serves as:

- 🧠 **Long-term memory** - Snapshots, decisions, and historical records
- 📜 **IP ledger** - Canonical versions of protocols, frameworks, and research
- 🕰️ **Time capsule** - Point-in-time captures of ecosystem state
- 🧵 **Cross-repo index** - Links and context across the entire ecosystem

Think of it as the **Library of Alexandria for BlackRoad OS** - a calm, ordered space where 10,000 agents can answer "what happened when, and why?"

---

## 📁 Structure

```
blackroad-os-archive/
├── catalog/              # Indexes and catalogs
│   ├── INDEX.md          # Master index of all archived content
│   ├── services.md       # Repository and service catalog
│   └── timeline.md       # Chronological milestone map
├── snapshots/            # Point-in-time ecosystem captures
│   └── YYYY-MM-DD/       # Dated snapshot directories
├── ip/                   # Intellectual property artifacts
├── legal-finance/        # Legal and financial documentation
├── workflows/            # Process documentation
│   ├── archive-workflow.md
│   ├── snapshot-workflow.md
│   └── ip-registration-workflow.md
├── meta/                 # Archive documentation
│   ├── ARCHIVE_COVER_SHEET.md
│   └── CONTRIBUTING.md
└── .github/
    └── copilot-instructions.md  # AI agent system prompt
```

---

## 🚀 Quick Start

### For Browsing:
1. Start with [`catalog/INDEX.md`](catalog/INDEX.md) - Master index
2. Check [`catalog/timeline.md`](catalog/timeline.md) - Chronological view
3. Browse [`snapshots/`](snapshots/) - Point-in-time captures

### For Contributing:
1. Read [`meta/ARCHIVE_COVER_SHEET.md`](meta/ARCHIVE_COVER_SHEET.md) - What this archive is
2. Review [`meta/CONTRIBUTING.md`](meta/CONTRIBUTING.md) - How to contribute
3. Check [`workflows/`](workflows/) - Process documentation

### For AI Agents:
1. Read [`.github/copilot-instructions.md`](.github/copilot-instructions.md) - Your system prompt
2. Review workflows in [`workflows/`](workflows/)
3. Follow the pre-commit checklist before making changes

---

## 📚 Key Documents

- **[Archive Cover Sheet](meta/ARCHIVE_COVER_SHEET.md)** - The "front door" to the archive
- **[Archive Workflow](workflows/archive-workflow.md)** - How content gets finalized and archived
- **[Snapshot Workflow](workflows/snapshot-workflow.md)** - How to capture ecosystem state
- **[IP Registration Workflow](workflows/ip-registration-workflow.md)** - How to bless intellectual property
- **[Contributing Guidelines](meta/CONTRIBUTING.md)** - How to add to the archive

---

## 🔁 How It Works

### Archival Process:
```
Draft (Source Repo) → Review → Archive → Canonical Status
```

1. Content is created and finalized in source repos (research, docs, infra)
2. Label applied: `Status: Ready for Archive`
3. Archive copy created with metadata header
4. Indexes updated, PR created and reviewed
5. Merged - now canonical reference version

### Snapshot Process:
```
Monthly/Milestone → Capture State → Document → Archive
```

1. Snapshot triggered (monthly, milestone, or on-demand)
2. Ecosystem state captured (orgs, repos, infra, IP)
3. Context and changes documented
4. Snapshot archived with full metadata

---

## 📊 Current State

- **Total Snapshots:** 1 (Initial: 2025-11-24)
- **Total IP Artifacts:** 1 (Agent Soul Seeds intake: 2025-11-28)
- **Total Workflows:** 3 (Archive, Snapshot, IP Registration)
- **Archive Status:** ✅ Initialized and operational

---

## 🎯 What Belongs Here

### ✅ Archive-Worthy:
- Finalized IP (protocols, frameworks, research)
- Major decisions (architecture, product, organizational)
- Snapshots (point-in-time ecosystem state)
- Legal/finance (corporate structure, contracts - sanitized)
- Workflows (how the ecosystem operates)

### ❌ NOT Archive-Worthy:
- Work-in-progress drafts
- Secrets or credentials
- Large binary files
- Raw logs or operational data
- Temporary notes

---

## 🔐 Security & Quality

**No Secrets Policy:**
- ❌ No API keys, tokens, passwords
- ❌ No database credentials
- ❌ No private keys or certificates
- ✅ Only clean, text-based documentation

**Quality Standards:**
- All content is Markdown or small text configs
- Every item has complete metadata
- Indexes are kept current
- Links are functional
- History is clean and professional

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](meta/CONTRIBUTING.md).

**Quick Links:**
- [Request archival](../../issues/new) - Create an issue to archive content
- [Report issue](../../issues/new) - Report problems with the archive
- [Suggest improvement](../../discussions/new) - Propose process improvements

---

## 📞 Support

- **Issues:** File in this repo
- **Discussions:** Use GitHub Discussions
- **Documentation:** See [`meta/`](meta/) directory

---

## 📜 License

[To be determined]

---

**Remember:** This archive is designed to last. Every addition should make the history clearer, not noisier. Quality over quantity. Clarity over completeness. 🕯️💚
