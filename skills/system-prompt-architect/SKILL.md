---
name: system-prompt-architect
description: System prompt engineering tool for building single and multi-agent systems. Use when developers need to design agent system prompts, especially for complex multi-agent orchestration. Guides through modular prompt construction with built-in patterns and dynamic research.
---

# Prompt Architect

## Overview

A comprehensive system prompt engineering tool designed for professional agent system developers. This skill transforms high-level requirements into production-ready system prompts through guided workflows, modular templates, and intelligent research capabilities.

**Primary Focus:** Multi-agent collaboration systems (orchestrator-workers, evaluator-optimizer, hierarchical coordination)

**Also Supports:** Single-agent systems with structured workflows

## When to Use This Skill

Use this skill when:
- Designing new agent systems from scratch
- Architecting multi-agent orchestration patterns
- Optimizing existing agent system prompts
- Converting business requirements to agent specifications
- Need platform-agnostic system prompt designs

**User Signals:**
- "Help me design an agent system for..."
- "Create a multi-agent system that..."
- "Write a system prompt for..."
- "How should I architect agents to..."

## Core Workflow

The skill uses a wizard-style interview process with flexible iteration:

```
[Requirements Gathering]
         ↓
[Architecture Design]
         ↓
[Module Selection & Composition]
         ↓
[Dynamic Research] (if needed)
         ↓
[Prompt Generation]
         ↓
[Multi-Format Export]
         ↓
[Iteration] (optional)
```

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

**Question 4: Complexity Assessment**
```markdown
Rate the complexity of tasks this system will handle:

A. Simple (well-defined, single-step tasks)
B. Moderate (multi-step workflows, some ambiguity)
C. Complex (open-ended problems, requires planning and iteration)

[Determines workflow sophistication needed]
```

### Phase 2: Architecture Design

Based on Phase 1 answers, design the system architecture.

#### For Single-Agent Systems

Present architecture summary:
```markdown
## Proposed Single-Agent Architecture

**Agent Role:** [Role based on domain]
**Core Workflow:** [Sequential/Iterative/Decision-tree]
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

[Note: Max 20 agents total per Anthropic research]
```

**Question 6: Collaboration Pattern**
```markdown
What collaboration pattern fits best?

A. Orchestrator-Workers (Recommended)
   - Lead agent decomposes tasks, assigns to specialized workers
   - Workers execute independently, return results
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

**Architecture:**
```
[ASCII diagram of agent relationships]
```

**Agent Roles:**
1. [Orchestrator]: [Responsibilities]
2. [Worker Type 1]: [Specialization]
3. [Worker Type 2]: [Specialization]
...

**Communication Flow:**
[Description of how agents interact]

Ready to proceed with detailed design?
```

### Phase 3: Module Selection & Composition

Based on architecture, select modules from the knowledge base.

**Module Selection Process:**

1. **Identify required modules** from `references/modules/`:
   - `roles/`: Match agent types to role templates
   - `workflows/`: Select appropriate process patterns
   - `delegation/`: For multi-agent, select coordination strategy
   - `communication/`: Define data exchange format
   - `quality/`: Add quality control mechanisms

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

**Communication:**
- Protocol: `communication/structured-io.md`

**Quality Control:**
- Pattern: `quality/evaluation-criteria.md`

Customize any modules? [Y/N]
```

3. **Load selected modules** using Read tool:
```bash
# Read relevant module files
Read references/modules/roles/orchestrator.md
Read references/modules/delegation/orchestrator-workers.md
[etc.]
```

4. **Compose base structure:**
```markdown
Combining modules to create draft system prompt...

[Show hierarchical structure preview]

## [Agent Name] System Prompt

### Role Definition
[From selected role module, customized with domain specifics]

### Core Workflow
[From selected workflow module]

### [Multi-agent only] Delegation Protocol
[From selected delegation module]

### Communication Protocol
[From communication module]

### Quality Standards
[From quality module]

