---
name: context-architect
description: Context engineering tool for building AI agent systems. Use when developers need to design agent context strategies — system prompts, tool sets, examples, and runtime context management. Guides through modular design with built-in patterns and dynamic research.
---

# Context Architect

## Overview

A comprehensive context engineering tool for professional agent system developers. This skill transforms high-level requirements into production-ready **Context Engineering Packages** — not just system prompts, but the complete information architecture that drives agent behavior.

**Core philosophy:** Context engineering manages the **entire information state** during LLM inference — system instructions, tools, examples, message history, retrieval strategies, and runtime context management. A system prompt is just one component.

**Primary Focus:** Multi-agent collaboration systems (orchestrator-workers, evaluator-optimizer, hierarchical coordination)

**Also Supports:** Single-agent systems with structured workflows

## When to Use This Skill

Use this skill when:
- Designing new agent systems from scratch
- Architecting multi-agent orchestration patterns
- Optimizing existing agent system prompts and tool sets
- Converting business requirements to agent specifications
- Planning context management for long-horizon agent tasks
- Need platform-agnostic agent context designs

**User Signals:**
- "Help me design an agent system for..."
- "Create a multi-agent system that..."
- "Write a system prompt for..."
- "How should I architect agents to..."
- "Design the context strategy for..."

## Core Workflow

The skill uses a wizard-style interview process with flexible iteration:

```
[Phase 1: Requirements Gathering]
         ↓
[Phase 2: Context Architecture]
         ↓
[Phase 3: System Prompt Design]
         ↓
[Phase 4: Tool Design]
         ↓
[Phase 5: Example Strategy]
         ↓
[Phase 6: Context Management Strategy]
         ↓
[Phase 7: Dynamic Research] (if needed)
         ↓
[Phase 8: Generation & Export]
         ↓
[Phase 9: Iteration] (optional)
```

---

### Phase 1: Requirements Gathering

Ask focused questions to understand the system:

**Question 1: System Type**
```markdown
What type of agent system do you need?

A. Single-agent system
   - One agent handling specific domain/workflow
   - Example: Code reviewer, document analyzer, researcher

B. Multi-agent system
   - Multiple agents collaborating on complex tasks
   - Example: Research team, development pipeline, quality assurance chain

C. Hybrid system
   - Primary agent + specialized helpers for specific subtasks
   - Example: Main assistant with tools that are actually mini-agents
```

**Question 2: Primary Domain**
```markdown
What is the primary domain or use case?

Examples:
- Research & information gathering
- Software development & code generation
- Data analysis & reporting
- Content creation & editing
- Task automation & orchestration
- [User describes custom domain]

[Record domain for module selection]
```

**Question 3: Key Capabilities**
```markdown
What are the 3-5 core capabilities this system must have?

Example capabilities:
- Web search and information synthesis
- Code implementation and testing
- Quality evaluation and feedback
- Task decomposition and delegation
- Data processing and visualization
- [User specifies]

[Prioritize by importance]
```

**Question 4: Complexity & Horizon**
```markdown
Assess the operational profile:

A. Task Complexity:
   1. Simple (well-defined, single-step tasks)
   2. Moderate (multi-step workflows, some ambiguity)
   3. Complex (open-ended problems, requires planning and iteration)

B. Session Length:
   1. Short (< 20 turns, single task)
   2. Medium (20-100 turns, iterative workflow)
   3. Long (100+ turns, multi-session projects)

C. Context Window Target:
   1. Standard (8K-32K tokens)
   2. Extended (32K-128K tokens)
   3. Large (128K+ tokens)

[Determines context management sophistication needed]
```

---

### Phase 2: Context Architecture

**This is the key differentiator from traditional prompt engineering.** Design the overall context strategy before writing any prompt content.

**Step 1: Token Budget Allocation**

Based on Phase 1 answers, propose a token budget:

```markdown
## Context Budget Allocation

Target context window: [Size from Q4C]
Session length: [From Q4B]

| Component | % Budget | ~Tokens | Rationale |
|---|---|---|---|
| System Prompt | X% | ~N | [Why this allocation] |
| Tool Definitions | X% | ~N | [Based on capability count] |
| Examples | X% | ~N | [Based on complexity] |
| Message History | X% | ~N | [Based on session length] |
| Retrieved Content | X% | ~N | [Based on domain needs] |
| Safety Buffer | X% | ~N | [For model output] |

Does this budget feel right for your use case?
```

