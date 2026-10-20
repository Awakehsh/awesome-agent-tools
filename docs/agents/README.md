# Claude Code Agents

This directory contains custom agent configurations for Claude Code.

## What Are Agents?

**Agents (also called sub-agents)** are specialized mini-agents that the main Claude agent can delegate to for specific tasks. Each agent has:

- **Own system prompt** - Specialized instructions for its role
- **Tool permissions** - Access to specific tools it needs
- **Independent context window** - Separate from the main agent
- **Automatic invocation** - Claude intelligently routes tasks to appropriate agents

Think of agents like specialized team members: a code-reviewer, test-runner, debugger, or documentation-writer. Claude automatically delegates work to them, just like it automatically selects the right tools.

### Built-in Agents

Claude Code includes specialized agents out of the box:
- **Explore** - Fast, read-only agent for searching and analyzing codebases
- **Plan** - Software architect agent for designing implementation plans
- **Bash** - Command execution specialist
- And more...

## Why Use Agents?

### 🎯 Independent Contexts

Each agent operates in its own context window, separate from the delegating agent. This means:
- Larger tasks can be completed without polluting the main agent's context
- Different tasks don't interfere with each other
- Peak performance is maintained across complex workflows
- Only relevant summaries return to the main agent

### ⚡ Parallel Execution

You can run multiple agents **in parallel** to work on different tasks simultaneously:

```bash
# Example: Explore codebase using 4 parallel tasks
"Explore the codebase using 4 tasks in parallel"

# Best when: Tasks are independent and don't need results from each other
```

### 🔄 Scalable Workflows

Agents enable:
- **Reduced context pollution** - Each specialist works in isolation
- **Reliable, repeatable workflows** - Defined roles and permissions
- **Automatic routing** - No need to remember which agent to use
- **Quality preservation** - Each step maintains its own dedicated context

## When to Use Agents

Use custom agents when you have:

1. **Specialized, repeatable tasks** that need specific instructions
   - Code review with particular standards
   - Testing workflows with specific frameworks
   - Documentation generation with certain formats

2. **Complex workflows** that benefit from isolation
   - Multi-step processes where context separation helps
   - Tasks that generate lots of intermediate output
   - Work that needs different tool permissions

3. **Parallel work** where multiple independent tasks can run simultaneously
   - Refactoring multiple modules
   - Running tests across different services
   - Analyzing different parts of a codebase

4. **Long-running tasks** that would pollute the main context
   - Large-scale code migrations
   - Comprehensive security audits
   - Full codebase documentation

## How to Create Agents

### Using the /agents Command (Recommended)

```bash
# In Claude Code CLI
/agents

# Follow the interactive walkthrough to create a new agent
```

### Manual Creation

Agents are defined in Markdown files with YAML frontmatter:

```markdown
---
name: my-agent
description: Brief description of what this agent does
role: The agent's specialized role
tools:
  - Read
  - Grep
  - Bash
---

# Agent Instructions

Your detailed instructions for this agent's behavior...
```

### Agent Storage Locations

```bash
# User-level agents (available in all projects)
~/.claude/agents/my-agent/AGENT.md

# Project-level agents (specific to current project)
.claude/agents/my-agent/AGENT.md
```

## Agent Directory Structure

```
agents/
├── README.md              # This file
└── [agent-name]/          # Individual agent directories
    ├── AGENT.md           # Agent definition with YAML frontmatter
    ├── README.md          # Agent documentation
    ├── scripts/           # Optional helper scripts
    ├── references/        # Optional reference materials
    └── config/            # Optional configuration files
```

## Example Agent Template

```markdown
---
name: code-reviewer
description: Automated code review with security and quality checks
role: code-reviewer
tools:
  - Read
  - Grep
  - Bash
---

# Code Review Agent

## Purpose

This agent performs comprehensive code reviews focusing on:
- Code quality and best practices
- Security vulnerabilities
- Performance issues
- Test coverage

## Workflow

1. Read the changed files
2. Analyze code patterns
3. Check for common issues
4. Generate detailed review report

## Review Criteria

[Your specific review standards...]
```

