# Snapshot Workflow: Capturing Ecosystem State 🕰️📸

**Purpose:** Define how and when to create point-in-time snapshots of the BlackRoad OS ecosystem  
**Last Updated:** 2025-11-24  
**Cadence:** Monthly, milestone-based, and on-demand

---

## Overview

Snapshots capture the complete state of the BlackRoad OS ecosystem at a specific moment in time, enabling future agents and team members to understand "what the world looked like then."

Each snapshot is a **time capsule** containing:
- Organization structure
- Repository inventory
- Infrastructure state
- Major IP highlights
- Significant events and context

---

## 🎯 When to Create a Snapshot

### Scheduled Snapshots:
- **Monthly:** First business day of each month (if significant changes occurred)
- **Quarterly:** End of each quarter for comprehensive review

### Event-Driven Snapshots:
1. **Major Infrastructure Changes:**
   - New hosting provider
   - Significant architecture redesign
   - Major service launches or deprecations

2. **Organizational Restructuring:**
   - New GitHub organizations created
   - Repo ownership transfers
   - Team structure changes

3. **Funding Milestones:**
   - Investment rounds
   - Grant approvals
   - Revenue targets reached

4. **Product/Property Decisions:**
   - New major features
   - Product pivots
   - Property acquisitions or launches

5. **On-Demand:**
   - Requested by team
   - Before major changes for "before/after" comparison
   - For specific documentation needs

---

## 📁 Snapshot Structure

Each snapshot lives in: `snapshots/YYYY-MM-DD/`

### Required Files:

#### 1. `README.md`
Overview and context for this snapshot.

```markdown
# Snapshot: YYYY-MM-DD

**Snapshot Type:** [Monthly | Milestone | On-Demand]  
**Initiated By:** [agent:name | human:name]  
**Reason:** [Brief description]  
**Related Events:** [Links to PRs, issues, or external events]

## Summary
[2-3 paragraph summary of the ecosystem state and why this snapshot was taken]

## Key Changes Since Last Snapshot
- [Change 1]
- [Change 2]
- [Change 3]

## Files in This Snapshot
- `orgs-overview.md` - GitHub organizations and their roles
- `repos-overview.md` - Complete repository inventory
- `infra-state.md` - Infrastructure and hosting state
- `ip-highlights.md` - Major IP pieces at this time
- `notes.md` - Additional context and observations
```

#### 2. `orgs-overview.md`
List all GitHub organizations and their purposes.

```markdown
# GitHub Organizations - YYYY-MM-DD

## Overview
Total Organizations: [number]

## Organization Inventory

### BlackRoad-OS
- **Purpose:** Main organization for BlackRoad OS ecosystem
- **Repositories:** [count]
- **Visibility:** Public
- **Key Repos:** [list top 3-5]

### [Other Org Name]
- **Purpose:** [description]
- **Repositories:** [count]
- **Visibility:** [Public/Private]
- **Key Repos:** [list if applicable]

[Continue for all orgs...]

## Org Relationships
[Describe how orgs relate to each other, if applicable]
```

#### 3. `repos-overview.md`
Complete repository inventory with descriptions.

```markdown
# Repository Inventory - YYYY-MM-DD

## Summary
- **Total Repositories:** [count]
- **Active Repos:** [count]
- **Archived Repos:** [count]
- **Private Repos:** [count]

## Repository List

### Core Infrastructure
- **blackroad-os-core**
  - Description: [1-2 sentence description]
  - Status: Active
  - Primary Language: [language]
  - Last Updated: YYYY-MM-DD

- **blackroad-os-api**
  - Description: [description]
  - Status: Active
  - Primary Language: [language]
  - Last Updated: YYYY-MM-DD

### [Other Categories]
[Group repos by category: Core, Tools, Documentation, Research, etc.]

## Recently Created Repos
- [repo-name] (created YYYY-MM-DD)

## Recently Archived Repos
- [repo-name] (archived YYYY-MM-DD)
```

#### 4. `infra-state.md`
Infrastructure and hosting overview.

```markdown
# Infrastructure State - YYYY-MM-DD

## Hosting & Infrastructure

### Cloud Providers
- **Primary:** [provider name]
  - Services: [list key services]
  - Regions: [list regions]
  
### Domains
- **Production Domains:**
  - blackroad.io
  - archive.blackroad.io
  - [other domains]
- **Status:** All active and properly configured

### Key Services
- **API Endpoints:** [list main endpoints]
- **CDN:** [provider and configuration]
- **Database:** [type and hosting]
- **Cache:** [type and hosting]

## Architecture Overview
[High-level description of current architecture]

## Recent Changes
- [Change 1 with date]
- [Change 2 with date]

## Pending Infrastructure Work
- [Planned item 1]
- [Planned item 2]
```

#### 5. `ip-highlights.md`
Major intellectual property at this point.

```markdown
# IP Highlights - YYYY-MM-DD

## Overview
Key intellectual property and protocols active in the BlackRoad OS ecosystem.

## Active IP & Protocols

### [Protocol/Framework Name]
- **Status:** [Development | Stable | Production]
- **Description:** [1-2 sentences]
- **Location:** [link to archive or source repo]
- **Key Contributors:** [list if applicable]

[Repeat for each major IP piece]

## Research Areas
- [Research area 1] - [brief description]
- [Research area 2] - [brief description]

## Recent IP Developments
- [Development 1 with date]
- [Development 2 with date]

## Archived IP
[List any IP that's been fully archived since last snapshot]
```

#### 6. `notes.md` (Optional)
Additional context and observations.

