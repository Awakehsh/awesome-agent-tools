# Awesome Agent Tools 🤖✨

> The hybrid marketplace for AI agent development: original skills, curated tools, and cross-platform support.

**For developers building with AI agents** | Original Skills + Curated Tools | Cross-Platform

**Supports**: [Claude Code](#quick-install) (⭐ Recommended) | [Codex](#platform-support) | [Cursor](#platform-support) | [GitHub Copilot](#platform-support) | [Antigravity](#platform-support) | [Devin Desktop](#platform-support) | [Other Agent Skills clients](https://agentskills.io/clients)

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

[English](./README.md) | [中文](./docs/README_CN.md)

---

## Why This Collection?

Unlike other lists, we offer:

- **🔀 Hybrid Marketplace**: Original skills we built + carefully curated third-party tools
- **👨‍💻 For Developers**: Built by developers, for developers building with AI agents
- **🌐 Cross-Platform**: Skills use the open [Agent Skills](https://agentskills.io) format, so they work in Claude Code, Codex, Cursor, GitHub Copilot, Antigravity, and other compatible agents
- **⚡ Multi-Type**: Skills + MCP Servers + Agents + Plugins (not just one category)
- **✨ Quality-First**: Every tool is vetted and tested, not a link dump
- **🎯 Agent Development**: Special focus on agent workflows, parallel execution, and automation

---

## ✨ Features

- 🎯 **Curated Collection** - Only high-quality, well-tested tools and skills
- 🔧 **Cross-Platform** - Skills work in any Agent Skills-compatible agent: Claude Code, Codex, Cursor, GitHub Copilot, Antigravity, and more
- 📦 **Easy Installation** - Simple one-command setup for most tools
- 🌍 **Community-Driven** - Open source and welcoming contributions
- 🚀 **MCP-Powered** - Leverages the Model Context Protocol standard
- 📚 **Well-Documented** - Clear instructions and examples for everything

---

## Quick Install

### Claude Code (⭐ Recommended)

Install everything (skills, the tech-scout agent, and the handoff command) as one plugin:

```bash
# In a Claude Code session
/plugin marketplace add Awakehsh/awesome-agent-tools
/plugin install awesome-agent-tools@awesome-agent-tools

# Or from your shell
claude plugin marketplace add Awakehsh/awesome-agent-tools
claude plugin install awesome-agent-tools@awesome-agent-tools
```

Plugin components are namespaced, for example `/awesome-agent-tools:codex-cli` and `/awesome-agent-tools:handoff`.

### Any Agent Skills-Compatible Agent

Install a single skill with the [skills CLI](https://github.com/vercel-labs/skills):

```bash
npx skills add Awakehsh/awesome-agent-tools --skill learn
# --list shows available skills, -g installs for your user, -a picks the agent (e.g. -a codex)
```

### Manual Copy

```bash
git clone https://github.com/Awakehsh/awesome-agent-tools
mkdir -p ~/.claude/skills ~/.agents/skills
cp -R awesome-agent-tools/skills/learn ~/.claude/skills/   # Claude Code
cp -R awesome-agent-tools/skills/learn ~/.agents/skills/   # Codex
```

In Codex you can also run `$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn` inside a session (not your shell).

Skill folders for other agents: [Platform Support](#platform-support). **Detailed setup**: [Cross-Platform Guide](./docs/CROSS_PLATFORM.md)

---

## 🤖 Agent Development Highlights

Special features for building AI agent systems:

| Feature | Description | Platform |
|---------|-------------|----------|
| **Custom Sub-Agents** | Independent contexts for specialized tasks ([guide](./docs/agents/README.md)) | Claude Code |
| **Parallel Execution** | Run multiple agents simultaneously ([examples](./docs/agents/README.md#triggering-parallel-agents)) | Claude Code |
| **Agent Skills** | Reusable skill bundles for agents | Any [Agent Skills](https://agentskills.io)-compatible agent |
| **MCP Integration** | Connect agents to external tools & data sources | All platforms |
| **Workflow Automation** | Slash commands, hooks, and agent orchestration | Claude Code |

**New to agents?** Check out our [Agent Development Guide](./docs/agents/README.md) for workflows, patterns, and best practices.

---

## 📦 What's Included

### 🎯 Editor's Picks (Quick Wins)

Start here if you're new - these tools deliver immediate value:

| Tool | Type | What It Does | Platform |
|------|------|--------------|----------|
| **[ralph-loop](https://github.com/anthropics/claude-plugins-official)** | Official Plugin | Overnight automated development with iterative loops | Claude Code |
| **[learn](./skills/learn)** | Original Skill | Auto-capture insights to project memory (CLAUDE.md, AGENTS.md) | All |
| **[context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)** | Community Tool | Advanced context engineering, 8-21% quality improvement | All |
| **[codex-cli](./skills/codex-cli)** | Original Skill | Call OpenAI Codex from Claude Code for plan review | Claude Code |
| **[awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers)** | Curated List | Widely used community collection of MCP servers | All |
| **[superpowers](https://github.com/obra/superpowers)** | Skill Framework | Complete AI agent development workflow (TDD, code review, debugging) | Claude Code, Codex, Cursor, and more |
| **[ECC](https://github.com/affaan-m/ECC)** (formerly everything-claude-code) | Config Collection | Battle-tested agents, skills, hooks, and rules from a hackathon winner | Claude Code, Codex, and more |

---

### 🛠️ Original Tools

Open-source contributions from this repository:

#### Skills (3)

##### context-architect

**Context engineering tool for building AI agent systems — design system prompts, tool sets, examples, and runtime context management.**

- **Purpose**: Transform requirements into production-ready Context Engineering Packages through guided workflows
- **Philosophy**: Context-first design — manage the entire information state (prompts, tools, examples, retrieval, compaction), not just instructions
- **Use Cases**:
  - Design multi-agent orchestration systems with context isolation and sub-agent summary constraints
  - Plan token budgets, tool sets, and few-shot examples with engineering rigor
  - Manage long-horizon agent sessions with compaction, note-taking, and Just-in-Time retrieval strategies
- **Key Benefit**: Goes beyond prompt engineering to full context engineering — based on [Anthropic's context engineering research](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- **Install**: `npx skills add Awakehsh/awesome-agent-tools --skill context-architect` (or the [Claude Code plugin](#quick-install))

[Learn more →](./skills/context-architect/README.md)

##### codex-cli

**Call OpenAI Codex CLI from Claude Code for plan review and code analysis.**

- **Use Cases**: Plan review, code analysis, technical discussions, multi-round iteration
- **Install**: `npx skills add Awakehsh/awesome-agent-tools --skill codex-cli` (or the [Claude Code plugin](#quick-install))

[Learn more →](./skills/codex-cli/README.md)

##### learn

**Universal learning system that extracts insights from conversations and updates project memory files.**

- **Use Cases**: Capture learnings, auto-route to docs (CLAUDE.md, AGENTS.md), cross-platform sync
- **Install**: `npx skills add Awakehsh/awesome-agent-tools --skill learn` (or the [Claude Code plugin](#quick-install))

[Learn more →](./skills/learn/README.md)

#### Slash Commands (1)

##### handoff

**Generate a structured handoff for the next coding agent (Codex / Claude / Cursor) picking up your task.**

- **Use Cases**: Cross-agent work transfer, mid-task pause/resume, switching tools mid-feature
- **Output**: 8-section paste-ready brief — goal, state, decisions, failed approaches, evidence, open questions, next steps, relevant files
- **Install**: Included in the [Claude Code plugin](#quick-install) as `/awesome-agent-tools:handoff`, or `mkdir -p ~/.claude/commands && cp commands/handoff.md ~/.claude/commands/`

[Learn more →](./docs/commands/handoff.md)

#### Agents (1)

##### tech-scout

**Technical research specialist. Searches industry solutions, design patterns, and bug fixes from GitHub and web sources.**

- **Purpose**: Parallel research during development workflows
- **Philosophy**: Don't waste time reinventing - learn from industry solutions first
- **Use Cases**:
  - Feature planning - Search architecture patterns and design approaches
  - Bug debugging - Find solutions for errors and common problems
  - Technology comparison - Research pros/cons of libraries and frameworks
- **Key Benefit**: Runs independently without blocking main workflow, returns structured reports with comparisons and sources
- **Install**: Included in the [Claude Code plugin](#quick-install), or `mkdir -p ~/.claude/agents && cp agents/tech-scout.md ~/.claude/agents/`

[Learn more →](./docs/agents/tech-scout.md) | [All Agents Documentation →](./docs/agents/README.md)

#### MCP Servers (Coming Soon)
- Custom integrations
- Specialized tooling
- Watch this space!

---

### 🌟 Curated Recommendations

Carefully vetted third-party tools organized by category:

**See the full curated list**: **[AWESOME.md](./AWESOME.md)**

Categories:
- 🎯 **Skills** - Official Anthropic skills, collections, and installers
- 🧩 **Plugins & Marketplaces** - Claude Code marketplaces and notable plugins
- 🔧 **MCP Servers** - Reference, open-source, and hosted servers
- 🧰 **Agent Runtimes, Security, and Evaluation** - Orchestrators, memory, scanners, and benchmarks
- 🛠️ **Developer Resources** - SDKs, frameworks, and community directories

---

### 📚 Guides & Documentation

- [Agent Development Guide](./docs/agents/README.md) - Workflows, parallel execution, best practices
- [Cross-Platform Setup](./docs/CROSS_PLATFORM.md) - Skill folders and install steps for each platform
- [Build Your First Skill](./docs/tutorials/first-skill.md) - Step-by-step `SKILL.md` tutorial
- [Create an MCP Server](./docs/tutorials/mcp-server.md) - Checklist for an MCP server that works across clients
- [Contributing Guide](./CONTRIBUTING.md) - How to add your tools, inclusion criteria, and repository standards

---

## Use Cases

| Category | Examples |
|----------|----------|
| **Development** | Code generation, refactoring, testing, debugging |
| **Content** | Documentation, translation, technical writing |
| **Research** | Data analysis, summarization, literature review |
| **Automation** | CI/CD, task automation, monitoring |

---

## Platform Support

Skills in this repository follow the open [Agent Skills](https://agentskills.io) standard: a folder with a `SKILL.md` file. These agents read `SKILL.md` natively:

| Platform | Project skills | User skills |
|----------|----------------|-------------|
| Claude Code ⭐ | `.claude/skills/` | `~/.claude/skills/` |
| Codex | `.agents/skills/` | `~/.agents/skills/` |
| Cursor | `.agents/skills/` or `.cursor/skills/` | `~/.agents/skills/` or `~/.cursor/skills/` |
| GitHub Copilot | `.agents/skills/` or `.github/skills/` | `~/.agents/skills/` or `~/.copilot/skills/` |
| Antigravity | `.agents/skills/` | `~/.gemini/config/skills/` (CLI: `~/.gemini/antigravity-cli/skills/`) |
| Devin Desktop (formerly Windsurf) | `.agents/skills/` or `.devin/skills/` | `~/.agents/skills/` or `~/.config/devin/skills/` |

Every agent above except Claude Code reads project skills from `.agents/skills/`. Per-platform details and docs links: [Cross-Platform Guide](./docs/CROSS_PLATFORM.md). More compatible agents: [Agent Skills client showcase](https://agentskills.io/clients).

**Why we recommend Claude Code**: this repository ships a Claude Code plugin, so one install brings the skills, the tech-scout agent, and the handoff command. Other agents use the skills.

---

## Claude Code Tips

Claude Code has powerful built-in features you might not know:

| Feature | Description |
|---------|-------------|
| **`/skills`** | List the skills available in your session and manage their visibility |
| **`/agents`** | Create custom sub-agents with independent contexts ([learn more](./docs/agents/README.md)) |
| **`CLAUDE.md`** | Project memory that prevents repeated mistakes |
| **Slash Commands** | Store workflows in `.claude/commands/` for automation |
| **Parallel Agents** | Run multiple agents simultaneously for independent tasks ([learn more](./docs/agents/README.md#triggering-parallel-agents)) |
| **Plan Mode** | Read-only codebase analysis before making changes |

**Pro tip from Anthropic team**: Add mistakes to CLAUDE.md so Claude learns and doesn't repeat them.

Learn more: [Official Docs](https://code.claude.com/docs/en/skills) | [Creator's Workflow](https://venturebeat.com/technology/the-creator-of-claude-code-just-revealed-his-workflow-and-developers-are)

---

## Codex Tips

Codex skill loading is folder-based. A skill lives at `~/.agents/skills/<skill-name>/SKILL.md` (user) or `.agents/skills/<skill-name>/SKILL.md` (repository).

| Tip | Description |
|-----|-------------|
| **`$skill-installer ...`** | Run this in a Codex session (not your shell) with a skill name or a GitHub URL to a skill folder |
| **Verify install** | Run `/skills` in Codex, or type `$` to mention a skill |
| **Create a new skill** | Make `~/.agents/skills/<skill-name>/SKILL.md` (YAML frontmatter + Markdown) |
| **Reload skills** | Codex detects new and changed skills automatically; restart Codex if one doesn't appear |

---

## Resources

### Official Documentation

- [Claude Code Skills Docs](https://code.claude.com/docs/en/skills)
- [MCP Specification](https://modelcontextprotocol.io/specification)
- [Codex Skills Documentation](https://learn.chatgpt.com/docs/build-skills)
- [Agent Skills Specification](https://agentskills.io/specification)

### Community Resources

- [Awesome MCP Servers](https://github.com/wong2/awesome-mcp-servers) - Curated list of MCP servers
- [Awesome Claude](https://awesomeclaude.ai/) - Comprehensive directory
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers)
- [MCP Registry](https://registry.modelcontextprotocol.io) - Official registry of publicly available MCP servers (preview)

---

## Contributing

We welcome contributions! Here's how you can help:

- **Add Your Own Skill** - Share your custom-built skills
- **Recommend Tools** - Suggest great third-party skills and servers
- **Improve Documentation** - Fix typos, add examples
- **Report Issues** - Found a bug? Let us know!

See [CONTRIBUTING.md](./CONTRIBUTING.md) for detailed guidelines.

---

## License

MIT License. See [LICENSE](./LICENSE) for details.

- **Our Content**: The MIT License covers this repository's original content and documentation
- **Third-Party Content**: Tools listed in [AWESOME.md](./AWESOME.md) keep their own licenses; this repository is an index and claims no ownership of them

---

<div align="center">

**[⬆ Back to Top](#awesome-agent-tools-)**

Made with ❤️ by the community

[Report Bug](https://github.com/Awakehsh/awesome-agent-tools/issues) · [Request Feature](https://github.com/Awakehsh/awesome-agent-tools/issues) · [Contribute](./CONTRIBUTING.md)

</div>