**Step 2: Information Source Planning**

Determine what goes where in the context:

```markdown
## Information Source Plan

**Static Context (in system prompt):**
- [Core role and workflow — always needed]
- [Key constraints and safety rules — always needed]
- [Domain-specific knowledge — if small and stable]

**Tool-Mediated (loaded via tool calls):**
- [Code files — read on demand]
- [Database queries — fetched as needed]
- [External API data — retrieved at runtime]

**Example-Anchored (few-shot in prompt):**
- [Critical behavioral patterns to demonstrate]
- [Key decision points to illustrate]

**Just-in-Time Retrieved:**
- [Large reference documents — loaded when relevant]
- [Historical data — queried when needed]
- [User-specific context — fetched per session]

This strategy ensures maximum signal within your token budget.
```

**Step 3: Context Lifecycle Strategy**

For medium/long sessions, define how context evolves:

```markdown
## Context Lifecycle

Based on session length: [Short/Medium/Long]

**Selected strategies:**
- [ ] Compaction: [Yes/No — when context > X% full, summarize older messages]
- [ ] Note-Taking: [Yes/No — maintain NOTES.md for cross-turn/session persistence]
- [ ] Sub-Agent Isolation: [Yes/No — delegate focused tasks to clean-context sub-agents]
- [ ] Tool Result Clearing: [Yes/No — clear raw tool outputs after processing]

**Compaction policy (if applicable):**
- Trigger: Context usage > [80]%
- Preserve: [decisions, current state, errors]
- Discard: [raw outputs, intermediate reasoning, verbose errors]

Ready to design the system prompt?
```

---

### Phase 3: System Prompt Design

Now design the actual system prompt, informed by the context architecture from Phase 2.

#### For Single-Agent Systems

Present architecture summary:
```markdown
## Proposed Single-Agent Architecture

**Agent Role:** [Role based on domain]
**Core Workflow:** [Sequential/Iterative/Decision-tree]
**Token Budget:** [From Phase 2]
**Key Modules Needed:**
- Role Definition: [Selected template]
- Workflow: [Selected workflow pattern]
- Quality Control: [If complexity >= Moderate]

Does this structure align with your needs?
```

#### For Multi-Agent Systems

**Question 5: Agent Count & Roles**
```markdown
How many distinct agent roles do you envision?

Consider:
- Orchestrator (1): Coordinates the system
- Workers (N): Perform specialized tasks
- Evaluator (0-1): Quality control
- [Custom roles based on domain]

Typical patterns:
- 1 orchestrator + 2-5 workers (most common)
- 1 orchestrator + 3-8 workers + 1 evaluator (comprehensive)
- Hierarchical: 1 lead + 2-3 sub-orchestrators + workers

[Note: Max 20 agents total — coordination breaks down beyond this]
```

**Question 6: Collaboration Pattern**
```markdown
What collaboration pattern fits best?

A. Orchestrator-Workers (Recommended)
   - Lead agent decomposes tasks, assigns to specialized workers
   - Workers execute independently, return condensed summaries
   - Lead synthesizes final output
   - Use when: Tasks naturally decompose into parallel subtasks

B. Pipeline (Sequential)
   - Agent 1 → Agent 2 → Agent 3 → ... → Output
   - Each agent performs one transformation
   - Use when: Task is a sequence of distinct stages

C. Evaluator-Optimizer (Iterative)
   - Worker generates output
   - Evaluator provides feedback
   - Worker refines, repeats until quality threshold met
   - Use when: Quality is critical, iteration expected

D. Hierarchical (Multi-level)
   - Top orchestrator → Mid-level coordinators → Workers
   - Use when: Very large scale (10+ agents)

E. Custom pattern
   - [User describes]
```