```markdown
# Snapshot Notes - YYYY-MM-DD

## Context
[Any additional context that doesn't fit in other files]

## Observations
[Notable patterns, trends, or insights]

## Future Considerations
[Things to watch or plan for]

## Links
[Related PRs, issues, discussions, external references]
```

---

## 🔁 Snapshot Creation Process

### Step 1: Initiation
1. **Determine need** (scheduled, milestone, or on-demand)
2. **Create snapshot branch:** `snapshot/YYYY-MM-DD`
3. **Create snapshot directory:** `snapshots/YYYY-MM-DD/`

### Step 2: Data Gathering
1. **Query GitHub APIs** for:
   - Organization list
   - Repository inventory
   - Recent activity
   
2. **Review infrastructure:**
   - Check hosting providers
   - Verify domains
   - Document architecture state

3. **Identify IP highlights:**
   - Review recently archived IP
   - Check source repos for finalized work
   - Note major protocols/frameworks

4. **Gather context:**
   - Review recent PRs and issues
   - Check timeline for recent milestones
   - Identify key events since last snapshot

### Step 3: Document Creation
1. **Create all required files** in snapshot directory
2. **Fill in current data** from gathering phase
3. **Add metadata** and context
4. **Cross-reference** with previous snapshot if available

### Step 4: Review & Validation
1. **Self-review:**
   - All required files present
   - Data is accurate and current
   - Links work
   - No secrets included
   
2. **Compare with previous snapshot:**
   - Identify what changed
   - Explain significant differences
   - Update "changes since last snapshot"

### Step 5: Catalog Update
1. **Update `catalog/timeline.md`:**
   ```markdown
   ## YYYY-MM-DD
   - **Ecosystem Snapshot** - [reason] ([link to snapshot](../snapshots/YYYY-MM-DD/))
   ```

2. **Update `catalog/INDEX.md`:**
   ```markdown
   - [Snapshot: YYYY-MM-DD](../snapshots/YYYY-MM-DD/README.md)  
     - Category: Snapshot
     - Created: YYYY-MM-DD
     - Type: [Monthly | Milestone | On-Demand]
   ```

### Step 6: PR & Merge
1. **Create PR:** `[Snapshot] Ecosystem State - YYYY-MM-DD`
2. **PR description:**
   ```markdown
   ## Snapshot Details
   
   **Date:** YYYY-MM-DD
   **Type:** [Monthly | Milestone | On-Demand]
   **Reason:** [description]
   
   ## Contents
   - Organizations: [count]
   - Repositories: [count]
   - Infrastructure: [summary]
   - IP Highlights: [count]
   
   ## Key Changes Since Last Snapshot
   - [Change 1]
   - [Change 2]
   
   ## Checklist
   - [x] All required files created
   - [x] Data is current and accurate
   - [x] No secrets included
   - [x] Catalogs updated
   - [x] Cross-referenced with previous snapshot
   ```

3. **Review and merge**

---

## 🤖 Agent Automation

### For AI Agents:

**Scheduled Snapshot Check:**
```
On first business day of month:
1. Check if significant changes occurred
2. If yes, initiate snapshot creation
3. If no, skip but log decision
```

**Data Collection:**
```
1. Use GitHub API to list orgs and repos
2. Parse README files for descriptions
3. Check last commit dates
4. Identify language/tech stack
5. Note active vs archived status
```

**Quality Checks:**
```
1. Verify all required files present
2. Validate data completeness
3. Check for secrets or sensitive info
4. Ensure links are functional
5. Confirm catalogs updated
```

---

## 📋 Snapshot Checklist

Use this checklist when creating snapshots:

```markdown
- [ ] Snapshot date determined (YYYY-MM-DD)
- [ ] Snapshot directory created: snapshots/YYYY-MM-DD/
- [ ] README.md created with context
- [ ] orgs-overview.md created with all orgs
- [ ] repos-overview.md created with all repos
- [ ] infra-state.md created with current state
- [ ] ip-highlights.md created with major IP
- [ ] notes.md created (if needed)
- [ ] Data is current and accurate
- [ ] No secrets or sensitive info included
- [ ] Changes since last snapshot documented
- [ ] catalog/timeline.md updated
- [ ] catalog/INDEX.md updated
- [ ] PR created with clear description
- [ ] Review requested
```

---

## 🎯 Snapshot Quality Standards

### Completeness:
- All organizations listed
- All repositories documented
- Infrastructure state captured
- Major IP identified

### Accuracy:
- Data current as of snapshot date
- Links functional
- Descriptions clear and accurate

### Context:
- Reason for snapshot explained
- Changes since last snapshot noted
- Related events linked

### Usability:
- Files well-organized
- Navigation clear
- Cross-references present
- Future-agent friendly

---

## 📊 Snapshot Metrics

Track these over time to understand ecosystem growth:

- Total organizations
- Total repositories
- Active vs archived repos
- Infrastructure complexity
- Major IP pieces
- Team size (if applicable)

---

## 🔍 Using Snapshots

### For Historical Research:
1. Navigate to `snapshots/`
2. Choose date closest to event of interest
3. Review README for context
4. Dive into specific files as needed

### For Comparison:
1. Select two snapshot dates
2. Compare same files across snapshots
3. Identify growth and changes
4. Document trends

### For Planning:
1. Review most recent snapshot
2. Identify gaps or areas for growth
3. Use as baseline for planning

---

**Remember:** Snapshots are time capsules. They should be comprehensive enough to reconstruct the ecosystem state, but focused enough to be useful. Quality over quantity. 🕰️💚
