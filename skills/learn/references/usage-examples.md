# Learn Skill Usage Examples

Real-world examples of using the `/learn` skill effectively.

---

## Example 1: Simple Error Resolution

### Scenario
API call failed with 401 error after multiple attempts.

### Conversation Flow

```
User: "Why am I getting 401?"
Claude: "Checking your request... you're missing the Authorization header"
User: "Added it, now it works!"
User: "/learn"
```

### Learn Skill Output

```markdown
## 📝 Learning Analysis Complete

### Discovered Memory Files
- ✅ CLAUDE.md (primary, Claude Code)
- ⚠️ .agent/rules/api-patterns.md (not found, will create)

### Extracted Learning

**Type**: Error Resolution
**Importance Score**: 12/27 (S:2 × I:2 × R:3)
**Classification**: Domain-specific

**Timeline**:
1. API call → ❌ 401 Unauthorized
2. Added Authorization header → ✅ Success

**Root Cause**: Missing authentication header in request

**Why It Matters**: Common mistake when integrating APIs, reusable pattern

---

### Proposed Updates

#### 📚 Create: .agent/rules/api-patterns.md

```markdown
# API Patterns

## Authentication

### Error: Missing Auth Header
Symptom: 401 Unauthorized
Cause: No `Authorization` header in request
Fix: Add `Authorization: Bearer <token>`
Prevent: Check `curl` examples include `-H "Authorization: Bearer..."`
Test: `curl -H "Authorization: Bearer test" /api/endpoint`
```

#### 📍 Navigation: CLAUDE.md (end of file)

```diff
+ ## 📚 Related Documentation
+ - [API Patterns](.agent/rules/api-patterns.md) - Authentication, rate limits
```

---

Do you approve these changes?
```

**User Response**: "✅ Approve"

**Result**: Files created/updated successfully

---

## Example 2: Multi-Round Complex Debugging

### Scenario
Workflow state got stuck after 4 different debugging attempts.

### Conversation Flow

```
User: "Workflow is stuck in 'running' state"
Claude: "Let me check the logs... no errors found"
User: "Still stuck after restart"
Claude: "Checking database... state shows 'running' but..."
User: "Check if the worker process is actually alive"
Claude: "Good catch! Worker died but state didn't update. Let me add health check"
User: "Perfect! /learn - this was a complex one"
```

### Learn Skill Output

```markdown
## 📝 Learning Analysis Complete

### Discovered Memory Files
- ✅ CLAUDE.md (primary, Claude Code)
- ✅ AGENTS.md (primary, Codex)
- ✅ .agent/rules/project-rules.md (primary, Gemini)
- ✅ .agent/rules/workflow-architecture.md (specialized)

### Extracted Learning

**Type**: Multi-Round Debug (4 attempts)
**Importance Score**: 21/27 (S:3 × I:3 × R:2)
**Classification**: Global rule (affects all workflows)

**Timeline**:
1. Check logs → ❌ No errors, but stuck
2. Restart workflow → ❌ Still stuck
3. Check DB state → ❌ Shows "running" but suspicious
4. Check worker process → ✅ Dead worker, added health check

**Turning Point**: User suggested checking worker process status

**Blind Spots**:
- Information: Didn't verify process status first
- Assumption: Assumed DB state = reality
- System: No automated health monitoring
- Cognitive: Anchored on "logs show no error"

**Root Cause**: Worker process can die without updating workflow state

**Why It Matters**: Critical pattern - state inconsistency can cause silent failures

---

### Proposed Updates

#### 📍 Primary: CLAUDE.md (Section 4: Architecture)

```diff
## Workflow State Management

+ ### Critical Rule: Verify Worker Health
+
+ **Pattern**: DB state ≠ process reality
+ - Check: `ps aux | grep worker` or `pgrep -f worker`
+ - Miss: Trusting DB state without process verification
+ - Test: `pgrep -f worker && echo "alive" || echo "dead"`
+ - Fix: Add `/health` endpoint + automated reconciliation
+
+ **Debug checklist**:
+ 1. Check logs (errors, warnings)
+ 2. Verify process running (`ps`/`pgrep`)
+ 3. Check DB state consistency
+ 4. Review recent deployments
+
+ **Prevention**: Implement worker health checks + state reconciliation job
```

#### 🔄 Sync: AGENTS.md (identical content)
#### 🔄 Sync: .agent/rules/project-rules.md (+ Gemini note)

#### 📚 Update: .agent/rules/workflow-architecture.md

```diff
## Troubleshooting