Present architecture visualization:
```markdown
## Proposed Multi-Agent Architecture

**Pattern:** [Selected pattern]
**Context Isolation:** Each agent gets a clean context window with only task-relevant information

**Architecture:**
[ASCII diagram of agent relationships]

**Agent Roles:**
1. [Orchestrator]: [Responsibilities] — Context: high-level plan + summaries
2. [Worker Type 1]: [Specialization] — Context: focused task + relevant tools
3. [Worker Type 2]: [Specialization] — Context: focused task + relevant tools
...

**Summary Constraints:**
- Each sub-agent returns max [1,000-2,000] token summary
- Summaries must be self-contained (readable without sub-agent context)

**Communication Flow:**
[Description of how agents interact]

Ready to proceed with detailed design?
```

#### Module Selection

Based on architecture, select modules from the knowledge base:

1. **Identify required modules** from `references/modules/`:
   - `roles/`: Match agent types to role templates
   - `workflows/`: Select appropriate process patterns
   - `delegation/`: For multi-agent, select coordination strategy
   - `communication/`: Define data exchange format
   - `quality/`: Add quality control mechanisms
   - `tools/`: Tool design guidelines
   - `examples/`: Example strategy
   - `context/`: Context management patterns

2. **Present module recommendations:**
```markdown
## Recommended Modules

**For [Agent Role 1]:**
- Role: `roles/orchestrator.md`
- Workflow: `workflows/research-workflow.md`
- Delegation: `delegation/orchestrator-workers.md`

**For [Agent Role 2]:**
- Role: `roles/researcher.md`
- Workflow: `workflows/sequential-pipeline.md`

**Context Strategy:**
- Management: `context/context-management.md`

**Tool Design:**
- Guidelines: `tools/tool-design.md`

**Example Strategy:**
- Guidelines: `examples/few-shot-strategy.md`

**Communication:**
- Protocol: `communication/structured-io.md`

**Quality Control:**
- Pattern: `quality/evaluation-criteria.md`

Customize any modules? [Y/N]
```

3. **Load selected modules** using Read tool and compose base structure.

---

### Phase 4: Tool Design

Design the agent's tool set following the principles from `tools/tool-design.md`.

**Process:**

1. **Inventory required tools:**
```markdown
## Tool Inventory

Based on capabilities from Phase 1:

| Tool Name | Purpose | Parameters | Token Cost |
|---|---|---|---|
| [tool_1] | [What it does] | [Key params] | ~N tokens |
| [tool_2] | [What it does] | [Key params] | ~N tokens |
| ... | ... | ... | ... |
| **Total** | | | **~N tokens** |

Budget check: [N] tokens used of [Budget] allocated → [OK / Over budget]
```

2. **Overlap analysis:**
```markdown
## Overlap Check

Potential overlaps detected:
- [tool_a] and [tool_b]: [Description of overlap]
  - Recommendation: [Merge / Keep separate because...]

No-overlap confirmed for remaining tools.
```

3. **Tool definitions:**
```markdown
## Tool Specifications

[For each tool, generate complete definition following tool-design.md principles]

### [tool_name]
- **Description:** [Self-contained description including when to use]
- **Parameters:** [Descriptive names, types, constraints, examples]
- **Returns:** [Output format and structure]
- **Errors:** [Structured error responses with corrective suggestions]
```

4. **Dynamic loading plan (if applicable):**
```markdown
## Dynamic Tool Loading

Phase-based tool availability:
- Phase 1 (Planning): [tool_1, tool_2, tool_3]
- Phase 2 (Execution): [tool_4, tool_5, tool_6]
- Phase 3 (Review): [tool_7, tool_8]

This keeps each phase's tool set focused.
```

---

### Phase 5: Example Strategy

Design the agent's few-shot examples following `examples/few-shot-strategy.md`.

**Process:**

1. **Identify behavioral dimensions to cover:**
```markdown
## Behavioral Dimensions

The agent needs to demonstrate:
1. [Happy path — most common use case]
2. [Key decision point — choosing between approaches]
3. [Error handling — graceful failure]
4. [Boundary behavior — what NOT to do] (if safety-critical)
```

2. **Design examples:**
```markdown
## Example Set

**Example 1: [Dimension]** (~N tokens)
[Input-output pair / reasoning chain / tool usage demo]

**Example 2: [Dimension]** (~N tokens)
[Input-output pair / reasoning chain / tool usage demo]

**Example 3: [Dimension]** (~N tokens)
[Input-output pair / reasoning chain / tool usage demo]

Total: ~N tokens (budget: N allocated)
```

