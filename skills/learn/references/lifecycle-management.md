# Learning Lifecycle Management

Complete reference for the freshness-adjusted scoring and archival system.

---

## Overview

Learning lifecycle management prevents documentation bloat by:
1. **Automatic decay**: Older learnings get lower scores
2. **Guided archival**: System suggests what to archive
3. **Verification refresh**: Keep relevant content fresh
4. **Context preservation**: Archive with full history

---

## Freshness-Adjusted Scoring Algorithm

### Base Score Calculation

**Formula**: Scope (S) × Impact (I) × Reusability (R) = Base Score

**Dimensions**:
- **Scope (S)**: 3 (global) | 2 (domain) | 1 (local)
- **Impact (I)**: 3 (critical) | 2 (high) | 1 (medium)
- **Reusability (R)**: 3 (frequent) | 2 (occasional) | 1 (rare)

**Range**: 1-27

### Freshness Factor

**Age-based decay**:
```python
age_months = (current_date - created_date).days / 30

if age_months <= 3:
    freshness = 1.0  # No decay
elif age_months <= 6:
    freshness = 0.8  # 20% decay
elif age_months <= 12:
    freshness = 0.5  # 50% decay
else:
    freshness = 0.3  # 70% decay
```

**Rationale**:
- **0-3 months**: New learnings are most relevant
- **3-6 months**: Still recent, slight decay
- **6-12 months**: Moderate decay, may need verification
- **12+ months**: Significant decay, likely outdated

### Final Score

**Formula**: Final Score = Base Score × Freshness Factor

**Example Decay Trajectory**:
```
Base Score: 21 (S:3 × I:3 × R:2.33)
Month 0:  21 × 1.0 = 21.0 → Primary files
Month 4:  21 × 0.8 = 16.8 → Primary files
Month 8:  21 × 0.5 = 10.5 → Specialized docs
Month 14: 21 × 0.3 = 6.3  → Aging section
```

### Action Thresholds

| Final Score | Status | Location | Action Required |
|-------------|--------|----------|-----------------|
| 18-27 | Active | Primary files + navigation | None |
| 9-17 | Active | Specialized docs | None |
| 5-8 | Aging | Aging section | Review needed |
| 1-4 | Archive Candidate | - | Archive with context |

---

## Metadata Format

### Required Fields

Every learning entry MUST include metadata:

```markdown
## [Type]: [Name]
<!-- meta
created: YYYY-MM-DD
last-verified: YYYY-MM-DD
original-score: [1-27]
current-score: [1-27]
freshness: [0.3-1.0]
status: active|aging|archived
references: [count]
-->

[Content...]
```

### Field Descriptions

**created**:
- Date when learning was first added
- Never changes (used for age calculation)
- Format: YYYY-MM-DD

**last-verified**:
- Date when learning was last confirmed relevant
- Updated with `/learn --refresh`
- Resets age to 0 when updated

**original-score**:
- Base score (S × I × R)
- Never changes after initial calculation

**current-score**:
- Final score = original-score × freshness
- Recalculated on every `/learn` invocation

**freshness**:
- Current freshness factor (0.3, 0.5, 0.8, or 1.0)
- Based on age since created/last-verified

**status**:
- `active`: Currently in use (score ≥ 9)
- `aging`: Needs review (5 ≤ score < 9)
- `archived`: Moved to archive

**references**:
- Number of times referenced by other learnings or code
- Higher references = more important to keep

### Why HTML Comments?

**Advantages**:
- ✅ Doesn't clutter human-readable content
- ✅ Easy to parse programmatically
- ✅ LLMs can still read and use for decisions
- ✅ Compatible with all markdown renderers
- ✅ Invisible in rendered docs

---

## Review Command

### Usage

```bash
# Full health check
/learn --review

# Refresh specific learning (reset age)
/learn --refresh "API Authentication"

# Archive specific learning
/learn --archive "Old Auth Method"
```

### Review Output

**Structure**:
```
📊 Learning Health Check
├─ ✅ Active Learnings (healthy)
├─ ⚠️ Aging Learnings (action needed)
├─ 🗄️ Archive Candidates (outdated)
└─ 🎯 Recommended Actions
```

