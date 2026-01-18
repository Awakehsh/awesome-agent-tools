# Learn Skill - Universal Knowledge Management

> A cross-platform skill that extracts insights from conversations and updates project memory files with LLM-friendly documentation.

## Features

🔍 **Auto-Discovery** - Finds all memory files (CLAUDE.md, AGENTS.md, .cursorrules, etc.)
🧠 **Smart Routing** - Routes learnings to appropriate docs based on importance
🔄 **Multi-Platform Sync** - Keeps Claude/Cursor/Codex/Gemini configs in sync
📊 **Flow Analysis** - Understands WHY by analyzing conversation timeline
🎯 **LLM-Optimized** - Compact format saves tokens without losing clarity
✅ **User Control** - Always asks approval before modifications

---

## Quick Start

### Installation

```bash
# Already installed at:
~/.claude/skills/learn/

# To use in any project, just invoke:
/learn
```

### Basic Usage

```bash
# After fixing a bug or solving a problem:
/learn

# Learn from specific error:
"Learn from this authentication error we just fixed"

# Analyze multi-round debugging:
"Why did we need 5 attempts? Help me learn from this."
```

---

## How It Works

### 8-Step Process

```
1. 🔍 Memory File Discovery
   ├─ Scan project directory
   ├─ Check home directory
   └─ Categorize by platform & purpose

2. 📊 Conversation Analysis
   ├─ Reconstruct timeline
   ├─ Identify turning points
   └─ Detect problem-solving patterns

3. 📏 Learning Classification
   ├─ Score: Scope × Impact × Reusability
   ├─ Threshold: 18+ = primary files
   └─ Route to appropriate docs

4. 🎯 Document Routing
   ├─ High importance → CLAUDE.md + sync
   ├─ Domain-specific → .agent/rules/*.md
   └─ Platform-specific → .cursorrules, etc.

5. ✍️ LLM-Friendly Drafting
   ├─ Telegraphic language
   ├─ Compact templates (≤30 lines)
   └─ Symbols over words (→ ✅ ❌)

6. 🗺️ Navigation Management
   ├─ Update primary file navigation
   └─ Link related docs

7. ✅ User Approval
   ├─ Show diff preview
   ├─ Explain routing decision
   └─ Wait for explicit approval

8. 🔄 Multi-Platform Sync
   ├─ Update primary file
   ├─ Sync to compatible formats
   └─ Verify consistency
```

---

## Supported Memory Files

### Primary Memory Files (Global Rules)

| File | Platform | Auto-Sync |
|------|----------|-----------|
| `CLAUDE.md` | Claude Code | Source |
| `AGENTS.md` | Codex | ✅ Yes |
| `.cursorrules` | Cursor | ⚠️ Format translation |
| `.agentrules` | Generic | ✅ Yes |
| `.agent/rules/project-rules.md` | Gemini | ✅ Yes |

### Specialized Documentation

- `.agent/rules/*.md` - Domain-specific (API, workflows, troubleshooting)
- `.claude/skills/*/README.md` - Skill-specific docs
- `docs/*.md` - Project documentation

---

## Learning Classification

### Importance Scoring

**Base Formula**: Scope (1-3) × Impact (1-3) × Reusability (1-3) = **Base Score (1-27)**

| Dimension | Weight 3 | Weight 2 | Weight 1 |
|-----------|----------|----------|----------|
| **Scope** | Global (all tasks) | Domain (specific area) | Local (edge case) |
| **Impact** | Critical (prevents errors) | High (improves workflow) | Medium (nice-to-know) |
| **Reusability** | Frequent reference | Occasional use | Rare |

### Freshness-Adjusted Scoring (New!)

To prevent documentation bloat, learnings automatically decay over time:

**Freshness Factor**:
- **0-3 months**: 1.0 (no decay)
- **3-6 months**: 0.8 (20% decay)
- **6-12 months**: 0.5 (50% decay)
- **12+ months**: 0.3 (70% decay)

**Final Score** = Base Score × Freshness Factor

**Example**: A learning with base score 18 becomes:
- Month 0-3: 18 (active in primary files)
- Month 4-6: 14.4 (still active)
- Month 7-12: 9 (moved to specialized docs)
- Month 13+: 5.4 (candidate for archival)

**Action Thresholds** (based on Final Score):
- **18-27**: Active in primary memory files + navigation
- **9-17**: Active in specialized docs
- **5-8**: Aging (needs review)
- **1-4**: Archive candidate

---

## Compact Format Examples

### Error Learning

```markdown
## Error: API Rate Limit
Symptom: 429 Too Many Requests after 100 calls
Cause: No rate limiter in client
Fix: Add exponential backoff + 429 handler
Prevent: Check `X-RateLimit-Remaining` header
Ref: api-patterns.md#rate-limiting
```

### Cognitive Pattern