3. **Placement decision:**
```markdown
Example placement: [Static in prompt / Dynamic per query type]
```

---

### Phase 6: Context Management Strategy

For agents with medium/long sessions, design the runtime context management plan using `context/context-management.md`.

**Process:**

1. **Select retrieval strategy:**
```markdown
## Retrieval Strategy

Selected: [Preloaded / Just-in-Time / Hybrid]

Justification: [Based on domain, session length, information volume]

Implementation:
- Upfront: [What's loaded at start]
- Runtime: [What's loaded on demand]
- Signals: [How agent knows what to retrieve — file names, metadata, user cues]
```

2. **Define compaction policy (if sessions > 20 turns):**
```markdown
## Compaction Policy

Trigger: Context usage > [X]%
Preserve: [List of information types]
Discard: [List of information types]
Tool result clearing: [After N turns / After processing / Never]
```

3. **Define note-taking structure (if sessions span milestones):**
```markdown
## Persistent Memory Structure

File: [NOTES.md / PROGRESS.md / etc.]
Schema:
  - Current task state
  - Decisions made (what, why)
  - Dependencies and blockers
  - Key findings
  - Next steps
Update frequency: [Every N turns / At milestones / On significant events]
```

4. **Define sub-agent constraints (if multi-agent):**
```markdown
## Sub-Agent Context Isolation

Summary constraints:
- Max tokens per summary: [1,000-2,000]
- Required fields: [task, findings, decisions, next_steps]
- Self-contained: [Summary must be understandable without sub-agent's context]

Context separation:
- Main agent sees: [High-level plan + summaries only]
- Sub-agents see: [Focused task + relevant tools + relevant data only]
- Sub-agents do NOT see: [Other sub-agents' contexts, full conversation history]
```

---

### Phase 7: Dynamic Research (Conditional)

**Trigger conditions:**
- User explicitly requests industry research
- Complex/novel domain not covered by built-in modules
- User asks "What are current best practices for..."
- Conflicting approaches need comparison

**Research Process:**

1. **Identify research needs:**
```markdown
I notice this is a [novel domain / complex requirement].

Would you like me to research current industry best practices?

Research topics:
- [Topic 1 based on domain]
- [Topic 2 based on architecture]
- [Topic 3 based on tools/capabilities]

[Y/N]
```

2. **Execute research** using WebSearch + WebFetch:
```markdown
Researching: [Topic]

[WebSearch for relevant patterns/implementations]
[WebFetch detailed documentation from top results]

Found insights:
- [Pattern/approach 1] from [source]
- [Pattern/approach 2] from [source]
- [Best practice 1]
- [Common pitfall to avoid]

Incorporating into context design...
```

3. **Integrate findings:**
```markdown
Based on research, I recommend:

**Addition 1:** [Specific pattern/technique]
- Source: [URL]
- Rationale: [Why it fits your use case]

**Addition 2:** [Another recommendation]
- Source: [URL]
- Rationale: [Why it's valuable]

Apply these recommendations? [Y/N]
```

---

### Phase 8: Generation & Export

Generate the complete **Context Engineering Package**.

**Package Contents:**

```markdown
## Context Engineering Package: [System Name]

### 1. System Prompt
[Complete, production-ready system prompt composed from modules]

### 2. Tool Specifications
[Complete tool definitions with parameters, descriptions, errors]

### 3. Example Set
[Few-shot examples with placement instructions]

### 4. Context Management Plan
[Retrieval strategy, compaction policy, note-taking schema, sub-agent constraints]

---

**Package Statistics:**
- System prompt: ~[N] tokens
- Tool definitions: ~[N] tokens
- Examples: ~[N] tokens
- Total static context: ~[N] tokens ([X]% of [Window Size] budget)
- Context management: [Strategy summary]

**Modules used:**
- [Module 1]
- [Module 2]
- [etc.]
```

**Export Formats:**

