# Context Management Strategy

> Manage the agent's context window as a finite, precious resource — optimize for maximum signal per token across the entire agent lifecycle.

## Core Concept: Context Engineering

Context engineering is the discipline of managing the **entire information state** available to an LLM during inference. This goes beyond writing good prompts — it encompasses:

- **What** information enters the context window
- **When** information is loaded (upfront vs. runtime)
- **How long** information persists (permanent vs. compacted vs. cleared)
- **Where** information lives (in-context vs. external memory vs. sub-agent)

**The fundamental constraint:** Context windows are finite. Every token competes for attention. As context grows, attention per token dilutes (context rot). The goal is to maintain the **highest signal-to-noise ratio** throughout the agent's operation.

## Token Budget Planning

### Budget Allocation Framework

For a given context window size, allocate tokens across components:

```
Total Context Window: N tokens
├── System Prompt:        15-25%  (static instructions)
├── Tool Definitions:     10-15%  (capability descriptions)
├── Examples:              5-10%  (behavioral anchoring)
├── Message History:      30-40%  (conversation state)
├── Retrieved Content:    15-25%  (dynamic information)
└── Safety Buffer:         5-10%  (room for model output)
```

**Example for 200K context window:**
```
System Prompt:     30K-50K tokens
Tool Definitions:  20K-30K tokens
Examples:          10K-20K tokens
Message History:   60K-80K tokens
Retrieved Content: 30K-50K tokens
Safety Buffer:     10K-20K tokens
```

### Budget Adjustment by Task Type

| Task Type | System Prompt | Tools | Examples | History | Retrieval |
|---|---|---|---|---|---|
| Short Q&A | 15% | 10% | 10% | 25% | 30% |
| Long coding session | 20% | 15% | 5% | 40% | 15% |
| Research synthesis | 15% | 10% | 5% | 20% | 40% |
| Multi-agent orchestration | 25% | 15% | 10% | 30% | 10% |

## Context Retrieval Strategies

### Strategy 1: Preloaded (Eager)

Load all potentially relevant information upfront in the system prompt.

```
Context = [Full system prompt] + [All tools] + [All examples] + [All reference data]
```

**When to use:**
- Short-lived sessions (few turns)
- Small, well-defined information set
- Low-latency requirements

**Tradeoff:** Simple but wastes tokens on unused information.

### Strategy 2: Just-in-Time (Lazy)

Maintain lightweight identifiers (file paths, URLs, queries) and load information dynamically during execution.

```
Context = [System prompt with references] + [Tools] + [Loaded-on-demand data]

Agent sees: "User data is in /data/users.json"
Agent action: read_file("/data/users.json")  ← loads only when needed
```

**When to use:**
- Large information spaces (codebases, document collections)
- Long-running sessions where needs evolve
- Token-constrained environments

**Implementation:**
- Use metadata as signals (file names, folder structure, timestamps)
- Progressive disclosure: start with index/overview, drill into details
- Agent maintains mental model of what's available without loading everything

### Strategy 3: Hybrid (Recommended)

Combine upfront loading for essential context with just-in-time retrieval for everything else.

```
Upfront:   [Core instructions] + [Key config files] + [Critical examples]
Runtime:   [Search/read tools] + [Dynamic retrieval] + [Progressive discovery]
```

**Example (Claude Code pattern):**
- Upfront: CLAUDE.md files, project structure overview
- Runtime: grep/glob for code discovery, file reading on demand

**This is the recommended default** — it balances speed with token efficiency.

## Long-Horizon Task Management

For agents operating over many turns (50+ messages), context windows fill up. Three strategies address this:

### Strategy A: Compaction

Summarize the context window when it approaches capacity, preserving critical decisions while discarding redundant detail.

**What to preserve:**
- Architectural decisions and their rationale
- Current task state and progress
- Error history and lessons learned
- User preferences expressed during the session

**What to discard:**
- Raw tool outputs already processed
- Intermediate reasoning that led to final decisions
- Verbose error messages (keep just the resolution)
- Repeated information

**Implementation:**
```
When context_usage > 80%:
  1. Identify messages older than N turns
  2. Summarize: key decisions, current state, remaining tasks
  3. Replace old messages with summary
  4. Preserve most recent K messages in full
```

**Tool Result Clearing:**
A specific compaction technique — remove raw tool results from deep history. The agent has already processed these outputs; keeping them wastes tokens.

