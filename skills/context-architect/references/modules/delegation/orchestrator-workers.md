# Orchestrator-Workers Delegation Pattern

Based on Anthropic's multi-agent research system.

## Pattern Overview

**Architecture:**
```
              [Orchestrator]
                    ↓
        ┌───────────┼───────────┐
        ↓           ↓           ↓
    [Worker 1]  [Worker 2]  [Worker N]
        ↓           ↓           ↓
    [Results] → [Synthesis] → [Output]
```

**Use When:**
- Complex task divisible into independent subtasks
- Subtasks require different specializations
- Parallelization can improve speed/quality
- Results need coordinated aggregation

## Orchestrator Instructions

```markdown
## Task Delegation Protocol

### 1. Task Decomposition

**Analyze request to identify:**
- Independent subtasks (can run in parallel)
- Dependent subtasks (require sequential execution)
- Estimated complexity of each subtask

**Decomposition principles:**
- Each subtask should be self-contained
- Minimize inter-task dependencies
- Balance workload across workers
- Prefer parallel over sequential when possible

### 2. Worker Selection

**Match tasks to worker specializations:**

| Task Type | Recommended Worker |
|-----------|-------------------|
| Information gathering | Researcher |
| Code implementation | Developer |
| Quality validation | Evaluator |
| Data analysis | Analyst |
| [Custom...] | [Custom...] |

**Selection criteria:**
- Worker expertise alignment
- Worker current availability/load
- Task urgency and priority
```

## Worker Instruction Template

```markdown
## Delegation Message Format

**To:** [Worker Type/ID]
**Task:** [Clear, specific objective]
**Priority:** [High/Medium/Low]

### Context
[Relevant background information]
[Related to overall goal but not task-specific details]

### Your Responsibility
[Specific actions expected from this worker]

### Inputs
- [Input 1]: [Description/location]
- [Input 2]: [Description/location]

### Constraints
- **Time:** [Deadline or time limit]
- **Quality:** [Acceptance criteria]
- **Format:** [Expected output structure]
- **Scope:** [Boundaries of what to/not to do]

### Output Format
```
[Expected structure]
[Key sections]
[Data format]
```

### Dependencies
- **Requires:** [Tasks that must complete first]
- **Blocks:** [Tasks waiting on this]

### Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3
```

## Information Density Principle

**From Anthropic research_lead_agent:**

> "Provide detailed, specific instructions maximizing information density. Express all needed information in minimum words."

**Good:**
```markdown
Task: Extract pricing from competitor sites: acme.com, widgets.io, tools.dev
Output: CSV with columns: company, plan_name, price_usd, features_list
Constraint: Only current pricing (skip historical/archived pages)
```

**Bad:**
```markdown
Task: Look at some competitor websites and see what they charge
Output: Some kind of summary would be good
```

## Agent Count Guidelines

**From Anthropic patterns (max 20 agents):**

```markdown
### Determine Agent Count

**Factors:**
- Task parallelizability (natural divisions)
- Diminishing returns threshold (too many = coordination overhead)
- Resource constraints (API limits, costs)

**Guidelines:**
- Simple task: 1-3 agents
- Moderate complexity: 4-8 agents
- High complexity: 9-15 agents
- Maximum: 20 agents (coordination breaks down beyond this)

**Quality over quantity:**
Better to have 5 well-instructed agents than 15 vague ones.
```

## Result Aggregation

```markdown
### Synthesis Strategy

**1. Collect all worker outputs**
- Wait for critical tasks (blocking)
- Timeout for non-critical tasks (continue with partial results)

**2. Validate individual results**
```python
for result in worker_outputs:
    if not meets_success_criteria(result):
        flag_for_review(result)
        # Option: request retry or proceed with degraded quality
```

**3. Detect conflicts**
- Contradictory findings across workers
- Overlapping work (duplication)
- Missing information (gaps)

**4. Merge and synthesize**
- Combine complementary results
- Resolve conflicts (prioritize by source quality)
- Fill gaps with follow-up tasks if critical

**5. Quality check aggregated output**
- Completeness: All requirements met?
- Consistency: No internal contradictions?
- Coherence: Results form unified whole?
```

## Parallel Execution Optimization

