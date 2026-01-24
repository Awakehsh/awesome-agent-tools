# Prompt Architect

A comprehensive system prompt engineering tool for building professional single and multi-agent systems.

## Overview

Prompt Architect helps agent system developers transform high-level requirements into production-ready system prompts through:
- **Guided wizard workflow** - Interactive questions to understand needs
- **Modular knowledge base** - Reusable templates for roles, workflows, delegation, communication
- **Dynamic research** - Real-time industry best practices when needed
- **Multi-format export** - Markdown, JSON, YAML, XML, Plain Text

**Primary Focus:** Multi-agent collaboration systems (orchestrator-workers, evaluator-optimizer, hierarchical)

**Also Supports:** Single-agent systems with structured workflows

## Quick Start

### Installation

**Claude Code:**
```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/system-prompt-architect
```

**Manual:**
```bash
# Clone or download this directory
cp -r system-prompt-architect ~/.claude/skills/
```

### Basic Usage

```
/system-prompt-architect

# Or simply describe your need:
"Help me design a multi-agent research system"
"Create a system prompt for a code reviewer"
"Design an orchestrator-workers pattern for data analysis"
```

## Features

### 1. Wizard-Style Requirements Gathering

The skill asks focused questions to understand:
- System type (single/multi-agent/hybrid)
- Primary domain and use cases
- Key capabilities needed
- Task complexity level
- Agent roles and collaboration patterns

### 2. Architecture Design

Based on your answers, the skill:
- Recommends appropriate agent architecture
- Visualizes agent relationships
- Explains communication flows
- Presents for your approval before proceeding

### 3. Modular Composition

Select from proven templates:

**Role Definitions:**
- Orchestrator - Coordinates multi-agent systems
- Researcher - Information gathering specialist
- Evaluator - Quality control agent
- Executor - Task execution worker
- Specialist - Domain expert

**Workflows:**
- Research workflow - Structured information gathering
- Sequential pipeline - Linear multi-stage processing
- Iterative refinement - Feedback-driven improvement
- Decision trees - Branching logic
- Parallel execution - Concurrent task processing

**Delegation Patterns:**
- Orchestrator-Workers - Lead coordinates specialists
- Hierarchical - Multi-level coordination
- Peer-to-peer - Collaborative agents

**Communication Protocols:**
- Structured I/O - JSON/YAML schemas
- Message formats - Standardized exchanges
- Context management - Efficient information passing

**Quality Control:**
- Evaluation criteria - Assessment frameworks
- Validation patterns - Output checking
- Error recovery - Failure handling

### 4. Dynamic Research (Optional)

When needed, the skill researches:
- Current best practices for your domain
- Industry-proven patterns
- Framework-specific implementations
- Common pitfalls to avoid

Sources: GitHub repositories, official documentation, technical blogs

### 5. Multi-Format Export

Generate outputs in:
- **Markdown (.md)** - Human-readable, version control friendly
- **JSON (.json)** - Programmatic integration, API-ready
- **YAML (.yaml)** - Configuration files, CI/CD
- **Plain Text (.txt)** - Direct API consumption
- **XML (.xml)** - Structured with tags

### 6. Iterative Refinement

After testing, refine:
- Adjust specific sections
- Add new capabilities
- Change architecture
- Optimize for specific frameworks
- Research alternative approaches

## Use Cases

### Single-Agent Systems

**Code Reviewer**
- Domain: Software development
- Capabilities: Static analysis, best practices checking, feedback generation
- Workflow: Read code → Analyze → Generate feedback
- Complexity: Moderate

**Document Analyzer**
- Domain: Content processing
- Capabilities: Extract information, summarize, categorize
- Workflow: Parse document → Extract entities → Synthesize insights
- Complexity: Moderate

**Research Assistant**
- Domain: Information gathering
- Capabilities: Web search, source validation, synthesis
- Workflow: Query analysis → Search → Extract → Synthesize
- Complexity: Moderate

### Multi-Agent Systems

**Research Team**
- 1 Lead Orchestrator + 3-5 Researcher Workers + 1 Evaluator
- Pattern: Orchestrator-Workers + Evaluation
- Use case: Comprehensive research questions requiring parallel investigation

**Development Pipeline**
- 1 Project Lead + Implementation Worker + Testing Worker + Documentation Worker + Code Reviewer
- Pattern: Orchestrator-Workers + Sequential + Evaluation
- Use case: Feature development with quality gates

**Data Analysis System**
- 1 Analysis Coordinator + Data Collection Worker + Processing Worker + Visualization Worker
- Pattern: Sequential Pipeline
- Use case: End-to-end data analysis workflows

**Quality Assurance Chain**
- 1 QA Lead + Multiple Test Workers + Evaluator + Optimizer
- Pattern: Evaluator-Optimizer + Orchestrator-Workers
- Use case: Iterative quality improvement

## Module Library

The skill includes comprehensive templates organized in `references/modules/`:

```
modules/
├── roles/              # 5 agent role templates
├── workflows/          # 5 workflow patterns
├── delegation/         # 3 coordination strategies
├── communication/      # 3 protocol definitions
├── quality/            # 3 QA frameworks
└── patterns/           # Complete system examples
```