```markdown
## Pattern: Assumption Bias
Trigger: Multi-round debug without reading logs
Mistake: Assumed state reflects reality
Correct: Verify with logs/DB before debugging
Why: State can be stale or inconsistent
```

### Troubleshooting

```markdown
## Issue: Worker Process Stuck
Debug: `ps aux | grep worker` → `pgrep` → check logs
Solution: Kill stuck process + add health check
Verify: `curl /health` returns 200
```

---

## Multi-Platform Sync

### Sync Strategy

```
CLAUDE.md (updated)
    ↓
    ├─→ AGENTS.md (identical content)
    ├─→ .agent/rules/project-rules.md (+ Gemini prefix)
    └─→ .cursorrules (translate format if needed)
```

### Platform Differences

| Aspect | CLAUDE.md | AGENTS.md | .cursorrules |
|--------|-----------|-----------|--------------|
| Format | Markdown | Markdown | Cursor-specific |
| Content | Full | Identical | Translated |
| Tool paths | `.claude/` | `.codex_cache/` | Cursor format |

---

## Advanced Features

### Cognitive Retrospective (3+ Attempts)

When a problem requires multiple approaches:

**Captures**:
- Timeline of all attempts with hypotheses
- Blind spots (information, assumption, system, cognitive)
- Root cause analysis
- Actionable preventive measures

**Example Output**:
```markdown
## Retrospective: State Sync Issue

**Attempts**: 4 | **Resolved**: Added worker health check

### Timeline
1. Check logs → ❌ No errors found
2. Restart service → ❌ Still stuck
3. Check DB → ❌ State="running" but no process
4. Add health check → ✅ Detects dead workers

### Blind Spots
- Info: Didn't verify process status early
- Assumption: DB state = reality
- System: No automated health monitoring
- Cognitive: Anchored on "logs show no error"

### Actionable Fixes
**Doc update**: CLAUDE.md#Workflow-Health
[Compact template with health check pattern]
```

### Documentation Self-Correction

Automatically detects and fixes:
- ❌ Wrong file paths → ✅ Verified paths
- ❌ Deprecated commands → ✅ Current syntax
- ❌ Incorrect references → ✅ Accurate links
- ❌ Sync inconsistencies → ✅ Aligned content

---

## Configuration

### Customization

Create `~/.claude/skills/learn/config.json` (optional):

```json
{
  "primaryFiles": ["CLAUDE.md", "AGENTS.md"],
  "syncEnabled": true,
  "minImportanceScore": 9,
  "maxLinesPerEntry": 30,
  "autoDetectPlatform": true,
  "navigationPlacement": "end"
}
```

### Platform Detection

The skill automatically detects:
- Current directory (project-level configs)
- Home directory (user-level configs)
- Available memory files
- Current platform (Claude/Cursor/Codex)

---

## Troubleshooting

### Common Issues

**Q: "/learn not found"**
A: Restart Claude Code to load the skill

**Q: "No memory files found"**
A: Create `CLAUDE.md` in project root or home directory

**Q: "Sync failed"**
A: Check file permissions and that target files exist

**Q: "Updates not applied"**
A: Ensure you approved the changes explicitly

---

## Maintenance & Lifecycle

### Keeping Documentation Fresh

The learn skill automatically manages learning lifecycle to prevent documentation bloat:

**Automatic Decay**:
- Learnings naturally decay over time based on age
- Older content gets lower priority scores
- Prevents outdated information from cluttering primary files

**Health Monitoring**:
```bash
# Check learning health status
/learn --review

# Refresh verification date for specific learning
/learn --refresh "API Authentication"

# Archive specific entry
/learn --archive "Old Auth Method"
```

### Review Command

Run `/learn --review` to see:

**Active Learnings** (✅):
- Recent learnings with full scores
- Currently relevant patterns

**Aging Learnings** (⚠️):
- 6-12 months old, scores decaying
- Need verification or archival

**Archive Candidates** (🗄️):
- 12+ months old, low scores
- Suggested for archival with reasons

**Example Output**:
```
📊 Learning Health Check

✅ 15 active learnings (healthy)
⚠️ 3 aging learnings (6-12 months old)
   - API Rate Limit Pattern (score: 18→14.4)
   - Workflow State Mgmt (score: 21→16.8)
🗄️ 2 archive candidates (12+ months old)
   - Old Auth Method (replaced by OAuth)
   - Deprecated API (endpoint removed)

Actions: Refresh | Archive | Continue
```

### Archival Process

When you archive a learning:
1. Entry moved to `.agent/archive/[YYYY-QQ].md`
2. Context preserved (why archived, what replaced it)
3. Navigation updated in primary files
4. Broken links cleaned up

**Archive Structure**:
```
.agent/archive/
  ├── 2024-Q1.md  (Jan-Mar 2024)
  ├── 2024-Q2.md  (Apr-Jun 2024)
  └── index.md    (archive index)
```

