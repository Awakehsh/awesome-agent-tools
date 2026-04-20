# Curated Skills and MCP Servers ⭐

A carefully curated list of AI coding assistant tools, including Skills, MCP servers, and related resources.

## 🎯 Excellent Skills

### Official Skills (Anthropic)

- **[skill-creator](https://github.com/anthropics/skills/tree/main/skill-creator)** by Anthropic
  - Description: Tool for creating new Claude Code skills
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/skill-creator`
  - Features: Auto-generate SKILL.md templates, validate formats, package for publishing

- **[changelog-generator](https://github.com/anthropics/skills/tree/main/changelog-generator)** by Anthropic
  - Description: Automatically generate user-friendly changelogs from Git commit history
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/changelog-generator`
  - Features: Analyze commits, categorize changes, generate markdown format

- **[pdf](https://github.com/anthropics/skills/tree/main/pdf)** by Anthropic
  - Description: PDF file processing toolkit (extract, convert, fill forms)
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/pdf`
  - Features: PDF text extraction, image conversion, form filling

### Community Skills Collections

- **[awesome-agent-skills](https://github.com/heilcheng/awesome-agent-skills)** by heilcheng
  - Description: Large collection of AI coding assistant skills supporting Claude, Codex, Copilot, etc.
  - Categories: Contains practical skills across multiple categories

- **[awesome-codex-skills](https://github.com/ComposioHQ/awesome-codex-skills)** by ComposioHQ
  - Description: Collection of practical skills for Codex CLI and API
  - Features: Workflow automation optimized for Codex

### Development Tools

- **[cursor-skills](https://github.com/chrisboden/cursor-skills)** by chrisboden
  - Description: Skills starter template for Cursor AI editor
  - Features: MCP server integration, auto-import, quick start

- **[context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)** by NeoLabHQ
  - Description: Hand-crafted collection of advanced context engineering techniques for improving agent quality
  - Install: `claude plugin marketplace add NeoLabHQ/context-engineering-kit`
  - Features: Reflexion (reflection loops), scientifically proven techniques, 8-21% quality improvement, token-efficient
  - Plugins: reflexion, memorize, critique with multi-agent debate

### Workflow & Automation Skills

- **[ralph-loop](https://github.com/anthropics/claude-plugins-official)** by Anthropic Official
  - Description: Iterative AI development methodology using automatic retry loops for overnight development
  - Install: `claude plugin install ralph-loop@claude-plugins-official`
  - Features: Automatic retry logic, completion detection, safety guardrails, ideal for well-defined tasks
  - Use Cases: Greenfield development, automated testing workflows, tasks with clear success criteria
  - Note: Real-world impact - $50k contract completed for ~$297 in API costs

### Universal Installers

- **[ai-agent-skills](https://github.com/skillcreatorai/Ai-Agent-Skills)** by skillcreatorai
  - Description: Universal installer for one-click skill installation across all AI tools
  - Usage: `npx ai-agent-skills install skill-name`
  - Supports: Claude Code, Cursor, Codex, VS Code, and 10+ tools

- **[openskills](https://github.com/numman-ali/openskills)** by numman-ali
  - Description: Universal skills loader
  - Usage: `npm i -g openskills && openskills install anthropics/skills`

## 🔧 Recommended MCP Servers

### Official MCP Servers (Model Context Protocol)

- **[filesystem](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)** by MCP Official
  - Description: Secure file system operations server
  - Features: Read/write files, directory management, permission control

- **[github](https://github.com/modelcontextprotocol/servers/tree/main/src/github)** by MCP Official
  - Description: GitHub integration server
  - Features: Repository management, Issues, PR operations

- **[fetch](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)** by MCP Official
  - Description: Web content fetching server
  - Features: HTTP requests, content scraping, API calls

- **[git](https://github.com/modelcontextprotocol/servers/tree/main/src/git)** by MCP Official
  - Description: Git repository operations tool
  - Features: Commit, branch, log viewing

- **[memory](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)** by MCP Official
  - Description: Knowledge graph persistent memory server
  - Features: Store and retrieve contextual information

### Community MCP Servers

- **[awesome-mcp-servers](https://github.com/wong2/awesome-mcp-servers)** by wong2
  - Description: Curated collection of MCP servers
  - Includes: Production-ready and experimental MCP servers

- **[GitHub MCP Server](https://github.com/github/github-mcp-server)** by GitHub Official
  - Description: Official GitHub MCP implementation
  - Features: Complete GitHub API integration

- **[GitNexus](https://github.com/abhigyanpatwari/GitNexus)** by abhigyanpatwari
  - Description: Client-side knowledge graph engine that indexes codebases into a structured graph database, providing AI agents with deep architecture understanding via MCP
  - Install: `claude mcp add gitnexus -- npx -y gitnexus@latest mcp`
  - Features: 7 MCP tools (query, context, impact, detect_changes, rename, cypher, list_repos), hybrid search (BM25 + semantic), 9 languages (TS/JS/Python/Java/C/C++/C#/Go/Rust), execution flow tracing, community detection
  - Supports: Claude Code (MCP + Skills + Hooks), Cursor, Windsurf, OpenCode
  - Note: License is PolyForm Noncommercial 1.0.0 (free for non-commercial use only)

- **[Helium MCP](https://github.com/connerlambden/helium-mcp)** by connerlambden
  - Description: MCP server providing 9 tools for real-time news with bias scoring across 5,000+ sources and 15+ dimensions, live market data, AI options pricing, balanced news synthesis, and meme search
  - Install: `claude mcp add helium-mcp -- npx -y helium-mcp`
  - Features: Real-time news search with political/epistemic bias scoring, live stock/crypto/options market data, AI-powered options pricing, balanced multi-perspective news synthesis, meme search, no auth required, 50 free queries per network
  - Supports: Claude Code, Cursor, Windsurf, Codex, and any MCP-compatible client
  - Website: [heliumtrades.com/mcp-page](https://heliumtrades.com/mcp-page/)

## 🛠️ Related Tools and Resources

### Marketplaces and Plugin Registries

- **[Claude Code Plugin Marketplace](https://claudemarketplaces.com/)**
  - Official Claude Code plugin marketplace

- **[Claude Plugins Registry](https://claude-plugins.dev/)**
  - Community plugin registry

### Development Resources

- **[MCP Servers Repository](https://github.com/modelcontextprotocol/servers)**
  - Official MCP server reference implementations

- **[MCP SDK](https://github.com/modelcontextprotocol/typescript-sdk)**
  - TypeScript SDK for building MCP servers

### Cursor Related

- **[awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules)** by PatrickJS
  - Configuration file collection for Cursor AI editor
  - Includes custom rules and behaviors

- **[vibe-tools](https://github.com/eastlondoner/vibe-tools)** by eastlondoner
  - Provides AI teams and advanced skills for Cursor Agent

## 📚 Learning Resources

### Official Documentation

- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills)
- [Claude Code Plugins Documentation](https://code.claude.com/docs/en/plugins)
- [MCP Specification](https://modelcontextprotocol.io/specification/2025-11-25)
- [Codex Skills Documentation](https://developers.openai.com/codex/skills/)
- [Cursor Agent Documentation](https://cursor.com/docs)

### Community Resource Directories

- **[Awesome Claude](https://awesomeclaude.ai/)**
  - Comprehensive directory of Claude AI resources, tools, and integrations
  - Categories: Official resources, community lists, extensions, applications, education, community
  - Regularly updated with latest tools and servers

### Tutorials and Guides

- [Building MCP Servers](https://modelcontextprotocol.io/docs/develop/build-server)
- [MCP Best Practices](https://modelcontextprotocol.info/docs/best-practices/)
- [Composio MCP Development Guide](https://composio.dev/blog/mcp-server-step-by-step-guide-to-building-from-scrtch)
- [Anthropic Official Courses](https://www.anthropic.com/courses) - Learn Claude API and prompt engineering

## 🤝 Contributing

Found an excellent Skill or MCP server? Feel free to submit a PR to add it to this list!

Please ensure you include:
- Name and link
- Author information
- Brief description
- Installation instructions
- Key features

---

**Last Updated**: 2026-02-27