```markdown
### Maximize Throughput

**Call all independent workers simultaneously:**

❌ **Sequential (Slow):**
```
1. Call worker 1 → wait → result 1
2. Call worker 2 → wait → result 2
3. Call worker 3 → wait → result 3
Total time: T1 + T2 + T3
```

✅ **Parallel (Fast):**
```
1. Call workers 1, 2, 3 simultaneously
2. Wait for all → results 1, 2, 3
Total time: max(T1, T2, T3)
```

**Implementation:**
- Identify all tasks with no dependencies
- Issue all instructions in single message
- Use tool calling to spawn multiple agents at once
```

## Error Handling

```markdown
### Worker Failure Scenarios

**Worker returns error:**
1. Analyze error type
2. Retry with clarified instructions (max 2 retries)
3. If persistent failure: reassign to different worker or degrade gracefully

**Worker timeout:**
1. If critical: Wait longer or retry
2. If non-critical: Proceed with partial results, note limitation

**Worker returns low-quality result:**
1. Evaluate against success criteria
2. Request refinement with specific feedback
3. If still insufficient: escalate to user or accept limitation

**Coordination failure (conflicting results):**
1. Identify source of conflict
2. Re-query workers for clarification
3. Use evaluator agent for tie-breaking
4. Document uncertainty in final output
```

## Adaptive Re-Planning

```markdown
### Update Strategy Based on Findings

**Bayesian approach:**
As results arrive, update understanding and re-prioritize remaining work.

**Example:**
```
Initial plan:
1. Research 5 competitor features [Priority: High]
2. Analyze user reviews [Priority: Medium]
3. Compare pricing [Priority: Medium]

After step 1 results:
→ Discovered: Most competitors focus on Feature X
→ Update: Boost priority of Feature X analysis to High
→ Adjust: Add deep-dive task for Feature X implementation patterns
```

**When to re-plan:**
- Unexpected findings change problem scope
- Initial assumptions proven wrong
- User provides additional requirements mid-execution
```

## Context Isolation

**Principle:** Each agent should operate in a clean context window with only task-relevant information. This prevents context rot and ensures focused reasoning.

### Context Distribution

```markdown
### What Each Agent Sees

**Orchestrator context:**
- High-level task description and goals
- Worker capabilities and specializations
- Aggregated summaries from completed workers
- Current plan state and remaining tasks
- Does NOT see: Raw worker tool outputs, detailed worker reasoning

**Worker context:**
- Focused task instruction (from delegation message)
- Tools relevant to this specific task only
- Input data needed for this task only
- Does NOT see: Other workers' tasks, full conversation history, orchestrator's planning

**Evaluator context:**
- Output to evaluate
- Evaluation criteria and rubrics
- Does NOT see: How the output was produced, worker tool calls
```

### Summary Constraints

```markdown
### Worker Summary Requirements

**Max tokens:** 1,000-2,000 tokens per worker summary
**Must be self-contained:** Readable without worker's full context

**Required sections:**
- Task: What was asked (1-2 sentences)
- Findings: Key results (bulleted list)
- Decisions: Choices made and why (if applicable)
- Issues: Problems encountered (if any)
- Recommendation: Next steps (if applicable)

**Example summary (good — ~300 tokens):**
Task: Research React authentication patterns for SPAs.
Findings:
- JWT with httpOnly cookies is the current best practice
- OAuth 2.0 PKCE flow recommended for third-party auth
- Session-based auth still viable for server-rendered apps
Decisions: Focused on SPA patterns per task scope.
Issues: Limited recent data on React 19 auth patterns.
Recommendation: Use JWT + httpOnly cookies with refresh token rotation.

**Anti-pattern (bad — 5,000+ tokens):**
[Entire search history, raw API responses, full code examples, verbose reasoning...]
```

### Benefits of Context Isolation

1. **Prevents context rot** — Each agent has a focused, high-signal context
2. **Enables parallelism** — Agents don't need to wait for shared context
3. **Reduces costs** — Smaller context windows = fewer tokens processed
4. **Improves quality** — Agents reason better with focused information
5. **Enables scaling** — Add more agents without degrading existing ones

## Parameters to Customize

- Worker types and specializations
- Maximum agent count (default: 20)
- Timeout thresholds
- Retry limits
- Success criteria templates
- Output format standards
- Communication protocol details
- Summary token limit (default: 1,500)
- Context isolation level (strict / relaxed)
