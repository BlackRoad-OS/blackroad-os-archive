# Archive Workflow: Finalize & Archive 🧬📥

**Purpose:** Define how content moves from source repos to permanent archive status  
**Last Updated:** 2025-11-24  
**Applies To:** IP artifacts, protocols, major decisions, finalized documentation

---

## Overview

This workflow describes the complete lifecycle of a document from initial draft to archived canonical version. The archive captures **finalized, blessed** versions while source repos continue to evolve.

## 🔄 The Four Stages

```
Draft (Source Repo) → Review → Archive → Canonical Status
```

---

## Stage 1: Draft Stage 📝

**Location:** Source repository (not archive)

### Where Drafts Live:
- **Research & IP:** `blackroad-os-research`
- **Documentation:** `blackroad-os-docs`
- **Infrastructure specs:** `blackroad-os-infra`
- **API specs:** `blackroad-os-api`
- **Brand guidelines:** `blackroad-os-brand`
- **Core protocols:** `blackroad-os-core`

### Activities:
1. Content is created following source repo's contribution guidelines
2. Iterative development through PRs
3. Internal review and refinement
4. Collaboration and feedback

### Exit Criteria:
- Content is complete and stable
- Internal review approvals obtained
- Ready to be "frozen" as a reference version

---

## Stage 2: Review Stage 👀

**Location:** Still in source repository

### Process:
1. **Final review** in source repo
   - Technical accuracy verified
   - Completeness confirmed
   - Metadata prepared (source info, version, date)

2. **Label applied:** `Status: Ready for Archive`
   - Signals that content is archival-ready
   - Triggers monitoring by archive agents

3. **Archive request created:**
   - **Option A:** Issue in `blackroad-os-archive` with:
     - Link to source file
     - Commit SHA
     - Category (IP, Legal, Workflow, etc.)
     - Archival reason
     - Any special instructions
   
   - **Option B:** Comment in source repo PR:
     - Tag archive team: `@BlackRoad-OS/archive-team`
     - Specify archive category
     - Request archival

### Exit Criteria:
- Archive request acknowledged
- Source content is stable (no active edits)
- Metadata is complete

---

## Stage 3: Archive Stage 📥

**Location:** `blackroad-os-archive` repository

### Process:

#### 3.1 Create Archive Copy
1. **Create new file** in appropriate archive directory:
   - `ip/` for intellectual property, protocols, frameworks
   - `legal-finance/` for legal/financial docs
   - `workflows/` for process documentation
   - `snapshots/` for point-in-time captures

2. **Add metadata header:**
   ```markdown
   # [Document Title]
   
   **Category:** [IP | Legal | Finance | Workflow | Protocol]  
   **Source Repo:** `BlackRoad-OS/[source-repo-name]`  
   **Source Path:** `path/to/original/file.md`  
   **Source Commit:** `[full git SHA]`  
   **Archived On:** YYYY-MM-DD  
   **Archived By:** [agent:name | human:username]  
   **Status:** Final
   
   ---
   
   [Original content with minimal normalization]
   ```

3. **Content normalization (minimal):**
   - Convert to standalone Markdown
   - Resolve relative links to absolute URLs
   - Remove source-repo-specific references
   - Keep content integrity intact

#### 3.2 Update Indexes
1. **Update `catalog/INDEX.md`:**
   ```markdown
   - [Document Title](../category/document-name.md)  
     - Category: [category]
     - Archived: YYYY-MM-DD
     - Source: `BlackRoad-OS/[repo]` @ `[commit]`
   ```

2. **Update `catalog/timeline.md` (if milestone):**
   ```markdown
   ## YYYY-MM-DD
   - **[Document Title]** archived - [brief description]
   ```

3. **Update `catalog/services.md` (if new repo/service):**
   - Add repo to catalog if not already listed