**Full Example**:
```markdown
## 📊 Learning Health Check

**Primary Files**: CLAUDE.md (478 lines), AGENTS.md (synced)
**Specialized Docs**: 3 files, 245 total lines
**Total Learnings**: 20 entries

---

### ✅ Active Learnings (Healthy)
15 entries with freshness 0.8-1.0

**Recent Additions** (0-3 months, freshness 1.0):
- Error Handling Pattern (created: 2025-01-10, score: 18→18)
- API Authentication (created: 2025-01-05, score: 21→21)
- Workflow Retry Logic (created: 2024-12-20, score: 15→15)

**Still Fresh** (3-6 months, freshness 0.8):
- Database Connection Pool (created: 2024-08-15, score: 18→14.4)
- Rate Limiting Pattern (created: 2024-07-20, score: 16→12.8)

---

### ⚠️ Aging Learnings (Action Needed)
3 entries with freshness 0.5-0.8 (6-12 months old)

1. **API Rate Limit Pattern**
   - Created: 2024-07-15 (6 months ago)
   - Base Score: 18 (S:2 × I:3 × R:3)
   - Current Score: 14.4 (freshness: 0.8)
   - Location: CLAUDE.md#API-Patterns
   - References: 2
   - **Action**: ✅ Verify still relevant OR 🗄️ Archive
   - **Reason**: Medium age, still high score, but approaching decay

2. **Workflow State Management**
   - Created: 2024-06-20 (7 months ago)
   - Base Score: 21 (S:3 × I:3 × R:2)
   - Current Score: 16.8 (freshness: 0.8)
   - Location: .agent/rules/workflow-architecture.md
   - References: 4
   - **Action**: ✅ Refresh verification (actively used)
   - **Reason**: High references suggest still in use

3. **Database Connection Pool**
   - Created: 2024-05-10 (8 months ago)
   - Base Score: 15 (S:2 × I:2 × R:2)
   - Current Score: 7.5 (freshness: 0.5)
   - Location: .agent/rules/db-patterns.md
   - References: 1
   - **Action**: 🗄️ Archive (low usage)
   - **Reason**: Crossing into aging territory, low references

---

### 🗄️ Archive Candidates (Outdated)
2 entries with freshness 0.3 (12+ months old)

1. **Old Authentication Method**
   - Created: 2024-01-15 (12 months ago)
   - Base Score: 18 (S:2 × I:3 × R:3)
   - Current Score: 5.4 (freshness: 0.3)
   - Location: CLAUDE.md#Authentication
   - References: 0
   - **Replacement**: OAuth 2.0 (see api-patterns.md#oauth)
   - **Action**: 🗄️ Archive to 2024-Q1.md
   - **Reason**: Tech stack migrated to OAuth 2.0

2. **Deprecated API Pattern**
   - Created: 2023-12-20 (13 months ago)
   - Base Score: 15 (S:2 × I:2 × R:2)
   - Current Score: 4.5 (freshness: 0.3)
   - Location: .agent/rules/api-patterns.md
   - References: 0
   - **Replacement**: v2 API patterns (see api-v2.md)
   - **Action**: 🗄️ Archive to 2023-Q4.md
   - **Reason**: API endpoint removed in v2.0

---

### 🎯 Recommended Actions

**High Priority** (do now):
1. 🗄️ Archive "Old Authentication Method" → 2024-Q1.md
2. 🗄️ Archive "Deprecated API Pattern" → 2023-Q4.md

**Medium Priority** (review soon):
3. ✅ Refresh "Workflow State Management" (high references)
4. Review "Database Connection Pool" (decide: refresh or archive)

**Low Priority** (monitor):
5. Continue monitoring "API Rate Limit Pattern"

---

**Which action do you want to take?**
1. Archive high-priority candidates (recommended)
2. Refresh specific entries
3. Do nothing (continue monitoring)
```

---

## Archival Process

### Step-by-Step

#### 1. Create Archive File

```bash
mkdir -p .agent/archive
touch .agent/archive/YYYY-QQ.md
```

**Naming Convention**:
- `2024-Q1.md`: Jan-Mar 2024
- `2024-Q2.md`: Apr-Jun 2024
- `2024-Q3.md`: Jul-Sep 2024
- `2024-Q4.md`: Oct-Dec 2024

#### 2. Move Entry with Full Context

**Template**:
```markdown
## [Type]: [Name] [ARCHIVED]
<!-- meta
created: YYYY-MM-DD
archived: YYYY-MM-DD
original-score: [1-27]
final-score: [0.3-4.5]
archive-reason: tech-stack-change|problem-fixed|better-solution|no-longer-applicable
replacement: [path to new solution]
-->

[Original content preserved exactly...]

---

**Archive Note**:
- **Archived On**: YYYY-MM-DD
- **Reason**: [Detailed explanation]
- **See Instead**: [Link to replacement](../rules/new-pattern.md)
- **Migration Guide**: [Optional migration guide link]
- **Context**: [Why this was needed at the time]
```

