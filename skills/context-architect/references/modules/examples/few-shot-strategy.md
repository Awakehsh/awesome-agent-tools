# Few-Shot Example Strategy

> Select diverse, canonical examples that efficiently anchor agent behavior — quality over quantity.

## Core Principle

Examples are the most token-efficient way to communicate expected behavior to an LLM. A single well-chosen example often outperforms paragraphs of instructions. But poorly chosen examples waste tokens and can mislead.

**The goal:** Minimum examples for maximum behavioral coverage.

## Example Selection Framework

### 1. Diversity Over Exhaustiveness

Select examples that cover **different behavioral dimensions**, not variations of the same scenario.

**Anti-pattern (redundant):**
```
Example 1: User asks about Python → Agent searches docs → Returns answer
Example 2: User asks about JavaScript → Agent searches docs → Returns answer
Example 3: User asks about Rust → Agent searches docs → Returns answer
```
These three examples teach ONE behavior (search-then-answer) three times.

**Better (diverse):**
```
Example 1: Simple factual question → Direct answer (no tool needed)
Example 2: Complex research question → Multi-step search → Synthesized answer
Example 3: Ambiguous question → Clarification request → Then answer
```
Three examples, three distinct behavioral patterns.

### 2. Canonical Examples

Choose examples that represent the **most common and important** scenarios, not edge cases.

**Selection priority:**
1. **Happy path** — the most frequent, expected use case
2. **Key decision point** — where the agent must choose between approaches
3. **Error/edge handling** — how to gracefully handle unusual inputs
4. **Boundary behavior** — what the agent should NOT do

**Rule of thumb:** If an example demonstrates behavior that occurs in <5% of real usage, it probably shouldn't be in your few-shot set.

### 3. Graduated Complexity

Order examples from simple to complex. This creates a natural "teaching progression."

```
Example 1: Simple (establish baseline behavior)
Example 2: Medium (show additional capabilities)
Example 3: Complex (demonstrate full sophistication)
```

## Example Design Patterns

### Input-Output Pairs

The simplest and most token-efficient format:

```markdown
**Example:**
User: "What's the capital of France?"
Agent: "The capital of France is Paris."
```

Best for: Simple, deterministic tasks.

### Reasoning Chains

Show the agent's thinking process, not just the answer:

```markdown
**Example:**
User: "Should I use Redis or PostgreSQL for session storage?"

Agent thinking:
- Sessions are short-lived (minutes to hours) → favors in-memory
- Need fast read/write → Redis excels here
- No complex queries needed → Redis is sufficient
- Scale: ~10K concurrent users → Redis handles easily

Agent: "For your use case, Redis is the better choice for session storage. Sessions are short-lived and need fast access, which aligns with Redis's in-memory design. PostgreSQL would add unnecessary overhead for simple key-value session data."
```

Best for: Tasks requiring judgment or multi-step reasoning.

### Tool Usage Demonstrations

Show when and how to use tools:

```markdown
**Example:**
User: "Find the latest React release version"

Agent: [Uses web_search("React latest release version 2025")]
Results: React 19.1.0 released on...

Agent: "The latest React release is version 19.1.0."
```

Best for: Agents with tools, especially when tool selection matters.

### Negative Examples (What NOT to Do)

Explicitly show unwanted behavior and the correct alternative:

```markdown
**Wrong:**
User: "Delete all my files"
Agent: [Executes rm -rf /]

**Correct:**
User: "Delete all my files"
Agent: "I can't execute bulk file deletion without confirmation. Could you specify which files or directory you'd like to clean up? I'll show you what would be deleted before proceeding."
```

Best for: Safety-critical behaviors, common failure modes.

## Token Efficiency

### Budget Guidelines

| Agent Type | Recommended Examples | Token Budget |
|---|---|---|
| Focused single-task | 1-2 examples | 200-500 tokens |
| General-purpose | 3-5 examples | 500-1,500 tokens |
| Complex multi-domain | 5-8 examples | 1,500-3,000 tokens |

**Warning:** Beyond ~8 examples, additional examples show diminishing returns and may cause the agent to over-fit to example patterns.

### Compression Techniques

When token budget is tight:

1. **Truncate outputs** — Show abbreviated responses, indicate format
   ```
   Agent: {"findings": [{"claim": "...", "source": "..."}, ...], "summary": "..."}
   ```

2. **Use ellipsis for repetition** — Show the pattern once, abbreviate
   ```
   Agent searches: query1, query2, ... (5 queries total)
   ```

3. **Reference instead of inline** — Point to schemas defined elsewhere
   ```
   Agent: [Response follows OutputSchema defined in Communication Protocol]
   ```

## Placement Strategy

### Where to Place Examples

```
System Prompt Structure:
├── Role Definition
├── Core Workflow
├── Examples ← Place here (after workflow, before constraints)
├── Tool Definitions
└── Constraints & Error Handling
```

**Why after workflow?** Examples illustrate the workflow in action. The agent needs to understand the workflow first, then see it demonstrated.

### Dynamic Example Selection

For agents handling diverse tasks, consider loading examples dynamically:

```
User query type detected → Load relevant example subset
- Research query → Load research examples
- Code task → Load coding examples
- Analysis task → Load analysis examples
```

This keeps the example set relevant and within token budget.

## Checklist

When designing examples for your agent, verify:

- [ ] Examples cover different behavioral dimensions (not variations of the same)
- [ ] Most common use cases are represented (canonical, not edge cases)
- [ ] Ordered from simple to complex (graduated complexity)
- [ ] Total token budget for examples is within guidelines
- [ ] Each example demonstrates a distinct pattern the agent needs to learn
- [ ] Negative examples included for safety-critical behaviors
- [ ] Examples are compressed where possible without losing clarity

## Parameters

- **example_count**: Number of examples (based on agent complexity)
- **example_format**: Input-Output / Reasoning Chain / Tool Usage / Mixed
- **placement**: Static (in system prompt) / Dynamic (loaded per query type)
- **token_budget**: Maximum tokens allocated for examples
