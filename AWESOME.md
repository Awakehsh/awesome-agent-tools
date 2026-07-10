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

- **[pptx](https://github.com/anthropics/skills/tree/main/pptx)** by Anthropic
  - Description: Create and edit PowerPoint presentations programmatically
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/pptx`
  - Features: Slide creation, layouts, speaker notes, template support

- **[xlsx](https://github.com/anthropics/skills/tree/main/xlsx)** by Anthropic
  - Description: Create and edit Excel/CSV spreadsheets programmatically
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/xlsx`
  - Features: Workbook generation, formulas, formatting, data import/export

- **[docx](https://github.com/anthropics/skills/tree/main/docx)** by Anthropic
  - Description: Create and edit Word documents programmatically
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/docx`
  - Features: Structured authoring, styles, tables, review workflows

- **[mcp-builder](https://github.com/anthropics/skills/tree/main/mcp-builder)** by Anthropic
  - Description: Meta-skill that guides building high-quality MCP servers (Python FastMCP or TypeScript SDK)
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/mcp-builder`
  - Features: Scaffolding, best-practice patterns, validation helpers

- **[webapp-testing](https://github.com/anthropics/skills/tree/main/webapp-testing)** by Anthropic
  - Description: Playwright-based toolkit for testing and debugging local web applications
  - Install: `claude skill add https://github.com/anthropics/skills/tree/main/webapp-testing`
  - Features: Browser automation, UI verification, screenshot capture, console/log inspection

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

- **[agenttrace](https://github.com/luoyuctl/agenttrace)** by luoyuctl
  - Description: Local TUI observability for AI coding agent sessions across cost, tokens, latency, failures, and reports
  - Install: `go install github.com/luoyuctl/agenttrace/cmd/agenttrace@latest`
  - Features: Supports Claude Code, Codex CLI, Gemini CLI, Aider, Cursor exports, health checks, anomaly detection, and CI gates
- **[rust-norion](https://github.com/yanghao1143/rust-norion)** by yanghao1143
  - Description: Rust prototype for agent runtime control, memory gates, model routing policy, audit evidence, and self-evolution loop tooling
  - Install: Follow the repository README and contributor docs; published packages are not the main surface yet
  - Features: Rust control layer, memory admission/recall boundaries, model-pool policy, evidence gates, status surfaces, and contributor-facing evolution workflows

### Workflow & Automation Skills

- **[Hermes Tweet](https://github.com/Xquik-dev/hermes-tweet)** by Xquik-dev
  - Description: Native Hermes Agent plugin for X/Twitter research, monitoring, and approval-gated actions.
  - Install: `hermes plugins install Xquik-dev/hermes-tweet --enable`
  - Features: Read-first X search, account reads, trend and monitor workflows, plus opt-in posting, replies, likes, retweets, follows, and DMs through Hermes.

- **[ralph-loop](https://github.com/anthropics/claude-plugins-official)** by Anthropic Official
  - Description: Iterative AI development methodology using automatic retry loops for overnight development
  - Install: `claude plugin install ralph-loop@claude-plugins-official`
  - Features: Automatic retry logic, completion detection, safety guardrails, ideal for well-defined tasks
  - Use Cases: Greenfield development, automated testing workflows, tasks with clear success criteria
  - Note: Real-world impact - $50k contract completed for ~$297 in API costs

### Planning & Design Skills

- **[grill-me](https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me)** by Matt Pocock
  - Description: Interviews you relentlessly about a plan or design until reaching shared understanding, walking down each branch of the decision tree one question at a time
  - Install: `npx skills@latest add mattpocock/skills` (then select `grill-me`)
  - Features: One-question-at-a-time interviewing, recommended answer for every question, falls back to codebase exploration when an answer can be derived from code
  - Use Cases: Stress-testing a plan before implementation, surfacing unstated assumptions, resolving dependencies between design decisions
  - Trigger: Mention "grill me" or ask to stress-test a design
  - Note: Part of Matt Pocock's broader [Skills For Real Engineers](https://github.com/mattpocock/skills) collection

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

- **[sequentialthinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)** by MCP Official
  - Description: Structured multi-step reasoning tool for complex problem solving
  - Features: Step sequencing, revision, branching thought chains

- **[time](https://github.com/modelcontextprotocol/servers/tree/main/src/time)** by MCP Official
  - Description: Timezone conversion and current-time queries
  - Features: IANA timezone support, formatted output, lightweight utility

### Community MCP Servers

- **[awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers)** by punkpeye
  - Description: Most active MCP server directory (85k+ stars, 1,500+ contributors)
  - Includes: Production-ready and experimental MCP servers across all categories

- **[awesome-mcp-servers](https://github.com/wong2/awesome-mcp-servers)** by wong2
  - Description: Long-standing curated collection of MCP servers (alternative directory)
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
  - Description: MCP server for real-time news with bias scoring (5,000+ sources, 15+ dimensions), live stock/crypto/options market data, AI options pricing, and meme search
  - Install: `claude mcp add helium-mcp -- npx -y helium-mcp`
  - Features: 9 tools (news search, balanced synthesis, source/URL bias analysis, ticker data, option pricing/strategies, meme search), no auth required, free tier available
  - Supports: Claude Code, Cursor, Windsurf, Codex, and any MCP-compatible client
  - Website: [heliumtrades.com/mcp-page](https://heliumtrades.com/mcp-page/)

- **[playwright-mcp](https://github.com/microsoft/playwright-mcp)** by Microsoft
  - Description: Official browser-automation MCP server using Playwright's accessibility tree for reliable, LLM-friendly web interaction (31k+ stars)
  - Install: `claude mcp add playwright -- npx -y @playwright/mcp@latest`
  - Features: Accessibility-first automation (no screenshots needed), form interaction, navigation, console/network inspection, Apache-2.0
  - Note: Recommended successor to the archived puppeteer reference server

- **[mcp-server-cloudflare](https://github.com/cloudflare/mcp-server-cloudflare)** by Cloudflare
  - Description: Official Cloudflare MCP servers covering Workers, KV, D1, R2, Observability, and more (13 sub-servers)
  - Features: Remote/hosted deployment, OAuth support, per-service granularity, Apache-2.0

- **[exa-mcp-server](https://github.com/exa-labs/exa-mcp-server)** by Exa Labs
  - Description: Semantic web search and crawling via the Exa API — a high-quality replacement for the archived brave-search reference server
  - Install: `claude mcp add exa -- npx -y exa-mcp-server`
  - Features: Neural search, content extraction, domain filtering, research workflows
  - Note: Requires Exa API key

- **[sentry-mcp](https://github.com/getsentry/sentry-mcp)** by Sentry
  - Description: Official Sentry error-tracking and observability MCP server (remote, OAuth-based)
  - Features: Issue search, stack-trace inspection, release/deploy correlation, hosted remote MCP (no local install)

- **[x-twitter-scraper](https://github.com/Xquik-dev/x-twitter-scraper)** by Xquik-dev
  - Description: Xquik remote MCP server and installable skill for X/Twitter data workflows
  - Install: See the [MCP setup docs](https://docs.xquik.com/mcp/overview)
  - Features: Tweet search, profile lookups, media downloads, monitors, HMAC webhooks, and REST API exploration
  - Supports: MCP-compatible clients and skills-compatible agents
  - Note: Requires a Xquik API key

- **[RunAPI MCP Server](https://github.com/runapi-ai/mcp)** by runapi-ai
  - Description: MCP server for browsing the RunAPI model catalog and running AI model tasks from agent workflows
  - Install: `claude mcp add runapi -s user -- npx -y @runapi.ai/mcp`
  - Features: Catalog browsing, model info, pricing snapshots, prompt search, image/video/music/audio/text-to-speech task creation, task status, and balance checks
  - Supports: Claude Code, Codex, Cursor, Windsurf, VS Code, Roo Code, and other MCP-compatible clients

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

- **[FastMCP](https://github.com/jlowin/fastmcp)** by jlowin
  - Python framework for building MCP servers and clients (24k+ stars, Apache-2.0) — de-facto standard for Python MCP development

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

**Last Updated**: 2026-05-26