+ ### Issue: Workflow Stuck in "Running"
+ Debug: Check logs → `ps aux | grep worker` → verify state
+ Solution: Kill stuck worker + add health monitoring
+ Verify: `curl /health` returns 200 + state updates
+ Prevention: Automated health check every 30s
```

#### 📍 Navigation: CLAUDE.md (end of file)

```diff
## 📚 Related Documentation
- [API Patterns](.agent/rules/api-patterns.md) - Authentication, rate limits
+ - [Workflow Architecture](.agent/rules/workflow-architecture.md) - State management, debugging
```

---

**Sync Strategy**:
1. Update CLAUDE.md first
2. Sync identical content to AGENTS.md (change `.claude/` → `.codex_cache/`)
3. Sync to .agent/rules/project-rules.md (add Gemini compatibility note)
4. Update .agent/rules/workflow-architecture.md
5. Update navigation in all primary files

Do you approve all updates?
```

**User Response**: "✅ Approve all updates"

**Result**:
- CLAUDE.md updated ✓
- AGENTS.md synced ✓
- .agent/rules/project-rules.md synced ✓
- .agent/rules/workflow-architecture.md updated ✓
- Navigation added to all primary files ✓

---

## Example 3: Documentation Error Correction

### Scenario
Found incorrect file path in CLAUDE.md while following instructions.

### Conversation Flow

```
User: "Follow the instructions in CLAUDE.md to deploy"
Claude: "Reading CLAUDE.md... it says to run ./scripts/deploy.sh"
Claude: "Error: ./scripts/deploy.sh not found"
Claude: "Let me search... found it at ./deployment/deploy.sh"
Claude: "🔧 Documentation Error Found - should I update CLAUDE.md?"
User: "Yes, fix it"
```

### Learn Skill Output

```markdown
## 🔧 Documentation Error Found

**File**: CLAUDE.md
**Location**: Section 5: Commands
**Type**: Path Error
**Current**: `./scripts/deploy.sh`
**Correct**: `./deployment/deploy.sh`
**Verified by**: `ls deployment/deploy.sh` ✓

### Proposed Fix

**Files to update**: CLAUDE.md, AGENTS.md, .agent/rules/project-rules.md

```diff
## Deployment

- Run deployment script: `./scripts/deploy.sh`
+ Run deployment script: `./deployment/deploy.sh`
```

### 3-Way Sync Required?
- [x] CLAUDE.md
- [x] AGENTS.md
- [x] .agent/rules/project-rules.md

---

Awaiting user approval to apply corrections...
```

**User Response**: "Approve"

**Result**: All three files updated with correct path

---

## Example 4: Platform-Specific Learning

### Scenario
Feature works in Claude Code but fails in Cursor.

### Conversation Flow

```
User: "This code works in Claude but not in Cursor"
Claude: "Investigating... Cursor uses different skill loading mechanism"
User: "/learn - this is platform-specific"
```

### Learn Skill Output

```markdown
## 📝 Learning Analysis Complete

### Discovered Memory Files
- ✅ CLAUDE.md (primary, Claude Code)
- ✅ .cursorrules (primary, Cursor)

### Extracted Learning

**Type**: Platform-Specific Pattern
**Importance Score**: 15/27 (S:2 × I:3 × R:2.5)
**Classification**: Platform-specific

**Platform Difference**: Skill loading timing differs between Claude Code and Cursor

---

### Proposed Updates

#### 📍 CLAUDE.md (Platform Notes section)

```diff
+ ## Platform Compatibility
+
+ ### Cursor Differences
+ - Skill loading: Cursor loads skills at workspace open, Claude loads on-demand
+ - Workaround: Reload Cursor window after installing new skills
+ - Test: Check skill available with `/skill-name`
```

#### 📍 .cursorrules (add note)

```diff
+ # Cursor-Specific Notes
+
+ Skills are loaded at workspace open
+ - After installing new skill: Cmd+Shift+P → "Reload Window"
```

---

Do you approve these changes?
```

---

## Example 5: Creating New Specialized Doc

### Scenario
Multiple API-related learnings accumulated, need dedicated document.

### Conversation Flow

```
User: "We've learned a lot about API patterns, maybe create a dedicated doc?"
User: "/learn"
```

### Learn Skill Output

```markdown
## 📝 Learning Analysis Complete

### Recommendation: Create New Document

**Reason**: Accumulated 5+ API-related learnings, CLAUDE.md becoming cluttered

**Proposed**: Create `.agent/rules/api-patterns.md`

**Contents to move**:
1. Authentication patterns
2. Rate limiting handling
3. Idempotency keys
4. Error retry logic
5. Timeout configuration

---

### Proposed Updates

#### 📚 Create: .agent/rules/api-patterns.md

```markdown
# API Patterns & Best Practices

## Authentication

### Pattern: Bearer Token
Symptom: 401 Unauthorized
Fix: `Authorization: Bearer <token>`
Test: `curl -H "Authorization: Bearer..." /api/endpoint`

## Rate Limiting

### Pattern: Exponential Backoff
Symptom: 429 Too Many Requests
Fix: Implement exponential backoff (1s, 2s, 4s, 8s)
Test: Check `X-RateLimit-Remaining` header
Code: See `src/lib/api-client.ts#retryWithBackoff`

## Idempotency

