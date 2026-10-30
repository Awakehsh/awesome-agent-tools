# Curated Skills and MCP Servers ⭐

A carefully curated list of third-party tools for AI agents: Skills, MCP servers, plugins, and related resources. Original tools maintained in this repository are listed in the [README](./README.md).

**Inclusion criteria**: Open-source entries have a public repository, a stated license (non-OSI licenses are named in the entry), at least 10 GitHub stars, a commit in the last 6 months, and clear install docs. Hosted MCP services are listed in the [official MCP Registry](https://registry.modelcontextprotocol.io) under a verified namespace, serve Streamable HTTP, and publicly document authentication and pricing. See [CONTRIBUTING.md](./CONTRIBUTING.md#inclusion-criteria) for the full criteria and removal policy.

## 🎯 Skills

### Official Anthropic Skills

- **[anthropics/skills](https://github.com/anthropics/skills)** by Anthropic - Anthropic's public skills repository, which doubles as the `anthropic-agent-skills` Claude Code plugin marketplace
  - Install: `/plugin marketplace add anthropics/skills`, then install one of the bundles below
  - Bundles:
    - `document-skills`: [xlsx](https://github.com/anthropics/skills/tree/main/skills/xlsx), [docx](https://github.com/anthropics/skills/tree/main/skills/docx), [pptx](https://github.com/anthropics/skills/tree/main/skills/pptx), and [pdf](https://github.com/anthropics/skills/tree/main/skills/pdf) for creating, editing, and analyzing Office documents and PDFs. Install: `/plugin install document-skills@anthropic-agent-skills`
    - `example-skills`: includes [skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator), [mcp-builder](https://github.com/anthropics/skills/tree/main/skills/mcp-builder), [webapp-testing](https://github.com/anthropics/skills/tree/main/skills/webapp-testing), [frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design), [doc-coauthoring](https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring), and [web-artifacts-builder](https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder). Install: `/plugin install example-skills@anthropic-agent-skills`
    - `claude-api`: [claude-api](https://github.com/anthropics/skills/tree/main/skills/claude-api), a reference for building with the Claude API and SDKs. Install: `/plugin install claude-api@anthropic-agent-skills`
  - License: Apache-2.0 for most skills; the four document skills are source-available, not open source (see each skill's `LICENSE.txt`)

### Skill Collections

- **[wshobson/agents](https://github.com/wshobson/agents)** by Seth Hobson - Large plugin marketplace of agents, skills, and commands for development, code review, testing, infrastructure, and security, adapted for Claude Code, Codex, Cursor, OpenCode, and more
  - Install: `/plugin marketplace add wshobson/agents`, then for example `/plugin install python-development@claude-code-workflows`

- **[Trail of Bits Skills](https://github.com/trailofbits/skills)** by Trail of Bits - Plugin marketplace of skills for AI-assisted security analysis, testing, and development workflows
  - Install: `/plugin marketplace add trailofbits/skills`, then browse with `/plugin`
  - License: CC-BY-SA-4.0

- **[Vercel Agent Skills](https://github.com/vercel-labs/agent-skills)** by Vercel - Vercel's official skills, such as React and Next.js best practices, web design guidelines, and Vercel project audits
  - Install: `npx skills add vercel-labs/agent-skills`
  - License: MIT (stated in the README; the repository has no license file)

- **[NotFair](https://github.com/nowork-studio/notfair-plugin)** by nowork-studio - Open-source marketing skills for SEO, GEO, paid media, analytics, and content workflows
  - Install: `/plugin marketplace add nowork-studio/notfair-plugin`, then `/plugin install notfair@nowork-studio`
  - Note: Live account analysis (Search Console, GA4, ad platforms) goes through NotFair's hosted MCP server and requires a NotFair account

- **[Orkas VideoStudio](https://github.com/Orkas-AI/Orkas-VideoStudio)** by Orkas-AI - Video composition, editing, transcription, and optional generation driven from a coding agent, with the video expressed as an editable `plan.json` timeline
  - Install: Build from source (`pnpm install && pnpm build`) per the [README](https://github.com/Orkas-AI/Orkas-VideoStudio#install); it ships skills for Claude Code and Codex plus an MCP server
  - Note: Requires Node 22+ and `ffmpeg`; generation is opt-in and uses your own provider keys

### Development & Workflow Skills

- **[Superpowers](https://github.com/obra/superpowers)** by Jesse Vincent - Software development methodology built from composable skills: brainstorming a spec, writing an implementation plan, then subagent-driven development with TDD and code review
  - Install: `/plugin install superpowers@claude-plugins-official` (the README also covers Codex, Copilot CLI, OpenCode, and other agents)

- **[Skills For Real Engineers](https://github.com/mattpocock/skills)** by Matt Pocock - Small, composable engineering skills, including [grill-me](https://github.com/mattpocock/skills/tree/main/skills/productivity/grill-me), which interviews you one question at a time about a plan or design until every branch of the decision tree is resolved
  - Install: `claude plugin install mattpocock-skills@claude-plugins-official`, or `npx skills@latest add mattpocock/skills` for other agents

- **[context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)** by NeoLabHQ - Collection of context engineering techniques packaged as plugins, such as reflexion (reflection loops), code review, and spec-driven development
  - Install: `/plugin marketplace add NeoLabHQ/context-engineering-kit`, then for example `/plugin install reflexion@context-engineering-kit`

### Skill Installers

- **[skills](https://github.com/vercel-labs/skills)** by Vercel - The `npx skills` CLI for the open Agent Skills ecosystem; installs skills from any GitHub repository into Claude Code, Codex, Cursor, OpenCode, and many other agents. Browse skills at [skills.sh](https://skills.sh)
  - Install: `npx skills add <owner>/<repo>` (add `--skill <name>` for one skill, `-g` for user scope)

- **[ai-agent-skills](https://github.com/MoizIbnYousaf/ai-agent-skills)** by MoizIbnYousaf - Curated skill library plus a CLI for installing skills and building your own shareable library
  - Install: `npx ai-agent-skills install <skill-name>` (`npx ai-agent-skills` opens a terminal browser)

## 🧩 Plugins & Marketplaces

### Marketplaces & Directories

- **[claude-plugins-official](https://github.com/anthropics/claude-plugins-official)** by Anthropic - Anthropic's official Claude Code plugin marketplace: plugins maintained by Anthropic plus approved third-party plugins from partners and the community
  - Install: Added automatically on the first interactive Claude Code session; install with `/plugin install <name>@claude-plugins-official`, browse with `/plugin`, or browse on the web at [claude.com/plugins](https://claude.com/plugins)

- **[claude-plugins-community](https://github.com/anthropics/claude-plugins-community)** by Anthropic - Read-only mirror of the community plugin marketplace; every plugin is submitted through Anthropic's directory form and passes automated security scanning
  - Install: `claude plugin marketplace add anthropics/claude-plugins-community`, then `claude plugin install <name>@claude-community`

- **[claudemarketplaces.com](https://claudemarketplaces.com/)** - Community directory of Claude Code skills, plugin marketplaces, and MCP servers (independent project, not affiliated with Anthropic)

- **[Claude Plugins Registry](https://claude-plugins.dev/)** - Community-maintained plugin and skill registry with a CLI that adds the marketplace and installs a plugin in one step

### Notable Plugins

- **[ralph-loop](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/ralph-loop)** by Anthropic - Runs the "Ralph Wiggum" technique inside a Claude Code session: a Stop hook feeds the same prompt back until a completion promise appears or an iteration limit is hit
  - Install: `/plugin install ralph-loop@claude-plugins-official`
  - Features: `/ralph-loop "<prompt>" --completion-promise "<text>" --max-iterations <n>`, `/cancel-ralph`
  - Note: Suited to well-defined tasks with automatic verification (tests, linters); always set `--max-iterations` as a safety limit

- **[Codex plugin for Claude Code](https://github.com/openai/codex-plugin-cc)** by OpenAI - Use Codex from inside Claude Code for read-only reviews, adversarial reviews, and delegating background tasks
  - Install: `/plugin marketplace add openai/codex-plugin-cc`, then `/plugin install codex@openai-codex`
  - Note: Requires a ChatGPT account (Free included) or an OpenAI API key; usage counts toward Codex limits

- **[Hermes Tweet](https://github.com/Xquik-dev/hermes-tweet)** by Xquik-dev - Hermes Agent plugin for X/Twitter search, monitoring, and approval-gated actions
  - Install: `hermes plugins install Xquik-dev/hermes-tweet --enable`
  - Features: Read-first X search, account reads, trend and monitor workflows, plus opt-in posting, replies, likes, retweets, follows, and DMs
  - Note: Requires an Xquik API key (`XQUIK_API_KEY`) for anything beyond tweet exploration

## 🔧 MCP Servers

### Reference Servers (Model Context Protocol)

Reference implementations maintained by the MCP steering group to demonstrate MCP features and the official SDKs. They are educational examples, not production-ready servers.

- **[filesystem](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)** by MCP
  - Description: Secure file operations with configurable access controls
  - Install: `claude mcp add filesystem -- npx -y @modelcontextprotocol/server-filesystem <allowed-dir>`
  - Features: Read/write files, directory management, access limited to allowed directories
  - Supports: Any MCP client (stdio)

- **[fetch](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)** by MCP
  - Description: Web content fetching and conversion to Markdown for LLM use
  - Install: `claude mcp add fetch -- uvx mcp-server-fetch`
  - Features: Fetch URLs, HTML-to-Markdown conversion, chunked reading of long pages
  - Supports: Any MCP client (stdio)

- **[git](https://github.com/modelcontextprotocol/servers/tree/main/src/git)** by MCP
  - Description: Tools to read, search, and manipulate Git repositories
  - Install: `claude mcp add git -- uvx mcp-server-git`
  - Features: Status, diff, log, commit, and branch operations
  - Supports: Any MCP client (stdio)

- **[memory](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)** by MCP
  - Description: Knowledge graph-based persistent memory
  - Install: `claude mcp add memory -- npx -y @modelcontextprotocol/server-memory`
  - Features: Store and retrieve entities, relations, and observations across sessions
  - Supports: Any MCP client (stdio)

- **[sequentialthinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)** by MCP
  - Description: Structured, reflective multi-step reasoning for complex problems
  - Install: `claude mcp add sequential-thinking -- npx -y @modelcontextprotocol/server-sequential-thinking`
  - Features: Step sequencing, revision, branching thought chains
  - Supports: Any MCP client (stdio)

- **[time](https://github.com/modelcontextprotocol/servers/tree/main/src/time)** by MCP
  - Description: Current time and timezone conversion
  - Install: `claude mcp add time -- uvx mcp-server-time`
  - Features: IANA timezone support, conversion between timezones
  - Supports: Any MCP client (stdio)

### Open-Source Servers

- **[GitHub MCP Server](https://github.com/github/github-mcp-server)** by GitHub
  - Description: GitHub's official MCP server for repositories, code, issues, pull requests, Actions, and security findings
  - Install: `claude mcp add-json github '{"type":"http","url":"https://api.githubcopilot.com/mcp","headers":{"Authorization":"Bearer YOUR_GITHUB_PAT"}}'` (see the [Claude Code guide](https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-claude.md) for the local Docker image `ghcr.io/github/github-mcp-server`)
  - Features: Hosted remote server or local server, OAuth or personal access token, toolsets to enable only the GitHub capabilities you need
  - Supports: Any MCP client (Streamable HTTP or stdio)

- **[playwright-mcp](https://github.com/microsoft/playwright-mcp)** by Microsoft
  - Description: Browser automation through Playwright's accessibility snapshots, so the model works with structured page data instead of screenshots
  - Install: `claude mcp add playwright npx @playwright/mcp@latest`
  - Features: Navigation, form interaction, console and network inspection; Microsoft also offers [Playwright CLI with skills](https://github.com/microsoft/playwright-cli) for token-efficient coding-agent workflows
  - Supports: Any MCP client (stdio, or HTTP with `--port`)

- **[Chrome DevTools MCP](https://github.com/ChromeDevTools/chrome-devtools-mcp)** by ChromeDevTools
  - Description: Lets a coding agent control and inspect a live Chrome browser with the full power of Chrome DevTools
  - Install: `claude mcp add chrome-devtools --scope user npx chrome-devtools-mcp@latest`, or `/plugin marketplace add ChromeDevTools/chrome-devtools-mcp` for the MCP server plus skills
  - Features: Performance traces and insights, network and console inspection with source-mapped stack traces, screenshots, Puppeteer-based automation; a CLI is also available
  - Supports: Any MCP client (stdio)

- **[Context7](https://github.com/upstash/context7)** by Upstash
  - Description: Pulls up-to-date, version-specific library documentation and code examples into the agent's context
  - Install: `npx ctx7 setup` (choose MCP or CLI + skills mode), or connect any client to `https://mcp.context7.com/mcp` (send an API key as `Authorization: Bearer <key>`)
  - Features: `resolve-library-id` and `query-docs` tools
  - Supports: Any MCP client (Streamable HTTP or stdio)
  - Note: Works without a key at lower rate limits; a free API key from context7.com raises them

- **[Serena](https://github.com/oraios/serena)** by Oraios AI
  - Description: IDE-like semantic code retrieval, editing, refactoring, and debugging tools that operate at the symbol level
  - Install: `uv tool install -p 3.13 serena-agent`, then `serena init`; the README links per-client setup guides
  - Features: Symbol-level navigation, cross-file renames and moves, reference lookups, language-server backend
  - Supports: Claude Code, Codex, Claude Desktop, MCP-enabled IDEs, and other MCP clients

- **[GitNexus](https://github.com/abhigyanpatwari/GitNexus)** by abhigyanpatwari
  - Description: Indexes a codebase into a local knowledge graph and exposes it through MCP tools so agents understand architecture, call chains, and change impact
  - Install: `claude mcp add gitnexus -- npx -y gitnexus@latest mcp` (run `npx gitnexus analyze` in the repository first)
  - Features: Query, context, impact analysis, change detection, rename, and Cypher tools; hybrid BM25 + semantic search; many languages including TypeScript, Python, Java, Go, Rust, C#, and C/C++
  - Supports: Claude Code, Codex, Cursor, and Antigravity (MCP + skills + hooks); OpenCode, Windsurf, and other MCP clients
  - Note: License is PolyForm Noncommercial 1.0.0 (free for non-commercial use only; commercial licenses available from the authors)

- **[Cloudflare MCP Server](https://github.com/cloudflare/mcp)** by Cloudflare
  - Description: Token-efficient MCP server for the entire Cloudflare API, using Code Mode: broad API access through code execution with a handful of tools
  - Install: `claude mcp add --transport http cloudflare-api https://mcp.cloudflare.com/mcp`
  - Features: OAuth with per-permission authorization or a Cloudflare API token; product-specific servers (docs, containers, browser rendering, and more) live in [mcp-server-cloudflare](https://github.com/cloudflare/mcp-server-cloudflare)
  - Supports: Any MCP client (Streamable HTTP)

- **[Sentry MCP](https://github.com/getsentry/toolkit)** by Sentry
  - Description: Sentry's MCP server for coding agents: search issues, errors, traces, and logs, and inspect stack traces while debugging
  - Install: `claude mcp add --transport http sentry https://mcp.sentry.dev/mcp` (optionally append `/<org>/<project>`)
  - Features: Hosted remote server with OAuth; stdio transport for self-hosted Sentry; AI-powered search tools need an LLM provider key
  - Supports: Any MCP client (Streamable HTTP or stdio)
  - Note: Source lives in the `getsentry/toolkit` repository under FSL-1.1-Apache-2.0 (Functional Source License, source-available; each release becomes Apache-2.0 two years after it is published)

- **[Supabase MCP Server](https://github.com/supabase/mcp)** by Supabase
  - Description: Connects agents to your Supabase projects to manage tables, fetch configuration, and query data
  - Install: `claude mcp add --transport http supabase https://mcp.supabase.com/mcp` (sign in to Supabase when prompted)
  - Features: OAuth login, feature groups (docs, database, functions, branching, and more), local CLI and self-hosted endpoints with a subset of tools
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Read Supabase's [security best practices](https://supabase.com/docs/guides/ai-tools/mcp#security-risks) before connecting an LLM to a project

- **[Exa MCP Server](https://github.com/exa-labs/exa-mcp-server)** by Exa Labs
  - Description: Web search, page fetching, and research tools backed by the Exa search API
  - Install: `claude plugin install exa@claude-plugins-official`, or connect any client to `https://mcp.exa.ai/mcp`
  - Features: Default search and fetch tools, optional advanced tools selected with the `tools` URL parameter, bundled skills
  - Supports: Any MCP client (Streamable HTTP)
  - Note: The hosted server works anonymously with rate limits; sign in with OAuth or use an Exa API key for higher limits and Exa Agent

- **[RunAPI MCP Server](https://github.com/runapi-ai/mcp)** by runapi-ai
  - Description: Browse the RunAPI model catalog and run AI model tasks from agent workflows
  - Install: `claude mcp add runapi -s user -- npx -y @runapi.ai/mcp`
  - Features: Catalog browsing, model info, pricing, image/video/music/audio/text-to-speech task creation, task status, and balance checks
  - Supports: Claude Code, Codex, Cursor, Windsurf, VS Code, Roo Code, and other MCP clients (stdio)
  - Note: Discovery tools work without a key; running tasks requires a RunAPI account

### Hosted MCP Services

Remote MCP endpoints whose backend is not open source. Each is listed in the [MCP Registry](https://registry.modelcontextprotocol.io) and serves Streamable HTTP.

- **[Atlassian Rovo MCP Server](https://github.com/atlassian/atlassian-mcp-server)** by Atlassian
  - Description: Atlassian's hosted MCP server for Jira, Confluence, Jira Service Management, Bitbucket, Compass, and Loom
  - Install: `claude mcp add --transport http atlassian https://mcp.atlassian.com/v2/mcp`, then authenticate with `/mcp`
  - Features: Search and summarize across Atlassian products, create and update work items and pages, respects each user's existing permissions
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `com.atlassian/atlassian-mcp-server`. Auth: OAuth 2.1 or API token. Pricing: calls that return enriched cross-product context use Rovo credits, which paid Atlassian Cloud plans include per user each month; extra usage is billed ([docs](https://support.atlassian.com/atlassian-ai-gateway/docs/get-started-with-the-atlassian-remote-mcp-server/), [credits](https://support.atlassian.com/rovo/docs/rovo-usage-limits/))

- **[Figma MCP Server](https://developers.figma.com/docs/figma-mcp-server/)** by Figma
  - Description: Brings Figma design context into coding agents that generate code from designs, and can write back to the canvas
  - Install: `claude plugin install figma@claude-plugins-official` (MCP server plus skills), or `claude mcp add --transport http figma https://mcp.figma.com/mcp`
  - Features: Design context, variables, components, Code Connect, code-to-canvas
  - Supports: Any MCP client (Streamable HTTP); a desktop server is also available for some paid plans
  - Note: Registry: `com.figma.mcp/mcp`. Auth: browser sign-in to your Figma account. Pricing: Starter plan and View/Collab seats get up to 20 tool calls a month; Dev and Full seats on paid plans get daily and per-minute limits ([rate limits](https://developers.figma.com/docs/figma-mcp-server/rate-limits-access/))

- **[Linear MCP Server](https://linear.app/docs/mcp)** by Linear
  - Description: Linear's hosted MCP server for finding, creating, and updating issues, projects, and comments
  - Install: `claude mcp add --transport http linear-server https://mcp.linear.app/mcp`, then run `/mcp` to sign in
  - Features: Read-write endpoint, plus `https://mcp.linear.app/mcp/readonly` for read-only access
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `app.linear/linear`. Auth: OAuth 2.1, or a Linear API key as a bearer token. Pricing: MCP access is included on every Linear plan, including Free ([pricing](https://linear.app/pricing))

- **[Notion MCP](https://developers.notion.com/guides/mcp/overview)** by Notion
  - Description: Notion's hosted MCP server for searching, reading, creating, and updating workspace pages and databases
  - Install: `claude mcp add --transport http notion https://mcp.notion.com/mcp`, then run `/mcp` to sign in
  - Features: Search Notion and connected sources, read and update content, create pages and databases
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `com.notion/mcp`. Auth: OAuth. Pricing: tools work on every plan; AI search, some filters, and meeting-notes queries need a Business or Enterprise plan with Notion AI ([supported tools](https://developers.notion.com/guides/mcp/mcp-supported-tools))

- **[Statsnet](https://github.com/usenetstate/statsnet-mcp)** by Statsnet
  - Description: Company background checks for Kazakhstan, Uzbekistan, Kyrgyzstan, Georgia, and Armenia (the tools also accept Tajikistan, Azerbaijan, and US states): registration, executives, government contracts, courts, and finances
  - Install: `claude mcp add --transport http statsnet https://statsnet.co/mcp` (add `--header "Authorization: Bearer <key>"` for paid tools)
  - Features: `search_companies` and `get_company` (public company card); contacts, full contracts, relations, and exports on paid plans
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `io.github.usenetstate/statsnet`. Auth: none for public tools; API key (Bearer) for extended data. Pricing: public tools are free with a limit on anonymous searches; extended tools need the Pro plan ([MCP docs, in Russian](https://statsnet.co/integrations/mcp.md), [pricing](https://statsnet.co/pricing.md))

- **[API Status Check](https://apistatuscheck.com/mcp)** by API Status Check
  - Description: Lets an agent find out whether a third-party API is actually down before it blames its own code: probes the vendor endpoint live and reads the vendor's own status page
  - Install: `claude mcp add --transport http apistatuscheck https://apistatuscheck.com/api/mcp`
  - Features: `get_api_status`, `list_down_apis`, `get_uptime_history`, `get_incident_history`, `rank_reliability`, and search/list tools
  - Supports: Any MCP client (Streamable HTTP; SSE-only clients cannot connect)
  - Note: Registry: `io.github.shibley/apistatuscheck`. Auth: none. Pricing: the MCP endpoint is free; optional email alerts (Alert Pro) are paid ([docs](https://apistatuscheck.com/mcp))

- **[CurlShot](https://curlshot.com/docs/guides/ai-agents)** by CurlShot
  - Description: Website screenshot API for agents: URL, HTML, or Markdown in; PNG, JPEG, WebP, PDF, or scrolling video out, rendered in a real browser
  - Install: `claude mcp add --transport http curlshot https://curlshot.com/api/mcp --header "Authorization: Bearer YOUR_ACCESS_KEY"`
  - Features: `take_screenshot` and `list_devices` tools, full-page capture, device presets, blocking of ads and cookie banners
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `io.github.SergiuPogor/curlshot`. Auth: access key (Bearer). Pricing: free plan with 100 screenshots a month and no card, paid plans from $19/month ([pricing](https://curlshot.com/pricing))

- **[looot](https://docs.looot.ai)** by looot
  - Description: One catalog of paid data APIs (people and company enrichment, work email finding and verification, web search, scraping) behind one account and one prepaid balance
  - Install: `claude mcp add --scope user --transport http looot https://api.looot.ai/mcp`, then `claude mcp login looot`
  - Features: Catalog search with prices shown before running, jobs with provider fallback, receipts, failed runs settle at $0
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `ai.looot/looot`. Auth: browser sign-in or a Bearer agent token. Pricing: prepaid balance, pay per call or per result, no subscription; catalog search tools are free ([pricing](https://docs.looot.ai/get-started/pricing-basics))

- **[DC Hub](https://dchub.cloud/connect)** by DC Hub
  - Description: Live data-center, power, grid, fiber, and deal data for data-center site selection, including the daily Data Center Power Index across 300+ markets
  - Install: `claude mcp add dchub --transport http https://dchub.cloud/mcp`
  - Features: Market, power and interconnection, energy price, fiber, and capacity-sourcing tools
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `cloud.dchub/mcp-server`. Auth: none for the free tier; optional API key header or OAuth sign-in. Pricing: free tier (anonymous previews; a free key adds 2 full answers per tool per day, or 50 calls a day with an email); numeric data beyond that needs a paid plan ([pricing](https://dchub.cloud/pricing))

- **[Invompt](https://invompt.com/docs)** by Invompt
  - Description: Drafts invoices, quotes, estimates, and pro formas from a conversation, so you review every document before it goes to a client
  - Install: `claude mcp add --transport http invompt https://mcp.invompt.com/mcp`, then `claude mcp login invompt`
  - Features: Revise a selected document, reuse saved clients and business settings, start as a guest; emailing invoices needs a registered account
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `com.invompt/invompt`. Auth: OAuth, including a guest option without an account. Pricing: free during prerelease; paid plans are not available yet ([terms](https://invompt.com/terms))

- **[Aident Loadout](https://docs.aident.ai/loadout/overview)** by Aident AI
  - Description: One reusable set of connected apps plus expert-built skills for coding and chat agents; credentials stay in Aident Vault and every action is logged in Audit
  - Install: In Claude Code, ask it to `Follow https://aident.ai/SETUP.md` (installs the Loadout CLI and skill); other MCP clients connect to `https://loadout.aident.ai/mcp`
  - Features: Action search with live schemas, Vault connection management, Audit receipts; also available as a CLI and an [agent skill](https://github.com/Aident-AI/aident-skill)
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `io.github.Aident-AI/loadout`. Auth: browser OAuth sign-in. Pricing: free to start, then credit top-ups or plan upgrades ([pricing](https://aident.ai/pricing))

- **[Xquik](https://docs.xquik.com/mcp/overview)** by Xquik
  - Description: X/Twitter data for agents: tweet search, profile lookups, monitors, and API exploration
  - Install: `claude mcp add --transport http xquik https://xquik.com/mcp`, then `claude mcp login xquik`
  - Features: `docs`, `search`, and `execute` tools; companion skill and plugin in [x-twitter-scraper](https://github.com/Xquik-dev/x-twitter-scraper)
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `com.xquik/mcp`. Auth: OAuth 2.1 or API key. Pricing: no free plan; paid credits via subscription, top-ups, or pay-per-use, and the docs and search tools use no credits ([billing](https://docs.xquik.com/guides/billing))

- **[CallMeMCP](https://callmemcp.com/)** by Serdar Oztetik
  - Description: Lets an agent call or text your own phone (iPhone or Android): it reads a question aloud, you answer out loud, and your spoken answer comes back as text
  - Install: `claude mcp add --transport http call-me https://callmemcp.com/mcp`
  - Features: `call`, `say`, `hang_up`, `poll_result`, `text`, `wait_for_reply`, `setup`; companion Claude Code plugin and skill in [radres/call-me](https://github.com/radres/call-me)
  - Supports: Any MCP client (Streamable HTTP)
  - Note: Registry: `com.callmemcp/call-me`. Auth: none, the tools take the 10-digit number shown under My Number in the /call-me app. Pricing: the app is a paid subscription, weekly $4.99 with a 3-day free trial or yearly $84.99, and there is no free plan ([App Store](https://apps.apple.com/app/call-me/id6789575165))

## 🧰 Agent Runtimes & Orchestration

### Runtimes & Orchestrators

- **[SandBase Harness](https://github.com/sandbaseai/sandbase-harness)** by SandBase AI - Local-first runtime for running agents with persistent sessions, sandbox backends, MCP tool governance, and audit trails
  - Install: Clone the repository, run `npm ci && npm run build`, then follow the [installation guide](https://github.com/sandbaseai/sandbase-harness/blob/main/llms-install.md)
  - Features: Approval-gated tool execution, local/Docker/Kubernetes/self-hosted workers, resumable sessions, artifacts, and a built-in Console

- **[YYLO](https://github.com/yylo-dev/yylo)** by yylo-dev - Command-line orchestrator for coding agents, repeatable workflows, and receipt-backed repository changes, with typed task, validation, merge, and release-readiness boundaries
  - Install: `npm install --global '@yylo/cli@latest'`
  - Features: Each task runs in a dedicated branch/worktree; the merge queue owns risk-based review; runs Pi and Codex subagents with receipt-backed changes

- **[rust-norion](https://github.com/yanghao1143/rust-norion)** by yanghao1143 - Rust research prototype of a reasoning control layer: model routing, memory gates, reflection, experience replay, and audited self-evolution gates
  - Install: Clone the repository and build with Cargo per the README (for example `cargo run -q -p norion-cli -- --help`)
  - Note: Not a production inference engine; documentation is in Chinese

### Memory & Observability

- **[Tree Ring Memory](https://github.com/TerminallyLazy/Tree-Ring-Memory)** by TerminallyLazy - Local-first memory lifecycle layer for agents: a Rust CLI (`tree-ring`) that stores decisions, lessons, and warnings in SQLite/FTS and compresses older memory over time
  - Install: `brew tap TerminallyLazy/tree-ring && brew install tree-ring` (macOS ARM64) or the release install script in the README; optional agent guidance plugin: `/plugin marketplace add TerminallyLazy/Tree-Ring-Memory`, then `/plugin install tree-ring-memory@tree-ring-memory`
  - Features: `tree-ring init` writes a portable `SKILL.md` and `AGENTS.md` guidance into the memory root; import/export, audit, consolidation, secret redaction, and a terminal UI

- **[agenttrace](https://github.com/luoyuctl/agenttrace)** by luoyuctl - Local-first TUI and reports for coding-agent session history: cost, tokens, time, failures, and slow-run diagnosis
  - Install: `brew install luoyuctl/tap/agenttrace` or `npm install -g @zack78/agenttrace` (see the README for the install script and Cargo)
  - Features: Reads Claude Code, Codex CLI, Qwen Code, Cline, Aider, Cursor exports, OpenCode, and generic JSON/JSONL traces; ranks sessions by cost, duration, health, failures, and anomalies

- **[OrcaReplay](https://github.com/Continuum-AI-Corp/OrcaReplay)** by Continuum AI - Record a coding agent's run, replay it byte-for-byte offline with no model call, and fork it from any step onto a different model
  - Install: `npm i -g orcareplay` (installs the `orca` command)
  - Features: `orca record claude`, offline replay, forking, and `orca mcp`, an MCP server (stdio) that lets an agent read, explain, and replay its own recorded runs

## 🛡️ Security

- **[Snyk Agent Scan](https://github.com/snyk/agent-scan)** by Snyk - Discovers agent components on a machine (agent configs, MCP servers, skills) and scans them for prompt injection and other vulnerabilities
  - Install: `uvx snyk-agent-scan@latest` (or `uvx snyk-agent-scan@latest ~/.claude/skills` for one directory)
  - Note: Requires a Snyk account and `SNYK_TOKEN`; CLI output format is experimental

- **[Skill Scanner](https://github.com/cisco-ai-defense/skill-scanner)** by Cisco AI Defense - Best-effort security scanner for Agent Skills that detects prompt injection, data exfiltration, and malicious code patterns using static, dataflow, and optional LLM analysis
  - Install: `uv tool install cisco-ai-skill-scanner`, then `skill-scanner scan /path/to/skill`
  - Features: SARIF output, GitHub Actions workflow, pre-commit hook; the companion [MCP Scanner](https://github.com/cisco-ai-defense/mcp-scanner) (`uv tool install --python 3.13 cisco-ai-mcp-scanner`) scans MCP servers, tools, prompts, and resources with YARA rules, LLM analysis, and the optional Cisco AI Defense API

## 📊 Evaluation & Benchmarks

- **[Terminal-Bench](https://www.tbench.ai/)** by Harbor - Benchmark of difficult terminal tasks for measuring agents, published as a continuously updated dataset with a public leaderboard
  - Install: `uv tool install harbor`, then `harbor run -d terminal-bench/terminal-bench@latest -a <agent> -m <model>`
  - Features: Runs through [Harbor](https://github.com/harbor-framework/harbor), a framework for evaluating agents such as Claude Code, Codex CLI, and OpenHands, building your own benchmarks, and running thousands of sandboxed environments in parallel; [tasks repository](https://github.com/harbor-framework/terminal-bench)

- **[SWE-Bench Pro](https://github.com/scaleapi/SWE-bench_Pro-os)** by Scale AI - Benchmark of long-horizon software engineering tasks: given a codebase and an issue, the agent must produce a patch that resolves it
  - Install: Clone the repository and run the V2 tasks with Harbor (`harbor run -p v2/tasks ...`); see the [V2 README](https://github.com/scaleapi/SWE-bench_Pro-os/tree/main/v2)
  - Features: Public tasks as Harbor task directories, a [public leaderboard](https://labs.scale.com/leaderboard/swe_bench_pro), and a separate private commercial leaderboard

- **[MCP-Atlas](https://github.com/scaleapi/mcp-atlas)** by Scale AI - Benchmark of tool-use competency with real MCP servers, run in a reproducible Docker sandbox and scored by an LLM judge
  - Features: [Paper](https://arxiv.org/abs/2602.00933), [leaderboard](https://labs.scale.com/leaderboard/mcp_atlas), and [dataset](https://huggingface.co/datasets/ScaleAI/MCP-Atlas)

- **[ClawBench](https://github.com/TIGER-AI-Lab/ClawBench)** by TIGER-AI-Lab - Live-web benchmark for browser agents on everyday online tasks (booking travel, ordering food, applying for jobs) across real websites
  - Install: `uv tool install clawbench-eval`, then `clawbench`
  - Features: Isolated Docker runs, selectable agent harnesses, request interception, and replayable action, screenshot, recording, HTTP, and agent-message evidence; [paper](https://arxiv.org/abs/2604.08523) and [project](https://claw-bench.com)

## 🛠️ Developer Resources

- **[MCP SDKs](https://modelcontextprotocol.io/docs/sdk)** by MCP - Official SDKs for building MCP servers and clients, including [TypeScript](https://github.com/modelcontextprotocol/typescript-sdk) and [Python](https://github.com/modelcontextprotocol/python-sdk)

- **[FastMCP](https://github.com/PrefectHQ/fastmcp)** by Prefect - Python framework for building MCP servers and clients
  - Install: `uv add fastmcp`

- **[MCP Inspector](https://github.com/modelcontextprotocol/inspector)** by MCP - Developer tool for testing and debugging MCP servers, with web UI, CLI, and TUI modes
  - Install: `npx @modelcontextprotocol/inspector` (add `--cli` or `--tui`)

- **[MCP Registry](https://registry.modelcontextprotocol.io)** by MCP - Official registry and API of published MCP servers; publishers must prove control of their namespace (a GitHub account or a domain)
  - Features: [Source and publishing guide](https://github.com/modelcontextprotocol/registry)

## 🗂️ Community Directories

- **[awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers)** by punkpeye - Large, actively maintained directory of production-ready and experimental MCP servers

- **[awesome-mcp-servers](https://github.com/wong2/awesome-mcp-servers)** by wong2 - Long-standing curated MCP server list; new submissions go through [mcpservers.org](https://mcpservers.org/submit)

- **[Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code)** by hesreallyhim - Hand-picked skills, agents, status lines, plugins, and developer tooling for Claude Code
  - License: CC BY-NC-ND 4.0

- **[Awesome Agent Skills](https://github.com/VoltAgent/awesome-agent-skills)** by VoltAgent - Curated list of real-world Agent Skills from engineering teams, with install paths for Claude Code, Codex, Cursor, Gemini CLI, and more

- **[Agent Skill Index](https://github.com/heilcheng/awesome-agent-skills)** by heilcheng - Community-curated list of agent skills for Claude, Codex, Copilot, and other assistants, also browsable at [agent-skill.co](https://agent-skill.co)

- **[Awesome Claude](https://awesomeclaude.ai/)** - Directory of Claude resources, tools, and integrations

- **[awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules)** by PatrickJS - Collection of Cursor Project Rules (`.mdc` files for `.cursor/rules/`)
  - Note: Cursor reads project rules from `.cursor/rules/*.mdc` and also supports plain `AGENTS.md` files; see the [Cursor rules docs](https://cursor.com/docs/rules)

## 📚 Learning Resources

### Official Documentation

- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills)
- [Claude Code Plugins Documentation](https://code.claude.com/docs/en/plugins)
- [Agent Skills Specification](https://agentskills.io/specification) - The open SKILL.md format, originally developed by Anthropic
- [MCP Specification](https://modelcontextprotocol.io/specification/latest)
- [Codex Skills Documentation](https://learn.chatgpt.com/docs/build-skills)
- [Cursor Agent Documentation](https://cursor.com/docs)

### Tutorials and Guides

- [Building MCP Servers](https://modelcontextprotocol.io/docs/develop/build-server)
- [MCP Best Practices](https://modelcontextprotocol.info/docs/best-practices/) - Community site, not the official MCP documentation
- [Composio MCP Development Guide](https://composio.dev/content/mcp-server-step-by-step-guide-to-building-from-scrtch)
- [Claude Academy](https://academy.claude.com/) - Free courses and tutorials from Anthropic's education team

## 🤝 Contributing

Found a tool that meets the inclusion criteria? See [CONTRIBUTING.md](./CONTRIBUTING.md) for the entry templates, then submit one entry per pull request and state whether you are affiliated with the project.

---

**Last Updated**: 2026-10-20