### Refresh vs Archive

**Refresh** (reset age to 0):
- ✅ Learning still relevant and actively used
- ✅ Recently referenced in code/docs
- ✅ Core pattern confirmed valid

**Archive** (move to archive):
- ❌ Tech stack changed (e.g., migrated to new auth)
- ❌ Problem permanently fixed
- ❌ Better solution found
- ❌ No longer applicable

### Quality Metrics

Healthy documentation targets:
- **Primary files**: <20 active learnings, <500 lines
- **Average age**: <6 months for primary files
- **Archive rate**: ~20% per year (natural churn)

---

## Best Practices

### When to Use /learn

✅ **Good times**:
- After fixing a non-trivial bug
- Discovered a pattern worth documenting
- Multi-round problem solving (3+ attempts)
- User corrected your approach
- Found documentation errors

❌ **Skip when**:
- One-off edge case unlikely to recur
- Already well-documented
- Trivial/obvious patterns

### Writing Effective Learnings

**DO**:
- ✅ Use compact format (≤30 lines)
- ✅ Focus on reusable patterns
- ✅ Include verification steps
- ✅ Link related docs

**DON'T**:
- ❌ Document one-time fixes
- ❌ Use verbose prose
- ❌ Duplicate existing content
- ❌ Skip root cause analysis

---

## Examples

### Example 1: Simple Error

**Scenario**: API call failed with 401

**User**: `/learn`

**Output**:
```markdown
## 📝 Learning: Missing API Key

**Base Score**: 12/27 (S:2 × I:2 × R:3)
**Freshness**: 1.0 (new learning, 0 months old)
**Final Score**: 12/27
**Target**: .agent/rules/api-patterns.md

**Proposed Update**:
```markdown
## Error: 401 Unauthorized
<!-- meta
created: 2025-01-18
last-verified: 2025-01-18
original-score: 12
current-score: 12
freshness: 1.0
status: active
references: 0
-->

Symptom: API returns 401
Cause: Missing `Authorization` header
Fix: Add `-H "Authorization: Bearer $TOKEN"`
Prevent: Check env `$API_KEY` set
```

**Lifecycle Note**: This learning will decay naturally over time.
Review with `/learn --review` after 6 months to verify relevance.

Do you approve?
```

### Example 2: Multi-Round Debug

**Scenario**: 4 attempts to fix workflow state issue

**User**: "Why did this take so long? /learn"

**Output**:
```markdown
## 📝 Learning: Workflow State Monitoring

**Base Score**: 21/27 (S:3 × I:3 × R:2)
**Freshness**: 1.0 (new learning, 0 months old)
**Final Score**: 21/27
**Classification**: Global (affects all workflows)
**Targets**: CLAUDE.md + sync AGENTS.md + navigation

**Timeline**:
1. Check logs → ❌ No errors
2. Restart → ❌ Still stuck
3. Check DB → ❌ State inconsistent
4. Add health check → ✅ Fixed

**Blind Spots**: Assumed DB state = reality

**Proposed Updates**:

#### CLAUDE.md#Workflow-Architecture
```markdown
## Rule: Workflow State Management
<!-- meta
created: 2025-01-18
last-verified: 2025-01-18
original-score: 21
current-score: 21
freshness: 1.0
status: active
references: 0
-->

Check: Worker health ≠ workflow state
Miss: Trusting state DB without worker verification
Test: `pgrep -f worker && echo "alive" || echo "dead"`
Fix: Add health check endpoint + state reconciliation
```

#### Navigation Update
```markdown
- [Workflow Debugging](.agent/rules/workflow-debug.md) - State issues, health checks
```

**Lifecycle Note**: High-importance learning (score 21/27).
Will remain in primary files for 6+ months before any decay.

Do you approve all updates?
```

---

## Integration with Other Skills

Works well with:
- **skill-creator** - Create skills based on learnings
- **mcp-builder** - Build MCP servers from patterns
- **codex-cli** - Share learnings across platforms

---

## Contributing

Found a bug or have suggestions?

1. Check existing issues in the project repo
2. Test with different memory file configurations
3. Provide examples of your use case

---

## Changelog

### v1.0.0 (2026-01-18)
- Initial release
- Cross-platform memory file support
- LLM-friendly compact format
- Multi-round cognitive retrospective
- Documentation self-correction
- Multi-platform sync

---

## License

MIT License - See project LICENSE file

---

## Links

- [Claude Code Documentation](https://code.claude.com/docs)
- [Cursor Rules Guide](https://cursor.sh/docs)
- [Codex Documentation](https://developers.openai.com/codex)

---

**Remember**: The goal is not to document everything, but to capture **reusable, impactful knowledge** in the **right place** with the **right level of detail**.