**Example**:
```markdown
## Error: Old Authentication Method [ARCHIVED]
<!-- meta
created: 2024-01-15
archived: 2025-01-18
original-score: 18
final-score: 5.4
archive-reason: tech-stack-change
replacement: api-patterns.md#oauth
-->

Symptom: 401 Unauthorized with custom token
Cause: Using deprecated token-based auth
Fix: Add `X-Custom-Token: <token>` header
Prevent: Check API version before implementation
Ref: old-api-patterns.md#custom-auth

---

**Archive Note**:
- **Archived On**: 2025-01-18
- **Reason**: Migrated to OAuth 2.0 in v2.0
- **See Instead**: [OAuth 2.0 Pattern](../rules/api-patterns.md#oauth)
- **Migration Guide**: [Auth Migration Guide](../docs/auth-migration.md)
- **Context**: This custom token method was used in API v1.x before OAuth support was added in v2.0
```

#### 3. Remove from Source Files

**Files to Update**:
- Primary files (CLAUDE.md, AGENTS.md)
- Specialized docs (.agent/rules/*.md)
- Platform-specific files (.cursorrules, project-rules.md)

**Verification**:
- [ ] Entry completely removed
- [ ] No broken links remain
- [ ] Navigation updated

#### 4. Update Navigation

**In Primary Files**:
```markdown
## 📚 Related Documentation

**Active Rules**:
- [API Patterns](.agent/rules/api-patterns.md) - Current authentication
- [Workflow Architecture](.agent/rules/workflow-architecture.md) - State management

**Archived Knowledge**:
- [2024-Q1 Archive](.agent/archive/2024-Q1.md) - Old auth methods, deprecated APIs
- [2024-Q2 Archive](.agent/archive/2024-Q2.md) - Legacy workflow patterns
```

**In Archive Index** (.agent/archive/index.md):
```markdown
# Archive Index

## 2024-Q1 (Jan-Mar 2024)
- [Old Authentication Method](2024-Q1.md#old-authentication-method) - Replaced by OAuth 2.0
- [Custom Rate Limiter](2024-Q1.md#custom-rate-limiter) - Migrated to API Gateway

## 2024-Q2 (Apr-Jun 2024)
- [Manual Workflow Retry](2024-Q2.md#manual-workflow-retry) - Automated with Temporal
```

#### 5. Sync to All Platforms

**Update Order**:
1. CLAUDE.md (source)
2. AGENTS.md (sync)
3. .agent/rules/project-rules.md (sync)
4. .cursorrules (translate format if exists)

---

## Refresh Process

### When to Refresh

**Refresh** when learning is:
- ✅ Still relevant and actively used
- ✅ Recently referenced in new code
- ✅ Core pattern confirmed valid
- ✅ Technology hasn't changed

**Don't Refresh** when:
- ❌ Tech stack evolved
- ❌ Problem is permanently fixed
- ❌ Better solution exists
- ❌ No longer applicable

### How to Refresh

**Command**:
```bash
/learn --refresh "API Authentication"
```

**What Happens**:
1. Find learning by name/title
2. Update `last-verified` to current date
3. Recalculate freshness (age reset to 0)
4. Update `current-score` = `original-score` × 1.0
5. Confirm status = `active`

**Metadata Change**:
```diff
## Error: API Authentication
<!-- meta
created: 2024-07-15
- last-verified: 2024-07-15
+ last-verified: 2025-01-18
original-score: 18
- current-score: 14.4
+ current-score: 18
- freshness: 0.8
+ freshness: 1.0
status: active
- references: 2
+ references: 3
-->
```

**Effect**:
- Score restored to full value
- Age reset to 0 months
- Will decay again over time

---

## Lifecycle State Machine

```
┌─────────────┐
│ New Learning│ (freshness 1.0)
└──────┬──────┘
       │
       ↓
┌──────────────────┐
│ Active (0-3mo)   │ (freshness 1.0, score 18-27)
│ Primary Files    │
└──────┬───────────┘
       │
       ↓
┌──────────────────┐
│ Active (3-6mo)   │ (freshness 0.8, score 14-22)
│ Still in Primary │
└──────┬───────────┘
       │
       ↓
┌──────────────────────┐
│ Active (6-12mo)      │ (freshness 0.5, score 9-14)
│ Moved to Specialized │
└──────┬───────────────┘
       │
       ├──→ [Refresh] ──→ [Back to Active (0-3mo)]
       │
       ↓
┌──────────────────┐
│ Aging (6-12mo)   │ (freshness 0.5, score 5-8)
│ Needs Review     │
└──────┬───────────┘
       │
       ├──→ [Refresh] ──→ [Back to Active]
       │
       ↓
┌─────────────────────┐
│ Archive Candidate   │ (freshness 0.3, score 1-4)
│ (12+ months)        │
└──────┬──────────────┘
       │
       ├──→ [Refresh] ──→ [Back to Active]
       │
       ↓
┌──────────────┐
│ Archived     │
│ Moved to     │
│ .agent/      │
│ archive/     │
└──────────────┘
```

---

## Quality Metrics

### Tracking Health

**Primary File Metrics**:
```
Target: <20 learnings, <500 lines, avg age <6 months
Current: 18 learnings, 478 lines, avg age 4.2 months
Status: ✅ Healthy
```

**Specialized Doc Metrics**:
```
Target: <10 learnings per file, <200 lines per file
Current: 3 files, avg 8 learnings, avg 163 lines
Status: ✅ Healthy
```

**Overall Health Score**:
```
Active: 15 (✅)
Aging: 3 (⚠️)
Archive Candidates: 2 (🗄️)

Health: 75% (15/20 active)
Status: ✅ Good (target >70%)
```

### Archive Rate

**Expected Churn**:
- ~20% archived per year (healthy evolution)
- ~80% retention (core knowledge)

**Example**:
```
Year 2024:
- Started: 20 learnings
- Added: 12 new learnings
- Archived: 6 learnings (30% churn - slightly high)
- Ended: 26 learnings

Recommendation: Review archival criteria
```

---

## Best Practices

### Do

✅ **Run Regular Reviews**:
- Every 2-3 months: `/learn --review`
- After major refactors
- When tech stack changes

✅ **Refresh Actively Used Learnings**:
- When referencing in new code
- After verifying still relevant
- When adding related learnings

✅ **Archive with Context**:
- Include replacement information
- Link to new solutions
- Explain why archived

✅ **Keep Archive Organized**:
- Use quarterly structure
- Maintain archive index
- Update navigation links

### Don't

❌ **Don't Delete Permanently**:
- Always archive (preserve history)
- Context valuable for understanding evolution
- May need to reference later

❌ **Don't Ignore Aging Warnings**:
- Address proactively
- Accumulation creates bloat
- Harder to clean up later

❌ **Don't Let Primary Files Exceed 500 Lines**:
- Triggers automatic review prompts
- Reduces LLM efficiency
- Indicates too many learnings

❌ **Don't Archive Without Checking Dependencies**:
- Other learnings may reference
- Code may link to documentation
- Update all references first

---

## Troubleshooting

### Common Issues

**Q: "My learning was archived but it's still relevant"**
A: Restore it and refresh:
```bash
# Move back from archive to primary file
# Then refresh to reset age
/learn --refresh "[Learning Name]"
```

**Q: "Archive candidates but nothing is actually outdated"**
A: Refresh high-value learnings:
```bash
/learn --refresh "[Core Pattern Name]"
```

**Q: "Too many aging learnings, overwhelming"**
A: Batch process:
1. Archive clearly outdated (tech stack changed)
2. Refresh actively used (high references)
3. Let medium-priority age naturally

**Q: "How do I know what to refresh vs archive?"**
A: Check:
- **References**: >2 references → refresh
- **Code usage**: grep codebase for pattern → if found, refresh
- **Tech stack**: still using same tech → refresh
- **None of above**: archive

---

## Implementation Notes

### For LLM Agents

When implementing lifecycle management:

**On Every `/learn` Call**:
1. Parse metadata from all memory files
2. Calculate current freshness for all entries
3. Update current-score fields
4. Check if any triggers met (10th call, >500 lines, etc.)
5. Display health check if triggered

**On `/learn --review`**:
1. Full scan of all memory files
2. Group by status (active/aging/archive candidates)
3. Generate detailed report with recommendations
4. Wait for user action (refresh/archive/continue)

**On `/learn --refresh [name]`**:
1. Find entry by name/title matching
2. Update last-verified to current date
3. Recalculate all derived fields
4. Confirm update to user

**On `/learn --archive [name]`**:
1. Create archive file if not exists
2. Move entry with full metadata
3. Remove from source files
4. Update navigation
5. Sync to all platforms
6. Verify no broken links

---

*Last updated: 2025-01-18*