```
Before clearing:
  [Turn 5] Agent calls read_file("/src/app.ts")
  [Turn 5] Tool returns: [500 lines of code]
  [Turn 6] Agent: "I see the issue in line 42..."

After clearing:
  [Turn 5] Agent calls read_file("/src/app.ts")
  [Turn 5] Tool returns: [result cleared - agent processed this in turn 6]
  [Turn 6] Agent: "I see the issue in line 42..."
```

**Best for:** Extended back-and-forth conversations where flow continuity matters.

### Strategy B: Structured Note-Taking

Agent maintains persistent external memory files that survive context resets.

**Implementation:**
```
Agent writes to NOTES.md / TODO.md / PROGRESS.md:
  - Current task state
  - Decisions made and why
  - Dependencies and blockers
  - Key findings
  - Next steps

On context reset or new session:
  Agent reads NOTES.md → resumes from where it left off
```

**What to track in notes:**
- **Progress**: What's done, what remains
- **Decisions**: What was chosen, what was rejected, why
- **Dependencies**: What blocks what
- **State**: Current values, configurations, counters

**Best for:** Iterative development with clear milestones, tasks spanning multiple sessions.

### Strategy C: Sub-Agent Context Isolation

Delegate focused tasks to sub-agents, each with a clean context window. Sub-agents return condensed summaries (1,000-2,000 tokens) instead of raw results.

**Architecture:**
```
Main Agent (coordinator):
  Context = [High-level plan] + [Sub-agent summaries] + [Decision state]

Sub-Agent 1 (researcher):
  Context = [Focused research task] + [Search tools] + [Relevant docs only]
  Returns: 1,000-token summary of findings

Sub-Agent 2 (implementer):
  Context = [Implementation task] + [Code tools] + [Relevant files only]
  Returns: 1,500-token summary of changes made
```

**Key constraints:**
- Sub-agent summaries must be **1,000-2,000 tokens** max
- Summaries must be **self-contained** (understandable without sub-agent's full context)
- Main agent never sees sub-agent's raw tool outputs
- Sub-agents don't share context with each other (isolation)

**Best for:** Complex research or implementation where parallel exploration provides value.

## Strategy Selection Guide

```
Decision tree:
  ├── Short session (< 20 turns)?
  │   └── Use Preloaded or Hybrid retrieval, no compaction needed
  │
  ├── Medium session (20-100 turns)?
  │   ├── Single continuous task? → Compaction
  │   └── Multiple milestones? → Structured Note-Taking
  │
  └── Long session (100+ turns) or complex task?
      ├── Parallelizable subtasks? → Sub-Agent Isolation
      ├── Sequential milestones? → Note-Taking + Compaction
      └── Mixed? → All three strategies combined
```

## Attention Budget Awareness

### Context Rot

As context grows, transformer attention spreads across more token pairs (n² relationships). This causes:
- Earlier information gets less attention
- Important details buried in the middle get overlooked ("lost in the middle")
- Agent behavior becomes less predictable

**Mitigations:**
1. **Front-load critical information** — Most important instructions at the start
2. **Repeat key constraints** — Restate critical rules near the end of system prompt
3. **Use structural markers** — XML tags, Markdown headers help models navigate
4. **Trim aggressively** — Remove anything that isn't pulling its weight

### Signal-to-Noise Optimization

Every token in context should earn its place. Ask:
- Does this information change the agent's behavior? → Keep
- Is this information already implied by other context? → Remove
- Will the agent need this information in the next few turns? → Keep
- Is this a just-in-case inclusion? → Remove or move to JIT retrieval

## Checklist

When designing context management for your agent:

- [ ] Token budget allocated across all components (prompt, tools, examples, history, retrieval)
- [ ] Retrieval strategy selected (preloaded / JIT / hybrid)
- [ ] Long-horizon strategy selected if sessions > 20 turns
- [ ] Compaction policy defined (what to preserve, what to discard, trigger threshold)
- [ ] Note-taking structure defined if sessions span milestones
- [ ] Sub-agent summary constraints defined (max tokens, required fields)
- [ ] Critical information front-loaded in context
- [ ] Signal-to-noise ratio verified (no dead-weight tokens)

## Parameters

- **context_window_size**: Target model's context window (tokens)
- **session_length**: Expected turns (short / medium / long)
- **retrieval_strategy**: Preloaded / JIT / Hybrid
- **compaction_trigger**: Context usage threshold (e.g., 80%)
- **compaction_preserve**: List of information types to always keep
- **note_taking_schema**: Structure for persistent notes (if applicable)
- **sub_agent_summary_limit**: Max tokens per sub-agent summary (default: 1,500)
- **attention_priority**: List of information types ranked by importance
