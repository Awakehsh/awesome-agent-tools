# Awesome Agent Tools 🤖✨

> A curated collection of cross-platform tools for AI coding agents: Skills, MCP servers, plugins, and more.

**Supports**: [Claude Code](#quick-install) (⭐ Recommended) | [Codex](#quick-install) | [Cursor](#platform-support) | [Windsurf](#platform-support) | [Antigravity](#platform-support)

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

[English](./README.md) | [中文](./docs/README_CN.md)

---

## Why This Collection?

Most "awesome" lists focus on one platform or one type. **We're different**:

- **Cross-Platform**: Works with Claude Code, Codex, Cursor, Windsurf, Antigravity, and more
- **Multi-Type**: Skills + MCP Servers + Plugins + Tools (not just one category)
- **Quality-First**: Every tool is vetted, not a link dump
- **Developer-Focused**: Prioritizing productivity tools, but not limited to coding

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
/plugin
# Enter: Awakehsh/awesome-agent-tools

# Or install individual skill
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn
```

### Codex

```text
# In Codex CLI chat (this is not a shell command)
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn

# Restart Codex to pick up new skills
```

```bash
# Alternative: install from your terminal (requires Python 3)
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py --url \
  https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn

# Manual: clone repo, then copy (or symlink) the skill folder
git clone https://github.com/Awakehsh/awesome-agent-tools ~/awesome-agent-tools
cp -r ~/awesome-agent-tools/skills/learn ~/.codex/skills/
```

### Cursor / Windsurf / Antigravity

```bash
# Import from GitHub URL in settings
# Or configure MCP server integration
# See detailed guide below
```

**Detailed setup**: [Cross-Platform Guide](./docs/CROSS_PLATFORM.md)

---

## What's Included

### Original Skills

#### codex-cli

**Call OpenAI Codex CLI from Claude Code for plan review and code analysis.**

- **Use Cases**:
  - Plan review before coding
  - Code review and analysis
  - Complex technical discussions
  - Multi-round iteration and improvement
- **Install**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli`

[Learn more →](./skills/codex-cli/README.md)

#### learn

**Universal learning system that extracts insights from conversations and updates project memory files.**

- **Use Cases**:
  - Capture learnings from debugging sessions
  - Auto-route knowledge to appropriate docs (CLAUDE.md, AGENTS.md, .cursorrules)
  - Cross-platform memory file sync
  - Lifecycle management with freshness decay
- **Install**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn`

[Learn more →](./skills/learn/README.md)

### Original MCP Servers

Coming soon:
- Custom integrations
- Specialized tooling
- And more...

### Curated Recommendations

See **[AWESOME.md](./AWESOME.md)** for the full categorized list:

- 🎯 **Official Skills** - Anthropic, OpenAI
- 🌟 **Community Skills** - From trusted developers
- 🔧 **MCP Servers** - Official and community-built
- 🛠️ **Tools & Utilities** - Installers, frameworks, resources

**Highlights**:

| Tool | Description |
|------|-------------|
| [ralph-loop](https://github.com/anthropics/claude-plugins-official) | Overnight automated development with iterative loops |
| [context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit) | Advanced context engineering, 8-21% quality improvement |
| [openskills](https://github.com/numman-ali/openskills) | Universal skills loader for multi-platform support |

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
| **`CLAUDE.md`** | Project memory that prevents repeated mistakes |
| **Slash Commands** | Store workflows in `.claude/commands/` for automation |
| **Parallel Agents** | Run multiple Claude instances for compound productivity |
| **Plan Mode** | Read-only codebase analysis before making changes |

**Pro tip from Anthropic team**: Add mistakes to CLAUDE.md so Claude learns and doesn't repeat them.

Learn more: [Official Docs](https://code.claude.com/docs/en/skills) | [Creator's Workflow](https://venturebeat.com/technology/the-creator-of-claude-code-just-revealed-his-workflow-and-developers-are)

---

## Codex Tips

Codex skill loading is folder-based. A skill lives at `~/.codex/skills/<skill-name>/SKILL.md`.

| Tip | Description |
|-----|-------------|
| **`$skill-installer ...`** | Run this in the Codex CLI chat (not your shell), then restart Codex |
| **Create a new skill** | Make a folder in `~/.codex/skills/<skill-name>/` and add `SKILL.md` (YAML frontmatter + Markdown) |
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
