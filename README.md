# Awesome Agent Tools 🤖✨

> The hybrid marketplace for AI agent development: original skills, curated tools, and cross-platform support.

**For developers building with AI agents** | Original Skills + Curated Tools | Cross-Platform

**Supports**: [Claude Code](#quick-install) (⭐ Recommended) | [Codex](#quick-install) | [Cursor](#platform-support) | [Windsurf](#platform-support) | [Antigravity](#platform-support)

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

[English](./README.md) | [中文](./docs/README_CN.md)

---

## Why This Collection?

Unlike other lists, we offer:

- **🔀 Hybrid Marketplace**: Original skills we built + carefully curated third-party tools
- **👨‍💻 For Developers**: Built by developers, for developers building with AI agents
- **🌐 Cross-Platform**: Works with Claude Code, Codex, Cursor, Windsurf, Antigravity, and more
- **⚡ Multi-Type**: Skills + MCP Servers + Agents + Plugins (not just one category)
- **✨ Quality-First**: Every tool is vetted and tested, not a link dump
- **🎯 Agent Development**: Special focus on agent workflows, parallel execution, and automation

---

## ✨ Features

- 🎯 **Curated Collection** - Only high-quality, well-tested tools and skills
- 🔧 **Cross-Platform** - Works with Claude Code, Codex, Cursor, Windsurf, Antigravity
- 📦 **Easy Installation** - Simple one-command setup for most tools
- 🌍 **Community-Driven** - Open source and welcoming contributions
- 🚀 **MCP-Powered** - Leverages the Model Context Protocol standard
- 📚 **Well-Documented** - Clear instructions and examples for everything

---

## Quick Install

### Claude Code (⭐ Recommended)

```bash
# Install as marketplace (browse all skills)
/plugin marketplace add Awakehsh/awesome-agent-tools
/plugin install awesome-agent-tools@awesome-agent-tools

# Or add to settings manually
# Add to ~/.claude/settings.json:
# {
#   "extraKnownMarketplaces": {
#     "awesome-agent-tools": {
#       "source": {
#         "source": "github",
#         "repo": "Awakehsh/awesome-agent-tools"
#       }
#     }
#   },
#   "enabledPlugins": {
#     "awesome-agent-tools@awesome-agent-tools": true
#   }
# }

# Or install individual skill
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn
```

> **Note**: Marketplace configuration inspired by [everything-claude-code](https://github.com/affaan-m/everything-claude-code) - a battle-tested collection from an Anthropic hackathon winner.

### Codex

```text
# Install a single skill (in Codex CLI chat, not your shell)
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn

# Restart Codex to pick up new skills
```

```bash
# Install all skills (recommended if this repo will keep adding skills)
git clone https://github.com/Awakehsh/awesome-agent-tools ~/awesome-agent-tools
mkdir -p ~/.codex/skills

# Option A (recommended): symlink all skills for easy updates via `git pull`
for d in ~/awesome-agent-tools/skills/*; do ln -s "$d" ~/.codex/skills/; done

# Option B: copy all skills (no symlinks)
# cp -R ~/awesome-agent-tools/skills/* ~/.codex/skills/

# Update later
# (cd ~/awesome-agent-tools && git pull) && restart Codex
```

### Cursor / Windsurf / Antigravity

```bash
# Import from GitHub URL in settings
# Or configure MCP server integration
# See detailed guide below
```

**Detailed setup**: [Cross-Platform Guide](./docs/CROSS_PLATFORM.md)

---

## 🤖 Agent Development Highlights

Special features for building AI agent systems:

| Feature | Description | Platform |
|---------|-------------|----------|
| **Custom Sub-Agents** | Independent contexts for specialized tasks ([guide](./agents/README.md)) | Claude Code |
| **Parallel Execution** | Run multiple agents simultaneously ([examples](./agents/README.md#triggering-parallel-agents)) | Claude Code |
| **Agent Skills** | Reusable skill bundles for agents | Claude Code, Codex |
| **MCP Integration** | Connect agents to external tools & data sources | All platforms |
| **Workflow Automation** | Slash commands, hooks, and agent orchestration | Claude Code |

**New to agents?** Check out our [Agent Development Guide](./agents/README.md) for workflows, patterns, and best practices.

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
| **[awesome-mcp-servers](https://github.com/wong2/awesome-mcp-servers)** | Curated List | 79k+ stars - The definitive MCP server collection | All |

---

### 🛠️ Original Tools

Open-source contributions from this repository:

#### Skills (2)

##### codex-cli
**Call OpenAI Codex CLI from Claude Code for plan review and code analysis.**
- **Use Cases**: Plan review, code analysis, technical discussions, multi-round iteration
- **Install**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli`

[Learn more →](./skills/codex-cli/README.md)

##### learn
**Universal learning system that extracts insights from conversations and updates project memory files.**
- **Use Cases**: Capture learnings, auto-route to docs (CLAUDE.md, AGENTS.md), cross-platform sync
- **Install**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn`

[Learn more →](./skills/learn/README.md)

#### Agents (Documentation)

**Claude Code Agents** - Custom agent configurations for specialized workflows
- Independent contexts prevent pollution
- Parallel execution for simultaneous tasks
- Automatic routing and delegation

[Learn more →](./agents/README.md)

#### MCP Servers (Coming Soon)
- Custom integrations
- Specialized tooling
- Watch this space!

---

### 🌟 Curated Recommendations (30+ Tools)

Carefully vetted third-party tools organized by category:

**See the full curated list**: **[AWESOME.md](./AWESOME.md)**

Categories:
- 🎯 **Official Skills** - From Anthropic, OpenAI
- 🌟 **Community Skills** - Trusted developers
- 🔧 **MCP Servers** - Official and community-built
- 🛠️ **Tools & Utilities** - Installers, frameworks, resources

---

### 📚 Guides & Documentation

- [Agent Development Guide](./agents/README.md) - Workflows, parallel execution, best practices
- [Cross-Platform Setup](./docs/CROSS_PLATFORM.md) - Detailed setup for each platform
- [Contributing Guide](./CONTRIBUTING.md) - How to add your tools
- [Project Guidelines](./CLAUDE.md) - Repository philosophy and standards

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

| Platform | SKILL.md | MCP | Memory Files | Recommended |
|----------|----------|-----|--------------|-------------|
| Claude Code | ✅ | ✅ | CLAUDE.md | ⭐ Best |
| Codex | ✅ | ✅ | AGENTS.md | Great |
| Cursor | ✅ | ✅ | .cursorrules | Great |
| Windsurf | ✅ | ✅ | .windsurfrules | Good |
| Antigravity | ✅ | ✅ | .agent/rules/ | Good |

**Why we recommend Claude Code**: Best skill management, excellent MCP support, great documentation.

---

## Claude Code Tips

Claude Code has powerful built-in features you might not know:

| Feature | Description |
|---------|-------------|
| **`/skills`** | Create custom skills directly in CLI |
| **`/agents`** | Create custom sub-agents with independent contexts ([learn more](./agents/README.md)) |
| **`CLAUDE.md`** | Project memory that prevents repeated mistakes |
| **Slash Commands** | Store workflows in `.claude/commands/` for automation |
| **Parallel Agents** | Run multiple agents simultaneously for independent tasks ([learn more](./agents/README.md#triggering-parallel-agents)) |
| **Plan Mode** | Read-only codebase analysis before making changes |

**Pro tip from Anthropic team**: Add mistakes to CLAUDE.md so Claude learns and doesn't repeat them.

Learn more: [Official Docs](https://code.claude.com/docs/en/skills) | [Creator's Workflow](https://venturebeat.com/technology/the-creator-of-claude-code-just-revealed-his-workflow-and-developers-are)

---

## Codex Tips

Codex skill loading is folder-based. A skill lives at `~/.codex/skills/<skill-name>/SKILL.md`.

| Tip | Description |
|-----|-------------|
| **`$skill-installer ...`** | Run this in the Codex CLI chat (not your shell), then restart Codex |
| **Verify install** | Check `~/.codex/skills/<skill-name>/SKILL.md` exists |
| **Create a new skill** | Make `~/.codex/skills/<skill-name>/SKILL.md` (YAML frontmatter + Markdown) |
| **Reload skills** | Restart Codex after adding or editing a skill folder |

---

## Resources

### Official Documentation

- [Claude Code Skills Docs](https://code.claude.com/docs/en/skills)
- [MCP Specification](https://modelcontextprotocol.io/specification)
- [Codex Skills Documentation](https://developers.openai.com/codex/skills/)

### Community Resources

- [Awesome MCP Servers](https://github.com/wong2/awesome-mcp-servers) - 79,000+ stars
- [Awesome Claude](https://awesomeclaude.ai/) - Comprehensive directory
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers)

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

- **Our Content**: Original skills and documentation are MIT licensed
- **Third-Party Content**: Tools in AWESOME.md maintain their original licenses

---

<div align="center">

**[⬆ Back to Top](#awesome-agent-tools-)**

Made with ❤️ by the community

[Report Bug](https://github.com/Awakehsh/awesome-agent-tools/issues) · [Request Feature](https://github.com/Awakehsh/awesome-agent-tools/issues) · [Contribute](./CONTRIBUTING.md)

</div>