```markdown
## Export Formats

Select export format(s):

1. **Markdown (.md)** - Human-readable, platform-agnostic
   - Best for: Documentation, version control
   - File: `{system-name}-context-package.md`

2. **JSON (.json)** - Structured data, API-ready
   - Best for: Programmatic integration, LangChain, AutoGen
   - Schema: Includes metadata, all package components
   - File: `{system-name}-context-package.json`

3. **YAML (.yaml)** - Configuration-friendly
   - Best for: Config files, CI/CD pipelines
   - File: `{system-name}-context-package.yaml`

4. **Plain Text (.txt)** - Raw prompt only
   - Best for: Direct API consumption, Claude/OpenAI playground
   - File: `{system-name}-prompt.txt`

5. **XML (.xml)** - Structured with tags
   - Best for: Systems requiring XML, custom parsers
   - File: `{system-name}-context-package.xml`

6. **All formats** - Complete package
   - Creates: `{system-name}/` directory with all formats

Select: [1-6 or comma-separated]
```

**Export Implementation:**

```python
# Use Write tool to create each selected format
# Or use scripts/export_prompt.py for batch export

# JSON export structure (expanded for Context Engineering Package)
context_package = {
    "metadata": {
        "name": system_name,
        "type": system_type,
        "domain": domain,
        "version": "1.0",
        "created": timestamp,
        "context_window": target_window,
        "token_budget": budget_allocation
    },
    "system_prompt": {
        "role_definition": role_content,
        "workflow": workflow_content,
        "delegation": delegation_content,
        "communication": communication_content,
        "quality": quality_content,
        "error_handling": error_content
    },
    "tools": [tool_definitions],
    "examples": [example_set],
    "context_management": {
        "retrieval_strategy": strategy,
        "compaction_policy": policy,
        "note_taking_schema": schema,
        "sub_agent_constraints": constraints
    }
}
```

**Confirm export:**
```markdown
Exported Context Engineering Package:

[List of created files with paths]

**Next steps:**
1. Review the generated package
2. Test with your agent framework
3. Iterate if needed (use Phase 9)
4. Deploy to production

Would you like to:
A. Iterate/refine this package
B. Create another agent for this system
C. Generate integration examples
D. Done
```

---

### Phase 9: Iteration (Optional)

Support refinement based on testing or new requirements.

**Iteration Triggers:**

```markdown
What would you like to refine?

A. Adjust system prompt section
   - Which section? [Role/Workflow/Delegation/etc.]
   - What changes? [User describes]

B. Modify tool set
   - Add/remove/modify tools
   - [Return to Phase 4]

C. Update examples
   - Add/change/remove examples
   - [Return to Phase 5]

D. Adjust context management
   - Change retrieval/compaction/note-taking strategy
   - [Return to Phase 6]

E. Change architecture
   - What architectural change? [User describes]
   - [May require returning to Phase 2]

F. Optimize for specific framework
   - Which framework? [LangChain/AutoGen/CrewAI/Claude Code/Custom]
   - [Add framework-specific adaptations]

G. Research alternative approaches
   - What aspect to research? [User specifies]
   - [Trigger Phase 7 dynamic research]
```

**Iteration process:**
1. Identify what to change
2. Load relevant modules or research
3. Update affected sections
4. Preview changes (diff format)
5. Regenerate and re-export

---

## Advanced Features

### Security Analysis (Optional)

When system design includes sensitive operations:

```markdown
## Security Analysis

Based on your agent's capabilities, I've identified potential risks:

**Risk 1: [Type]**
- Scenario: [How it could happen]
- Impact: [Consequences]
- Mitigation: [Suggested safeguard]
- Implementation: [Where to add in prompt]

Add recommended security measures to prompt? [Y/N]
```

Common risks to check:
- File system access → Path validation
- Web scraping → Rate limiting, robots.txt
- Code execution → Sandboxing, input sanitization
- API calls → Authentication, quota management
- Data processing → PII detection, data retention

### Framework-Specific Adaptation

Provide integration guidance for popular frameworks:

```markdown
## Framework Integration

You selected: [Framework name]

**Integration notes for [Framework]:**
[Framework-specific code examples or configuration]
```

### Pattern Library Reference