Proceed with this structure? [Y/N]
```

### Phase 4: Dynamic Research (Conditional)

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

Incorporating into system prompt design...
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

### Phase 5: Prompt Generation

Generate complete, production-ready system prompts.

**Generation Process:**

1. **Compose hierarchical structure:**
```markdown
## [Agent Name] System Prompt

<!-- Metadata -->
Agent Type: [Orchestrator/Worker/Evaluator/etc.]
Domain: [Domain]
Version: 1.0
Last Updated: [Date]

---

### Role Definition

[Composed from role module + domain customization]

You are a [Role] specialized in [Domain] responsible for [Core Objective].

#### Core Responsibilities
- [Responsibility 1]
- [Responsibility 2]
- [Responsibility 3]

#### Authority Scope
**Can:**
- [Permitted action 1]
- [Permitted action 2]

**Cannot:**
- [Prohibited action 1]
- [Prohibited action 2]

---

### Workflow

[Composed from workflow module, with domain-specific steps]

#### Stage 1: [Name]
[Step-by-step process]

#### Stage 2: [Name]
[Step-by-step process]

[Continue for all stages...]

---

### [Multi-agent only] Delegation Protocol

[Composed from delegation module]

#### Task Decomposition
[How to break down tasks]

#### Worker Selection
[How to assign tasks]

#### Instruction Format
[Template for delegating to workers]

---

### Communication Protocol

[Composed from communication module]

#### Input Format
[Expected message structure]

#### Output Format
[Required response structure with schema]

---

### Quality Control

[Composed from quality module]

#### Success Criteria
- [Criterion 1]
- [Criterion 2]

#### Validation Checks
- [ ] [Check 1]
- [ ] [Check 2]

---

### Error Handling

[Standard patterns + domain-specific errors]

#### Common Issues
**Issue:** [Error scenario]
**Response:** [How to handle]

---

### [Optional] Security Considerations

[If architecture analysis identified risks]

#### Data Handling
- [Privacy consideration]
- [Access control]

#### Input Validation
- [What to check]
- [How to sanitize]
```

2. **Present complete prompt:**
```markdown
## Generated System Prompt

[Display full prompt]

---

**Statistics:**
- Total sections: [N]
- Word count: ~[N]
- Estimated tokens: ~[N]

**Modules used:**
- [Module 1]
- [Module 2]
- [etc.]

Ready to export? [Y/N]
```

### Phase 6: Multi-Format Export

Export the system prompt in multiple formats.

**Export Options:**

```markdown
## Export Formats

Select export format(s):

1. **Markdown (.md)** - Human-readable, platform-agnostic
   - Best for: Documentation, version control
   - File: `{agent-name}-prompt.md`

2. **JSON (.json)** - Structured data, API-ready
   - Best for: Programmatic integration, LangChain, AutoGen
   - Schema: Includes metadata, sections as objects
   - File: `{agent-name}-prompt.json`

3. **YAML (.yaml)** - Configuration-friendly
   - Best for: Config files, CI/CD pipelines
   - File: `{agent-name}-prompt.yaml`

4. **Plain Text (.txt)** - Raw prompt only
   - Best for: Direct API consumption, Claude/OpenAI playground
   - File: `{agent-name}-prompt.txt`

5. **XML (.xml)** - Structured with tags
   - Best for: Systems requiring XML, custom parsers
   - File: `{agent-name}-prompt.xml`

6. **All formats** - Complete package
   - Creates: `{agent-name}-prompts/` directory with all formats

Select: [1-6 or comma-separated]
```

**Export Implementation:**

```python
# Use Write tool to create each selected format

# Example: Markdown export (default)
Write(
    file_path="{agent-name}-prompt.md",
    content=formatted_prompt_markdown
)

