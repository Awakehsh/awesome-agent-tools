# Agents

This directory contains AI agent configurations and workflows for Claude Code and other platforms.

## What are Agents?

Agents are autonomous AI assistants configured with specific roles, capabilities, and workflows. They can be specialized for different tasks such as:

- **Code Review Agents**: Automated code quality and security analysis
- **Testing Agents**: Test generation and validation
- **Documentation Agents**: Auto-documentation and knowledge management
- **Deployment Agents**: CI/CD automation and deployment workflows
- **Research Agents**: Information gathering and analysis

## Directory Structure

```
agents/
├── README.md           # This file
└── [agent-name]/       # Individual agent directories
    ├── AGENT.md        # Agent configuration and instructions
    ├── README.md       # Agent documentation
    └── config/         # Configuration files (optional)
```

## Adding an Agent

### 1. Create Agent Directory

```bash
mkdir -p agents/my-agent/config
```

### 2. Create AGENT.md

The `AGENT.md` file defines the agent's behavior, capabilities, and workflow:

```markdown
---
name: my-agent
description: Brief description of what this agent does
role: The agent's primary role (e.g., "code-reviewer", "tester")
capabilities:
  - Capability 1
  - Capability 2
triggers:
  - When to invoke this agent
---

# My Agent

## Purpose

[What problem does this agent solve?]

## Workflow

[How does the agent work?]

## Configuration

[Any configuration options]

## Examples

[Usage examples]
```

### 3. Create Documentation

Add a `README.md` with:
- Installation instructions
- Usage examples
- Configuration options
- Best practices

### 4. Test the Agent

Test your agent locally before committing:

```bash
# For Claude Code (primary platform)
cp -r agents/my-agent ~/.claude/agents/
# Restart Claude Code and test

# For Codex (using AGENTS.md format)
# Note: Codex uses project-level AGENTS.md files, not separate agent directories
# You may need to adapt the agent instructions to AGENTS.md format
```

## Available Agents

Currently, this directory is being set up. Agents will be added based on community needs and contributions.

**Coming Soon**:
- Code Review Agent
- Test Generation Agent
- Documentation Agent
- Security Analysis Agent

## Contributing

Have an agent to share? See our [Contributing Guide](../CONTRIBUTING.md) for details on how to add your agent to this collection.

## Platform Compatibility

**Primary Support:**
- ✅ **Claude Code** - Full native support with `~/.claude/agents/` directory and AGENT.md format

**Partial/Alternative Support:**
- ⚠️ **Codex** - Supports AGENTS.md format (`~/.codex/AGENTS.md`) for project-level agent instructions, but not the same pluggable agents system as Claude Code
- ⚠️ **Cursor** - Has built-in agent mode and configuration, but uses its own agent system rather than external agent files
- ❌ **Windsurf / Antigravity** - No native agents directory support currently

**Note:** This agents directory is primarily designed for Claude Code. Other platforms may require adaptation or may use their own agent configuration formats.

## Resources

### Learning Resources
- [Claude Code Agents Documentation](https://code.claude.com/docs/en/agents)
- [Building Effective AI Agents](https://www.anthropic.com/research/building-effective-agents)
- [Agent Design Patterns](https://www.anthropic.com/research/agent-patterns)

### Community
- [Awesome Claude](https://awesomeclaude.ai/) - Comprehensive directory of Claude resources
- [everything-claude-code](https://github.com/affaan-m/everything-claude-code) - Battle-tested agent configurations

## License

All agents in this directory are released under the MIT License unless otherwise specified.