```markdown
## Available Patterns

For reference, this skill includes these proven patterns in `references/modules/patterns/`:

- `multi-agent-research-system.md` - Complete research team example
- [Additional patterns as they're added]

Want to see a complete example of a similar system? [Y/N]
```

---

## Skill Resources

### Module Library Structure

```
references/modules/
├── roles/              # Agent role definitions
│   ├── orchestrator.md
│   ├── researcher.md
│   └── evaluator.md
├── workflows/          # Process patterns
│   └── research-workflow.md
├── delegation/         # Multi-agent coordination
│   └── orchestrator-workers.md
├── communication/      # Data exchange protocols
│   └── structured-io.md
├── quality/            # Quality control
│   └── evaluation-criteria.md
├── tools/              # Tool design principles
│   └── tool-design.md
├── examples/           # Few-shot example strategy
│   └── few-shot-strategy.md
├── context/            # Context management
│   └── context-management.md
└── patterns/           # Complete system examples
    └── multi-agent-research-system.md
```

### Using Module Files

**When to read modules:**
- Phase 3: Load role/workflow/delegation modules for composition
- Phase 4: Load tool design guidelines
- Phase 5: Load example strategy guidelines
- Phase 6: Load context management patterns
- Iteration: Load additional modules for enhancements

**How to use:**
```markdown
# Read specific module
Read references/modules/[category]/[module-name].md

# Extract relevant sections
[Parse module content]

# Customize for user's domain
[Replace placeholders with user specifics]

# Integrate into context package
[Compose with other modules]
```

### Dynamic Research Guidelines

**When to trigger WebSearch:**
- User domain is novel/specialized
- User asks "What's the best way to..." or "Current best practices for..."
- Built-in modules don't cover the specific pattern needed
- User explicitly requests research

**Search strategy:**
```markdown
# Research query patterns
- "[domain] agent system architecture"
- "[domain] context engineering patterns"
- "[pattern] multi-agent coordination"
- "[framework] system prompt examples"
- "best practices [specific capability] agents"

# Prioritize recent content (last 24 months)
# Favor: Official docs > GitHub repos > Technical blogs > Forums
```

**Integration of findings:**
- Extract concrete patterns/techniques
- Cite sources
- Explain rationale for recommendations
- Offer as options, not mandates

---

## Constraints & Limitations

**Must:**
- Always design context architecture (Phase 2) before writing prompts
- Use built-in modules as foundation (token efficient)
- Present token budget analysis for every design
- Cite sources when incorporating research findings
- Generate platform-agnostic designs by default
- Include context management strategy for sessions > 20 turns

**Must Not:**
- Generate prompts without understanding requirements
- Skip context architecture phase
- Ignore token budget constraints
- Make security claims without qualification
- Assume specific LLM provider capabilities

**Should:**
- Ask clarifying questions when requirements ambiguous
- Suggest iterative refinement for complex systems
- Provide rationale for architectural recommendations
- Offer multiple export formats
- Recommend hybrid retrieval as default strategy

---

## Tips for Effectiveness

1. **Context First, Prompt Second:** Design the information architecture before writing a single line of prompt
2. **Token Budget is Real:** Every token competes for attention — budget accordingly
3. **Start Simple:** Even complex systems benefit from single-agent prototyping first
4. **Test Early:** Generate minimal viable context package, test, then enhance
5. **Modular Growth:** Add agents and tools incrementally
6. **Compact Aggressively:** For long sessions, remove anything that isn't earning its tokens
7. **Isolate Sub-Agents:** Give each agent only the context it needs, nothing more

---

## Invocation Examples

**User:** "Help me design an agent system for competitive analysis"
**Skill:** [Start Phase 1, ask system type question]

**User:** "Create a multi-agent research team"
**Skill:** [Start Phase 1, already know it's multi-agent, ask about domain and capabilities]

**User:** "I need a system prompt for a code reviewer"
**Skill:** [Start Phase 1, likely single-agent, ask about scope and workflow]

**User:** "Design the context strategy for a long-running coding agent"
**Skill:** [Start Phase 1, focus on session length and context management needs]

**User:** "What's the best pattern for orchestrating 5 specialized agents?"
**Skill:** [Jump to Phase 3 Question 6, present collaboration patterns with context isolation focus]
