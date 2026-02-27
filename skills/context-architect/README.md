# Context Architect

A comprehensive context engineering tool for building professional AI agent systems.

## Overview

Context Architect helps agent system developers transform high-level requirements into production-ready **Context Engineering Packages** through:
- **Context-first design** - Design token budget and information architecture before writing prompts
- **Guided wizard workflow** - Interactive questions to understand needs
- **Modular knowledge base** - Reusable templates for roles, workflows, delegation, tools, examples, and context management
- **Dynamic research** - Real-time industry best practices when needed
- **Multi-format export** - Markdown, JSON, YAML, XML, Plain Text

**Core philosophy:** Context engineering manages the **entire information state** during LLM inference — not just system prompts, but tools, examples, retrieval strategies, and runtime context management.

**Primary Focus:** Multi-agent collaboration systems (orchestrator-workers, evaluator-optimizer, hierarchical)

**Also Supports:** Single-agent systems with structured workflows

## Quick Start

### Installation

**Claude Code:**
```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/context-architect
```

**Manual:**
```bash
# Clone or download this directory
cp -r context-architect ~/.claude/skills/
```

### Basic Usage

```
/context-architect

# Or simply describe your need:
"Help me design a multi-agent research system"
"Design the context strategy for a long-running coding agent"
"Create a system prompt for a code reviewer"
```

## What's New: From Prompt Engineering to Context Engineering

Traditional prompt engineering focuses on writing good instructions. Context Architect goes further — it designs the **complete information architecture** for your agent:

| Component | Traditional Approach | Context Architect |
|---|---|---|
| System Prompt | Write instructions | Design with token budget awareness |
| Tools | Add as needed | Design tool set with overlap analysis |
| Examples | Copy-paste a few | Strategic selection for behavioral coverage |
| Message History | Let it grow | Compaction and clearing policies |
| Retrieved Data | Preload everything | Just-in-Time + Hybrid retrieval strategies |
| Long Sessions | Hope for the best | Structured note-taking and sub-agent isolation |

## Features

### 1. Context Architecture Design (Phase 2)

Before writing any prompt, plan how tokens are allocated:
- **Token budget allocation** across components (prompt, tools, examples, history, retrieval)
- **Information source planning** (static vs. tool-mediated vs. just-in-time)
- **Context lifecycle strategy** (compaction, note-taking, sub-agent isolation)

### 2. System Prompt Design (Phase 3)

Guided architecture selection and module composition:
- Single-agent, multi-agent, or hybrid systems
- Orchestrator-Workers, Pipeline, Evaluator-Optimizer, Hierarchical patterns
- Role definitions, workflows, delegation protocols

### 3. Tool Design (Phase 4)

Design your agent's tool set with engineering rigor:
- Tool inventory with token cost analysis
- Overlap detection and resolution
- Self-contained tool definitions with error handling
- Dynamic tool loading for phase-based workflows

### 4. Example Strategy (Phase 5)

Strategic few-shot example selection:
- Behavioral dimension coverage (not redundant variations)
- Canonical examples (common cases, not edge cases)
- Token-efficient design with compression techniques
- Static or dynamic placement strategies

### 5. Context Management Strategy (Phase 6)

For long-running agents, plan how context evolves:
- **Retrieval strategy** — Preloaded, Just-in-Time, or Hybrid
- **Compaction policy** — What to preserve, what to discard, when to trigger
- **Structured note-taking** — Persistent memory across turns and sessions
- **Sub-agent context isolation** — Clean windows with summary constraints

### 6. Multi-Format Export (Phase 8)

Complete Context Engineering Package in multiple formats:
- **Markdown (.md)** — Human-readable, version control friendly
- **JSON (.json)** — Programmatic integration, API-ready
- **YAML (.yaml)** — Configuration files, CI/CD
- **Plain Text (.txt)** — Direct API consumption
- **XML (.xml)** — Structured with tags

## Module Library

The skill includes comprehensive templates organized in `references/modules/`:

```
modules/
├── roles/              # Agent role templates (orchestrator, researcher, evaluator)
├── workflows/          # Process patterns (research, pipeline, iterative)
├── delegation/         # Coordination strategies (orchestrator-workers + context isolation)
├── communication/      # Protocol definitions (structured I/O)
├── quality/            # QA frameworks (evaluation criteria)
├── tools/              # Tool design principles (overlap, granularity, errors)
├── examples/           # Few-shot strategy (diversity, compression, placement)
├── context/            # Context management (budget, retrieval, compaction, notes)
└── patterns/           # Complete system examples
```

Each module is:
- **Reusable** — Works across domains with customization
- **Well-documented** — Includes rationale and examples
- **Proven** — Based on Anthropic research and industry practices

## Use Cases

### Single-Agent Systems

- **Code Reviewer** — Static analysis, best practices, feedback generation
- **Research Assistant** — Web search, source validation, synthesis
- **Document Analyzer** — Information extraction, summarization, categorization

### Multi-Agent Systems

- **Research Team** — 1 Lead + 3-5 Researchers + 1 Evaluator
- **Development Pipeline** — 1 Project Lead + Implementation/Testing/Documentation Workers + Reviewer
- **Data Analysis System** — Coordinator + Collection/Processing/Visualization Workers

### Long-Horizon Agents

- **Coding Assistants** — Multi-session development with persistent memory
- **Research Projects** — Extended investigation with structured note-taking
- **Automation Workflows** — Complex multi-step processes with context management

## Best Practices

1. **Context First, Prompt Second** — Design the information architecture before writing instructions
2. **Token Budget is Real** — Every token competes for attention — budget accordingly
3. **Start Simple** — Prototype with single-agent first, then expand
4. **Test Early** — Generate minimal viable package, test, then enhance
5. **Modular Growth** — Add agents and tools incrementally
6. **Compact Aggressively** — For long sessions, remove anything not earning its tokens
7. **Isolate Sub-Agents** — Give each agent only the context it needs

## Technical Details

### Requirements

- Claude Code (recommended) or compatible skill platform
- Python 3.8+ (for export scripts, optional)
- PyYAML library (for YAML export, `pip install pyyaml`)

### Skill Structure

```
context-architect/
├── SKILL.md                    # Main skill definition (9-phase workflow)
├── README.md                   # This file
├── scripts/
│   └── export_prompt.py        # Multi-format exporter
└── references/
    └── modules/                # Template library
        ├── roles/              # Agent role definitions
        ├── workflows/          # Process patterns
        ├── delegation/         # Multi-agent coordination
        ├── communication/      # Data exchange protocols
        ├── quality/            # Quality control
        ├── tools/              # Tool design principles
        ├── examples/           # Few-shot example strategy
        ├── context/            # Context management
        └── patterns/           # Complete system examples
```

### Platform Compatibility

**Primary Platform:** Claude Code — Optimized for Claude Code but generates **platform-agnostic** outputs.

**Other Platforms:**
- **Codex:** Copy to `~/.codex/skills/`, invoke with `/context-architect`
- **Cursor:** Import via skill marketplace or manual copy
- **Custom:** Generated packages work with any LLM framework

## Limitations

- Maximum 20 agents per system (per Anthropic research best practices)
- Dynamic research requires web access (WebSearch/WebFetch tools)
- Export scripts require Python 3.8+ and PyYAML
- Does not generate actual agent implementation code (context packages only)

## Contributing

This skill is part of the [Awesome Agent Tools](https://github.com/Awakehsh/awesome-agent-tools) repository.

**Contributions welcome:**
- New role templates and workflow patterns
- Tool design best practices
- Context management strategies
- Domain-specific modules
- Complete system examples

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

## Credits

**Based on:**
- [Anthropic: Effective Context Engineering for AI Agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- Anthropic's multi-agent patterns (research_lead_agent, orchestrator-workers)
- Claude Cookbooks agent patterns
- Industry best practices from AI tool development

## License

MIT License - See repository LICENSE file

---

**Ready to build better agent systems?**

```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/context-architect
```

Then:
```
/context-architect
```