### Pattern: Idempotency Keys
Symptom: Duplicate requests on retry
Fix: Add `Idempotency-Key: <uuid>` header
Test: Send same request twice, verify no duplicate
```

#### 📍 CLAUDE.md (remove API details, add reference)

```diff
- [Detailed API authentication content...]
- [Detailed rate limiting content...]
- [Detailed idempotency content...]

## 📚 Related Documentation
+ - [API Patterns](.agent/rules/api-patterns.md) - Comprehensive API integration guide
```

---

Do you approve creating new document and reorganizing content?
```

---

## Example 6: Skipping Low-Value Learning

### Scenario
Fixed a one-off typo, not worth documenting.

### Conversation Flow

```
User: "/learn"
```

### Learn Skill Output

```markdown
## 📝 Learning Analysis Complete

### Discovered Memory Files
- ✅ CLAUDE.md (primary)

### Extracted Learning

**Type**: Typo fix
**Importance Score**: 1/27 (S:1 × I:1 × R:1)
**Classification**: One-time issue

**Analysis**: Fixed typo in variable name (`usre` → `user`)

---

### Recommendation: Skip Documentation

**Reason**:
- Low reusability (typo unlikely to recur)
- Low impact (simple fix)
- Already caught by linter/tests
- No architectural or pattern learning

**Suggestion**: No documentation needed, but consider:
- Enabling spell-check in editor
- Adding to PR review checklist if frequent

---

No updates proposed.
```

---

## Example 7: Navigation-Only Update

### Scenario
Created specialized doc manually, need to add navigation.

### Conversation Flow

```
User: "I created .agent/rules/database-patterns.md manually"
User: "/learn - just update navigation please"
```

### Learn Skill Output

```markdown
## 📝 Learning Analysis Complete

### Discovered Memory Files
- ✅ CLAUDE.md (primary)
- ✅ AGENTS.md (primary)
- ✅ .agent/rules/database-patterns.md (specialized, new)

### Action: Navigation Update Only

---

### Proposed Updates

#### 📍 CLAUDE.md (navigation section)

```diff
## 📚 Related Documentation
- [API Patterns](.agent/rules/api-patterns.md) - API integration guide
- [Workflow Architecture](.agent/rules/workflow-architecture.md) - State management
+ - [Database Patterns](.agent/rules/database-patterns.md) - Query optimization, transactions
```

#### 🔄 Sync: AGENTS.md (same update)

---

Do you approve navigation updates?
```

---

## Tips for Effective Learning

### When to Use /learn

✅ **Good scenarios**:
- After fixing non-trivial bugs (2+ attempts)
- Discovered reusable pattern
- User corrected your approach
- Platform-specific behavior discovered
- Documentation errors found
- Multi-round debugging (3+ attempts)

❌ **Skip when**:
- One-off typos or trivial fixes
- Already well-documented
- Obvious/common knowledge
- Edge case unlikely to recur

### How to Invoke

**After problem resolution**:
```
User: "/learn"
```

**With context**:
```
User: "Learn from this API authentication issue"
```

**For complex problems**:
```
User: "This took 5 attempts, help me understand what to learn"
```

**For documentation errors**:
```
User: "Found wrong path in CLAUDE.md, please fix and sync"
```

### Approval Workflow

**Review carefully**:
- Check importance score reasoning
- Verify document routing makes sense
- Ensure sync strategy is appropriate
- Review content for accuracy

**Modify if needed**:
```
User: "Update looks good but put it in specialized doc instead"
```

**Approve**:
```
User: "✅ Approve"
User: "Approve all updates"
User: "Approve"
```

**Reject**:
```
User: "❌ Skip"
User: "Skip this one"
```

---

## Common Patterns

### Pattern 1: Error → Specialized Doc

High reusability errors go to specialized docs:
- API errors → `.agent/rules/api-patterns.md`
- Workflow errors → `.agent/rules/workflow-architecture.md`
- Timeout issues → `docs/timeout-configuration.md`

### Pattern 2: Global Rule → Primary Files

Critical rules that affect all code:
- Security rules → CLAUDE.md + sync all
- Architecture constraints → CLAUDE.md + sync all
- Workflow patterns → CLAUDE.md + sync all

### Pattern 3: Platform-Specific → Platform File

Platform differences:
- Claude-specific → CLAUDE.md only
- Cursor-specific → .cursorrules
- Works in A but not B → Both files with notes

### Pattern 4: Accumulation → New Doc

When category has 5+ entries:
- Extract to specialized doc
- Keep summary in primary
- Update navigation

---

## Verification Checklist

After /learn completes:

- [ ] Importance score makes sense
- [ ] Document routing is appropriate
- [ ] Compact format followed (≤30 lines)
- [ ] Sync strategy correct
- [ ] Navigation updated if needed
- [ ] No duplicate content
- [ ] Links work
- [ ] Formatting correct

---

*Last updated: 2026-01-18*