# Example: JSON export
import json
prompt_json = {
    "metadata": {
        "name": agent_name,
        "type": agent_type,
        "domain": domain,
        "version": "1.0",
        "created": timestamp
    },
    "sections": {
        "role_definition": role_content,
        "workflow": workflow_content,
        "delegation": delegation_content,
        "communication": communication_content,
        "quality": quality_content,
        "error_handling": error_content
    }
}
Write(
    file_path="{agent-name}-prompt.json",
    content=json.dumps(prompt_json, indent=2)
)

# Similar for YAML, XML, TXT formats
```

**Confirm export:**
```markdown
✅ Exported system prompt(s):

[List of created files with paths]

**Next steps:**
1. Review the generated prompt(s)
2. Test with your agent framework
3. Iterate if needed (use Phase 7)
4. Deploy to production

Would you like to:
A. Iterate/refine this prompt
B. Create another agent for this system
C. Generate integration examples
D. Done
```

### Phase 7: Iteration (Optional)

Support refinement based on testing or new requirements.

**Iteration Triggers:**

```markdown
What would you like to refine?

A. Adjust specific section
   - Which section? [Role/Workflow/Delegation/etc.]
   - What changes? [User describes]

B. Add new capability
   - What capability? [User describes]
   - [Return to Phase 3 to select additional modules]

C. Change architecture
   - What architectural change? [User describes]
   - [May require returning to Phase 2]

D. Optimize for specific framework
   - Which framework? [LangChain/AutoGen/CrewAI/Custom]
   - [Add framework-specific adaptations]

E. Research alternative approaches
   - What aspect to research? [User specifies]
   - [Trigger Phase 4 dynamic research]
```

**Iteration process:**
1. Identify what to change
2. Load relevant modules or research
3. Update affected sections
4. Preview changes (diff format)
5. Regenerate and re-export

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

**Risk 2: [Type]**
[Same structure...]

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

**LangChain example:**
```python
from langchain.agents import Agent
from langchain.prompts import PromptTemplate

system_prompt = open('{agent-name}-prompt.txt').read()

agent = Agent(
    system_message=system_prompt,
    tools=[...],
    llm=llm
)
```

**AutoGen example:**
```python
from autogen import AssistantAgent

agent = AssistantAgent(
    name="{agent-name}",
    system_message=open('{agent-name}-prompt.txt').read(),
    llm_config={"model": "gpt-4"}
)
```

[Similar for other frameworks]
```

### Pattern Library Reference

```markdown
## Available Patterns

For reference, this skill includes these proven patterns in `references/modules/patterns/`:

- `multi-agent-research-system.md` - Complete research team example
- [Additional patterns as they're added]

Want to see a complete example of a similar system? [Y/N]
```

## Skill Resources

### Module Library Structure

```
references/modules/
├── roles/              # Agent role definitions
│   ├── orchestrator.md
│   ├── researcher.md
│   ├── evaluator.md
│   ├── executor.md
│   └── specialist.md
├── workflows/          # Process patterns
│   ├── sequential-pipeline.md
│   ├── iterative-refinement.md
│   ├── research-workflow.md
│   ├── decision-tree.md
│   └── parallel-execution.md
├── delegation/         # Multi-agent coordination
│   ├── orchestrator-workers.md
│   ├── hierarchical.md
│   └── peer-to-peer.md
├── communication/      # Data exchange protocols
│   ├── structured-io.md
│   ├── message-formats.md
│   └── context-management.md
├── quality/            # Quality control
│   ├── evaluation-criteria.md
│   ├── validation-patterns.md
│   └── error-recovery.md
└── patterns/           # Complete system examples
    └── multi-agent-research-system.md
```

### Using Module Files

**When to read modules:**
- Phase 3: Load selected modules for composition
- Iteration: Load additional modules for enhancements
- User asks: "What does the orchestrator pattern look like?"

**How to use:**
```markdown
# Read specific module
Read references/modules/[category]/[module-name].md

# Extract relevant sections
[Parse module content]

# Customize for user's domain
[Replace placeholders with user specifics]

# Integrate into system prompt
[Compose with other modules]
```

### Dynamic Research Guidelines