## Adding Agents to This Repository

### 1. Create Agent Directory

```bash
mkdir -p agents/my-agent/{scripts,references}
```

### 2. Create AGENT.md

Define your agent with proper frontmatter and instructions.

### 3. Create Documentation

Add `README.md` with:
- Installation instructions
- Usage examples
- Configuration options
- Best practices

### 4. Test Locally

```bash
# Copy to user-level agents
cp -r agents/my-agent ~/.claude/agents/

# Restart Claude Code and test
# Claude will automatically invoke your agent when appropriate
```

### 5. Commit and Share

```bash
git add agents/my-agent
git commit -m "feat: Add my-agent for [purpose]"
```

## Available Agents

Currently, this directory is being set up. Agents will be added based on community needs and contributions.

**Coming Soon**:
- Code Review Agent
- Test Generation Agent
- Documentation Agent
- Security Analysis Agent
- Migration Assistant Agent

## Triggering Parallel Agents

Claude Code uses agents conservatively by default. To maximize parallelization, **be explicit in your prompts**:

```bash
# Good: Explicit parallelization
"Refactor these 4 modules in parallel using separate agents"
"Run tests for all services simultaneously"

# Default: Sequential execution
"Refactor these modules"
```

**Best practices for parallel agents**:
- Tasks should be independent
- No shared state between agents
- Results don't depend on each other
- Each task has clear boundaries

## Platform Support

⚠️ **Claude Code Only**: Custom agents are a Claude Code-specific feature. This directory and the agents within are designed exclusively for Claude Code.

Other platforms (Codex, Cursor, Windsurf, etc.) use different agent systems and are not compatible with this agent format.

## Resources

### Official Documentation
- [Create Custom Subagents - Claude Code Docs](https://code.claude.com/docs/en/sub-agents)
- [Building Agents with the Claude Agent SDK](https://www.anthropic.com/engineering/building-agents-with-the-claude-agent-sdk)
- [Agent SDK Overview](https://platform.claude.com/docs/en/agent-sdk/overview)

### Tutorials & Guides (2026)
- [How to Use Claude Code Subagents to Parallelize Development](https://zachwills.net/how-to-use-claude-code-subagents-to-parallelize-development/)
- [Practical Guide to Mastering Claude Code's Main Agent and Sub-agents](https://jewelhuq.medium.com/practical-guide-to-mastering-claude-codes-main-agent-and-sub-agents-fd52952dcf00)
- [How to Use Claude Code Sub-Agents for Parallel Work](https://timdietrich.me/blog/claude-code-parallel-subagents/)
- [A Guide to Claude Code 2.0](https://sankalp.bearblog.dev/my-experience-with-claude-code-20-and-how-to-get-better-at-using-coding-agents/)

### Community Resources
- [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) - 100+ specialized Claude Code subagents
- [wshobson/agents](https://github.com/wshobson/agents) - Intelligent automation and multi-agent orchestration
- [The Ultimate Claude Code Resource List (2026)](https://www.scriptbyai.com/claude-code-resource-list/)

### Advanced Topics
- [Multi-Agent Parallel Coding with Claude Code](https://medium.com/@codecentrevibe/claude-code-multi-agent-parallel-coding-83271c4675fa)
- [How to Run Claude Code in Parallel](https://ona.com/stories/parallelize-claude-code)
- [The Complete Claude Code Guide: Agents, CI/CD & Pro Workflows](https://mrzacsmith.medium.com/the-complete-claude-code-guide-agents-ci-cd-pro-workflows-part-3-a5c26e1d3dc8)

## Contributing

Have an agent to share? See our [Contributing Guide](../CONTRIBUTING.md) for details on how to add your agent to this collection.

## License

All agents in this directory are released under the MIT License unless otherwise specified.