Each module is:
- **Reusable** - Works across domains with customization
- **Well-documented** - Includes rationale and examples
- **Proven** - Based on Anthropic research and industry practices

## Examples

### Example 1: Simple Research Agent

**Input:**
```
System type: Single-agent
Domain: Web research
Capabilities: Search, extract, summarize
Complexity: Moderate
```

**Output:**
Complete system prompt with:
- Role: Research Agent
- Workflow: 4-stage research process
- Output schema: JSON with findings and sources
- Quality checks: Source validation, cross-referencing
- Error handling: No results, contradictions, timeouts

**Export formats:** All 5 formats generated

### Example 2: Multi-Agent Development Team

**Input:**
```
System type: Multi-agent
Domain: Software development
Pattern: Orchestrator-Workers + Evaluator
Agents: 1 lead + 3 workers + 1 reviewer
Complexity: Complex
```

**Output:**
5 complete system prompts:
1. Development Lead (Orchestrator)
2. Implementation Worker
3. Testing Worker
4. Documentation Worker
5. Code Reviewer (Evaluator)

Each with:
- Full role definition
- Detailed workflow
- Delegation protocol (for orchestrator)
- Communication schemas
- Quality standards

## Advanced Features

### Security Analysis

When your agent has sensitive capabilities (file access, API calls, code execution), the skill:
- Identifies potential risks
- Suggests mitigations
- Provides implementation guidance

**Optional** - Not enforced by default

### Framework Integration

Get integration examples for:
- LangChain (Python)
- AutoGen (Microsoft)
- CrewAI
- Custom frameworks

### Pattern Library

Browse complete system examples:
- Multi-agent research system (Anthropic-style)
- [More patterns as added]

## Best Practices

1. **Start Simple** - Prototype with single-agent first, then expand to multi-agent
2. **Test Early** - Generate minimal viable prompt, test, then enhance
3. **Modular Growth** - Add agents incrementally based on testing feedback
4. **Document Decisions** - Keep notes on why certain patterns were chosen
5. **Iterate** - Real-world testing reveals issues better than speculation

## Technical Details

### Requirements

- Claude Code (recommended) or compatible skill platform
- Python 3.8+ (for export scripts, optional)
- PyYAML library (for YAML export, `pip install pyyaml`)

### Skill Structure

```
system-prompt-architect/
├── SKILL.md                    # Main skill definition
├── README.md                   # This file
├── scripts/
│   └── export_prompt.py        # Multi-format exporter
└── references/
    └── modules/                # Template library
        ├── roles/
        ├── workflows/
        ├── delegation/
        ├── communication/
        ├── quality/
        └── patterns/
```

### Token Usage

- Skill frontmatter: ~100 tokens (always loaded)
- SKILL.md body: ~8,000 tokens (when invoked)
- Module files: ~500-2,000 tokens each (loaded as needed)
- Total: Scales based on complexity, typically 10,000-20,000 tokens for multi-agent systems

### Performance

- Simple single-agent: ~2-3 minutes
- Multi-agent system (3-5 agents): ~5-10 minutes
- With dynamic research: +2-5 minutes per research topic

## Platform Compatibility

### Primary Platform: Claude Code

This skill is optimized for Claude Code but generates **platform-agnostic** prompts.

### Other Platforms

**Codex:**
- Copy skill directory to `~/.codex/skills/`
- Invoke with `/system-prompt-architect`

**Cursor:**
- Import via skill marketplace or manual copy
- May need configuration adjustments

**Custom Integrations:**
- Use the skill in any environment supporting Claude
- Generated prompts work with any LLM framework

## Limitations

- Maximum 20 agents per system (per Anthropic research best practices)
- Dynamic research requires web access (WebSearch/WebFetch tools)
- Export scripts require Python 3.8+ and PyYAML
- Does not generate actual agent implementation code (prompts only)

## Contributing

This skill is part of the [Awesome Agent Tools](https://github.com/Awakehsh/awesome-agent-tools) repository.

**Contributions welcome:**
- New role templates
- Additional workflow patterns
- Domain-specific modules
- Complete system examples
- Bug fixes and improvements

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

## License

MIT License - See repository LICENSE file

## Support

- **Issues:** [GitHub Issues](https://github.com/Awakehsh/awesome-agent-tools/issues)
- **Discussions:** [GitHub Discussions](https://github.com/Awakehsh/awesome-agent-tools/discussions)
- **Documentation:** This README and SKILL.md

## Credits

**Developed by:** Awesome Agent Tools Project

**Based on research from:**
- Anthropic's multi-agent patterns (research_lead_agent, orchestrator-workers)
- Claude Cookbooks agent patterns
- Industry best practices from 30,000+ lines of AI tool prompts

**Special thanks:**
- Anthropic for Claude and agent research
- AI coding tools community for pattern sharing
- Contributors to awesome-agent-tools

---

**Ready to build better agent systems?**

```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/system-prompt-architect
```

Then:
```
/system-prompt-architect
```

Let's design your agent system! 🚀
