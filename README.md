# Awesome Agent Tools 🤖✨

> A curated collection of powerful Skills, MCP servers, and tools for AI agents

**Supports**: [Claude Code](#for-claude-code-users) (⭐ **Recommended**), [Codex](#for-codex-users), [Cursor](#for-cursor-users), and other AI development tools

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

[English](./README.md) | [Chinese](./docs/README_CN.md)

---

## 📖 What is This?

**Awesome Agent Tools** is a curated collection of high-quality Skills, MCP (Model Context Protocol) servers, and powerful tools that dramatically extend the capabilities of AI agents far beyond basic chat interfaces.

### What You'll Find Here

- **Original Skills**: Custom-built Skills for specific tasks and workflows
- **Original MCP Servers**: Purpose-built servers for advanced integrations
- **Curated Recommendations**: Carefully selected third-party tools from the community
- **Cross-Platform Support**: Works with multiple AI platforms out of the box

### Why This Repository Exists

AI coding agents are powerful, but they become **truly transformative** when equipped with the right tools. This repository exists to:

1. **Centralize Quality Tools**: Aggregate the best Skills and servers in one place
2. **Share Knowledge**: Make powerful tools accessible to everyone
3. **Reduce Fragmentation**: Unite tools that work across different AI platforms
4. **Enable Innovation**: Provide building blocks for more advanced AI workflows

### Who Should Use This

- **Developers** building AI-powered applications and workflows
- **Researchers** leveraging AI for data analysis and exploration
- **Content Creators** using AI tools for writing and documentation
- **Teams** looking to enhance their AI assistant capabilities
- **Anyone** wanting to extend their AI agent's abilities

### Scope: Beyond Just Coding

While named "agent tools", this collection includes resources for:

- ✅ **Software Development**: Code generation, refactoring, testing, debugging
- ✅ **Content Creation**: Documentation, translation, writing assistance
- ✅ **Research & Analysis**: Data processing, summarization, information gathering
- ✅ **Workflow Automation**: CI/CD, deployment, monitoring, task automation
- ✅ **Design & Creative**: Asset generation, prototyping, workflow optimization
- ✅ **And Much More**: The possibilities are endless!

---

## ✨ Features

- 🎯 **Curated Collection**: Only high-quality, well-tested tools and Skills
- 🔧 **Cross-Platform**: Works with Claude Code, Codex, Cursor, and more
- 📦 **Easy Installation**: Simple one-command setup for most tools
- 🌍 **Community-Driven**: Open source and welcoming contributions
- 🚀 **MCP-Powered**: Leverages the Model Context Protocol standard
- 📚 **Well-Documented**: Clear instructions and examples for everything
- 🔄 **Actively Maintained**: Regular updates and community support

---

## 🚀 Quick Start

### For Claude Code Users (⭐ Recommended)

Claude Code provides the best experience with native SKILL.md support and MCP integration.

#### Install as Marketplace (Recommended)

Add the marketplace to browse and install all skills through the Claude Code UI:

```bash
/plugin
```

When prompted, enter:
```
Awakehsh/awesome-agent-tools
```

This will automatically load the marketplace configuration and allow you to browse available skills.

#### Install Individual Skill

If you prefer to install a specific skill directly:

```bash
# Example: Install codex-cli skill
claude skill add https://github.com/Awakehsh/awesome-agent-tools
```

Then navigate to the `skills/codex-cli` directory when prompted, or use the full GitHub URL:
```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### For Codex Users

Codex natively supports SKILL.md format skills.

```bash
# Install a skill using skill-installer
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli

# Or clone to your skills directory
cd ~/.codex/skills
git clone https://github.com/Awakehsh/awesome-agent-tools
```

### For Cursor Users

Cursor supports skills through MCP servers or direct GitHub imports.

```bash
# Method 1: Import from GitHub URL (in Cursor settings)
# Method 2: Configure MCP server in Cursor settings
# Method 3: Use the skills via MCP integration
```

See [Cross-Platform Guide](./docs/CROSS_PLATFORM.md) for detailed setup instructions.

### For Other Tools

Most AI coding tools support SKILL.md format. Check your tool's documentation for skill installation methods.

---

## 📦 What's Included

### Original Skills

| Skill | Description | Use Cases |
|-------|-------------|-----------|
| **[codex-cli](./skills/codex-cli/)** | Call OpenAI Codex CLI from Claude Code or other non-Codex LLMs for plan review and code analysis | • Plan review before coding<br/>• Code review<br/>• Complex technical discussions<br/>• Multi-round iteration |
| **[learn](./skills/learn/)** | Universal learning system that extracts insights from conversations and updates project memory files (CLAUDE.md, AGENTS.md, .cursorrules, etc.) with LLM-friendly documentation | • Capture learnings from debugging sessions<br/>• Auto-route knowledge to appropriate docs<br/>• Cross-platform memory file sync<br/>• Lifecycle management with freshness decay |

### Original MCP Servers

Currently developing MCP servers. Coming soon:
- Custom integrations
- Specialized tooling
- And more...

### Curated Recommendations

See **[AWESOME.md](./AWESOME.md)** for a comprehensive, categorized list of:
- 🎯 **Official Skills** (Anthropic, OpenAI)
- 🌟 **Community Skills** (from trusted developers)
- 🔧 **MCP Servers** (official and community-built)
- 🛠️ **Tools & Utilities** (installers, frameworks, resources)
- 📚 **Learning Resources** (docs, tutorials, guides)

**Highlighted Recommendations**:
- **[ralph-loop](https://github.com/anthropics/claude-plugins-official)** - Overnight automated development with iterative loops
- **[context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)** - Advanced context engineering with 8-21% quality improvement
- **[openskills](https://github.com/numman-ali/openskills)** - Universal skills loader for multi-platform support

---

## 💡 Why These Tools Matter

### Extending AI Capabilities

Out-of-the-box AI agents are limited to:
- Text generation
- Basic code understanding
- Conversational responses

With Skills and MCP servers, AI agents can:
- ✅ Execute complex workflows
- ✅ Access external APIs and services
- ✅ Manipulate files and databases
- ✅ Integrate with your development environment
- ✅ Automate repetitive tasks
- ✅ Build sophisticated applications

### The Power of Model Context Protocol (MCP)

MCP is an open standard that:
- Provides a **universal interface** for AI tools
- Enables **cross-platform compatibility**
- Reduces **integration complexity**
- Creates a **thriving ecosystem** of interoperable tools

---

## 🎯 Use Cases

### Software Development
- **Code Generation**: Generate boilerplate, implement features
- **Refactoring**: Modernize codebases, improve architecture
- **Testing**: Write tests, analyze coverage, debug issues
- **Documentation**: Auto-generate docs, write tutorials
- **Code Review**: Analyze code quality, suggest improvements

### Content & Documentation
- **Technical Writing**: Create documentation, guides, tutorials
- **Translation**: Translate content across languages
- **Content Creation**: Blog posts, articles, social media
- **Editing & Proofreading**: Improve clarity, fix grammar

### Research & Analysis
- **Data Processing**: Clean, transform, analyze datasets
- **Information Gathering**: Research topics, summarize findings
- **Literature Review**: Analyze papers, extract insights
- **Report Generation**: Create comprehensive reports

### Workflow Automation
- **CI/CD**: Automate build, test, deployment pipelines
- **Task Automation**: Scheduled jobs, batch processing
- **Monitoring**: Track metrics, alert on issues
- **Integration**: Connect different tools and services

---

## 🛠️ Platform Comparison

| Feature | Claude Code | Codex | Cursor | Others |
|---------|------------|-------|---------|--------|
| **SKILL.md Support** | ✅ Native | ✅ Native | ✅ Native | Varies |
| **MCP Support** | ✅ Full | ✅ Full | ✅ Full | Varies |
| **Marketplace** | ✅ Yes | ✅ Yes | ✅ Yes | N/A |
| **Ease of Use** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Varies |
| **Community** | Growing | Large | Growing | Varies |
| **Documentation** | Excellent | Good | Good | Varies |
| **Our Recommendation** | ⭐ **Best** | Great | Great | - |

**Why we recommend Claude Code**:
- Most polished skill management experience
- Excellent marketplace integration
- Best MCP server support
- Great documentation
- Active development and updates

**But the choice is yours!** All tools in this repository work across platforms.

---

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### Ways to Contribute

1. **Add Your Own Skill**: Share your custom-built skills
2. **Recommend Tools**: Suggest great third-party skills and servers
3. **Improve Documentation**: Fix typos, add examples, clarify instructions
4. **Report Issues**: Found a bug? Let us know!
5. **Share Feedback**: Tell us how we can improve

### Contribution Guidelines

Please read our **[CONTRIBUTING.md](./CONTRIBUTING.md)** for:
- How to submit skills
- Code of conduct
- Quality standards
- PR process

---

## 📚 Resources

### Official Documentation
- [Claude Code Skills Guide](https://code.claude.com/docs/en/skills)
- [Model Context Protocol Spec](https://modelcontextprotocol.io/specification)
- [Codex Skills Documentation](https://developers.openai.com/codex/skills/)
- [Cursor Agent Best Practices](https://cursor.com/blog/agent-best-practices)

### Community Resources
- [Awesome Skills Collection](https://github.com/heilcheng/awesome-agent-skills)
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers)
- [Awesome MCP Servers](https://github.com/wong2/awesome-mcp-servers)

### Tutorials & Guides
- [Building Your First Skill](./docs/tutorials/first-skill.md)
- [Creating MCP Servers](./docs/tutorials/mcp-server.md)
- [Cross-Platform Setup](./docs/CROSS_PLATFORM.md)

---

## 📄 License

This repository is licensed under the **MIT License**. See [LICENSE](./LICENSE) for details.

### Important Notes

- **Our Content**: Original skills and documentation in this repo are MIT licensed
- **Third-Party Content**: Recommended tools in [AWESOME.md](./AWESOME.md) maintain their original licenses
- **No Warranty**: Tools are provided "as is" without warranty of any kind

---

## 🌟 Star History

If you find this repository useful, please consider giving it a star! ⭐

---

## 📮 Contact & Support

- **Issues**: [GitHub Issues](https://github.com/Awakehsh/awesome-agent-tools/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Awakehsh/awesome-agent-tools/discussions)
- **Contributing**: See [CONTRIBUTING.md](./CONTRIBUTING.md)

---

## 🙏 Acknowledgments

Thanks to:
- The Anthropic team for Claude Code and the skills framework
- The MCP community for the open protocol standard
- All contributors who shared their skills and tools
- Everyone building amazing things with AI agents!

---

<div align="center">

**[⬆ Back to Top](#awesome-agent-tools-)**

Made with ❤️ by the community

[English](./README.md) · [Chinese Docs](./docs/README_CN.md)

[Report Bug](https://github.com/Awakehsh/awesome-agent-tools/issues) · [Request Feature](https://github.com/Awakehsh/awesome-agent-tools/issues) · [Contribute](./CONTRIBUTING.md)

</div>