**When to trigger WebSearch:**
- User domain is novel/specialized (e.g., "bioinformatics pipeline")
- User asks "What's the best way to..." or "Current best practices for..."
- Built-in modules don't cover the specific pattern needed
- User explicitly requests research

**Search strategy:**
```markdown
# Research query patterns
- "[domain] agent system architecture"
- "[pattern] multi-agent coordination"
- "[framework] system prompt examples"
- "best practices [specific capability] agents"
- "site:github.com [topic] agent implementation"

# Prioritize recent content (last 24 months)
# Favor: Official docs > GitHub repos > Technical blogs > Forums
```

**Integration of findings:**
- Extract concrete patterns/techniques
- Cite sources
- Explain rationale for recommendations
- Offer as options, not mandates

## Output Examples

### Example 1: Single Research Agent

**Input:**
- System type: Single-agent
- Domain: Web research
- Capabilities: Search, extract, summarize
- Complexity: Moderate

**Output:**
```markdown
## Research Agent System Prompt

You are a Research Agent specialized in web-based information gathering and synthesis.

### Core Responsibilities
- Execute web searches for specific questions
- Extract relevant information from sources
- Synthesize findings into structured reports
- Cite all claims with sources

### Workflow

#### Stage 1: Query Analysis
[Understand research request, identify key questions]

#### Stage 2: Search Strategy
[Formulate search queries, prioritize sources]

#### Stage 3: Information Gathering
[Execute searches, fetch content, extract facts]

#### Stage 4: Synthesis
[Combine findings, resolve contradictions, create report]

### Output Format
{
  "query": "...",
  "findings": [...],
  "summary": "...",
  "sources": [...]
}

[Additional sections...]
```

### Example 2: Multi-Agent Development Team

**Input:**
- System type: Multi-agent
- Domain: Software development
- Pattern: Orchestrator-Workers + Evaluator
- Agents: 1 lead + 3 workers (implementation, testing, documentation) + 1 reviewer
- Complexity: Complex

**Output:**
```markdown
## Development Lead Agent
[Orchestrator prompt with task decomposition, delegation protocol]

## Implementation Worker Agent
[Code generation specialist prompt]

## Testing Worker Agent
[Test writing specialist prompt]

## Documentation Worker Agent
[Documentation specialist prompt]

## Code Reviewer Agent
[Evaluator prompt with quality criteria]

[Each with full role, workflow, communication protocol, etc.]
```

## Constraints & Limitations

**Must:**
- Always present architecture for user approval before generation
- Use built-in modules as foundation (token efficient)
- Cite sources when incorporating research findings
- Generate platform-agnostic prompts by default

**Must Not:**
- Generate prompts without understanding requirements
- Skip architecture design phase
- Make security claims without qualification
- Assume specific LLM provider capabilities

**Should:**
- Ask clarifying questions when requirements ambiguous
- Suggest iterative refinement for complex systems
- Provide rationale for architectural recommendations
- Offer multiple export formats

## Tips for Effectiveness

1. **Start Simple:** Even complex systems benefit from single-agent prototyping first
2. **Test Early:** Generate minimal viable prompt, test, then enhance
3. **Modular Growth:** Add agents incrementally rather than designing entire system upfront
4. **Document Decisions:** Keep notes on why certain modules/patterns were chosen
5. **Iterate Based on Testing:** Real-world testing reveals issues better than speculation

## Invocation Examples

**User:** "Help me design an agent system for competitive analysis"
**Skill:** [Start Phase 1, ask system type question]

**User:** "Create a multi-agent research team"
**Skill:** [Start Phase 1, already know it's multi-agent, ask about domain and capabilities]

**User:** "I need a system prompt for a code reviewer"
**Skill:** [Start Phase 1, likely single-agent, ask about scope and workflow]

**User:** "What's the best pattern for orchestrating 5 specialized agents?"
**Skill:** [Jump to Phase 2 Question 6, present collaboration patterns with focus on orchestrator-workers]