#### 3.3 Create PR in Archive
1. **Branch name:** `archive/[category]-[short-name]`
2. **PR title:** `[Archive] Document Title`
3. **PR description:**
   ```markdown
   ## Archive Request
   
   **Source:** [link to source file]
   **Category:** [category]
   **Commit:** [SHA]
   
   ## Reason for Archival
   [Why this is being archived now]
   
   ## Changes Made
   - Added metadata header
   - Placed in `[directory]/`
   - Updated catalog indexes
   
   ## Checklist
   - [x] Metadata header complete
   - [x] Content is standalone Markdown
   - [x] No secrets included
   - [x] Index updated
   - [x] Timeline updated (if applicable)
   ```

#### 3.4 Review & Merge
1. **Automated checks:**
   - No secrets detected
   - Valid metadata format
   - Links functional
   - No large binaries

2. **Human review:**
   - Content appropriate for archive
   - Category correct
   - Metadata accurate
   - Indexes properly updated

3. **Merge** to main branch

### Exit Criteria:
- PR merged to `blackroad-os-archive`
- File available in archive
- Indexes updated
- Git history clean

---

## Stage 4: Canonical Status ✅

**Location:** Archive is now source of truth

### What It Means:
- **Archived version is canonical** at that point in time
- **Source repo may continue to evolve** (working versions)
- **Archive captures blessed version** for reference, filing, prior art

### Usage:
1. **Reference:** Link to archived version for stable citations
2. **Prior art:** Use in IP filings or legal context
3. **Historical record:** Understand what was decided/created when
4. **Baseline:** Starting point for future iterations

### Maintenance:
- **Archive is immutable** for that version
- **New versions** get new archive entries with updated dates
- **Living documents** marked with `Status: Living Document` in metadata
- **Historical versions** marked with `Status: Historical` if superseded

---

## 🤖 Agent Automation

### For AI Agents:

**Monitoring:**
```
1. Watch source repos for `Status: Ready for Archive` labels
2. Check for archive requests in issues
3. Scan for explicit archive mentions in PRs
```

**Processing:**
```
1. Validate source content is stable
2. Extract metadata (repo, path, commit, date)
3. Create archive branch
4. Copy content with metadata header
5. Update indexes
6. Create PR with standard description
7. Request review
```

**Quality Checks:**
```
1. Verify no secrets in content
2. Confirm metadata completeness
3. Validate links work
4. Check category placement
5. Ensure indexes updated
```

---

## 📋 Checklist Template

Use this checklist when archiving content:

```markdown
- [ ] Source content is finalized and stable
- [ ] Archive request created or label applied
- [ ] Appropriate category selected
- [ ] Metadata header added with all fields
- [ ] Content copied to correct directory
- [ ] Links converted to absolute URLs
- [ ] No secrets or sensitive data included
- [ ] catalog/INDEX.md updated
- [ ] catalog/timeline.md updated (if milestone)
- [ ] PR created with clear description
- [ ] Review requested
- [ ] Automated checks passed
```

---

## ⚡ Quick Reference

### Archive Directory Mapping:
- IP/Protocols → `ip/`
- Legal docs → `legal-finance/`
- Financial models → `legal-finance/`
- Process docs → `workflows/`
- Ecosystem snapshots → `snapshots/YYYY-MM-DD/`
- Decisions → `ip/` or `snapshots/` depending on scope

### Metadata Fields (Required):
- Category
- Source Repo
- Source Path
- Source Commit (full SHA)
- Archived On (YYYY-MM-DD)
- Archived By
- Status

### Common Statuses:
- `Final` - Stable, canonical version
- `Living Document` - Continues to be updated
- `Historical` - Superseded by newer version
- `Reference` - For reference only

---

## 🆘 Troubleshooting

**Q: Source content is still changing**  
A: Wait until it's stable. Don't archive work-in-progress.

**Q: Multiple versions of same document**  
A: Use versioned filenames: `document-v1.0.md`, `document-v2.0.md` or date-based.

**Q: Sensitive information in content**  
A: Don't archive. Request private storage or redact sensitive portions.

**Q: Source repo deleted or unavailable**  
A: Note in metadata: "Source repo no longer available. Archived from [context]."

**Q: Not sure about category**  
A: Ask in archive issue or default to most specific category.

---

**Remember:** The archive is for finalized, canonical versions. When in doubt, wait until content is truly ready. Quality over speed. 🕯️
