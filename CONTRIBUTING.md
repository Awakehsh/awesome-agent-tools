# Contributing Guide 🤝

Thank you for your interest in **Awesome Agent Tools**! There are two ways to contribute:

- **Suggest a third-party tool** for the curated list in [AWESOME.md](./AWESOME.md).
- **Improve this repository's own tools and docs**: the original skills in `skills/`, the agent in `agents/`, the command in `commands/`, and the documentation.

## Inclusion Criteria

AWESOME.md lists tools that meet these criteria:

1. **Open-source projects** (skills, MCP servers, CLIs, collections)
   - Public repository
   - License stated. OSI-approved is preferred; a non-OSI or source-available license must be named in the entry (for example, `License: PolyForm Noncommercial`)
   - At least 10 GitHub stars
   - At least one commit in the last 6 months
   - Clear install and usage docs
2. **Hosted MCP services** (a remote endpoint whose backend is not open source; a connector or listing-only repository does not count as open source)
   - Listed in the [official MCP Registry](https://registry.modelcontextprotocol.io) under a verified namespace (GitHub- or domain-based, for example `io.github.owner/server-name`)
   - Serves the [Streamable HTTP](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports/streamable-http) transport
   - Public docs page covering authentication and pricing
   - Listed in the separate **Hosted MCP Services** section; the entry states authentication and pricing (free tier or not)
3. **Official vendor tools** (published by the company that owns the product) follow rule 1 or 2, depending on whether the source is public.
4. **Affiliation is disclosed.** Every submission states whether the submitter is affiliated with the project. Submitting your own tool is fine, as long as you say so.
5. **Directories, documentation, and learning resources** (community directories, official docs, tutorials): publicly accessible, actively maintained, and focused on building with AI agents. Official documentation is preferred over third-party summaries.
6. **Removal.** An entry is removed when its link is dead, its repository is archived, it has had no commits for 12 months, or it no longer meets these criteria.

## Suggest a Tool

1. Check that the tool meets the criteria above and is not already listed.
2. Add **one entry per pull request** to [AWESOME.md](./AWESOME.md), in the section that fits best.
3. Use the matching template below. The install command must be real and copy-pasteable: run it yourself before submitting. Use the tool's documented installer, such as `npx skills add`, `/plugin install`, or `claude mcp add`.
4. State your affiliation in the pull request description.

Prefer not to open a pull request? Use the **Suggest a tool** [issue form](https://github.com/Awakehsh/awesome-agent-tools/issues/new/choose) instead.

Entries are reviewed by hand and may be edited or declined.

### MCP Server Entry

```markdown
- **[server-name](https://github.com/owner/repo)** by owner
  - Description: What it does, in one sentence
  - Install: `claude mcp add server-name -- npx -y package-name`
  - Features: Key capabilities, comma-separated
  - Supports: Clients it works with
  - Note: Optional. Caveats such as required API keys or platform limits
```

For a hosted MCP service, the Install line uses the remote endpoint, and the Note gives the registry name, authentication, and pricing:

```markdown
- **[Service Name](https://docs.example.com/mcp)** by company
  - Description: What it does, in one sentence
  - Install: `claude mcp add --transport http service-name https://mcp.example.com/mcp`
  - Features: Key capabilities, comma-separated
  - Supports: Clients it works with
  - Note: Registry: `com.example/service-name`. Auth: OAuth. Pricing: free tier, then paid plans ([docs](https://docs.example.com/pricing))
```

Keep endpoint URLs inside code spans (backticks) as shown; they are not web pages.

### Skill, Plugin, or Collection Entry

```markdown
- **[name](https://github.com/owner/repo)** by owner - One-line description
  - Install: `npx skills add owner/repo --skill name`
```

If there is no one-line install command, link to the project's install instructions instead. Add a `License: ...` line when the license is not OSI-approved.

## Original Tools

Everything in `skills/`, `agents/`, and `commands/` ships in the plugin to every user who installs it. These directories hold only tools written and maintained in this repository. Third-party skills are listed in AWESOME.md, not copied into `skills/`.

### Adding or Changing a Skill

```
skills/my-skill/
├── SKILL.md           # Required
├── README.md          # Recommended: install and usage for humans
├── scripts/           # Optional: executable scripts
├── references/        # Optional: reference documentation
└── assets/            # Optional: templates and other resources
```

`SKILL.md` starts with YAML frontmatter:

```yaml
---
name: my-skill
description: What the skill does and when to use it. Agents read this to decide when to load the skill.
---
```

- `name`: lowercase letters, numbers, and hyphens; must match the directory name (see the [Agent Skills specification](https://agentskills.io/specification)).
- `description`: say what the skill does **and when to use it**.

See [docs/example-skill/](./docs/example-skill/) for a complete example.

### Testing Your Changes

```bash
# Validate the marketplace, plugin manifest, and components (CI runs this too)
claude plugin validate .

# Load the plugin from your checkout for one session
claude --plugin-dir .
```

Plugin components are namespaced, for example `/awesome-agent-tools:codex-cli`. To try a single skill on its own, copy it to `~/.claude/skills/my-skill/` instead.

### Documentation

When you add, rename, or remove an original tool, update [README.md](./README.md) and [docs/README_CN.md](./docs/README_CN.md) in the same pull request. The two files must keep identical structure. `docs/README_CN.md` is the only Chinese file; everything else is in English.

## Pull Request Guidelines

- One logical change per pull request; one tool per pull request for AWESOME.md entries.
- Fill in the pull request template, including the affiliation section.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), as in the existing history: `docs: add server-name to MCP Servers`, `feat: ...`, `fix: ...`.
- CI validates the plugin and checks Markdown links. Fix any failures your change introduces.

## Getting Help

- **Questions, bugs, and suggestions**: open an [issue](https://github.com/Awakehsh/awesome-agent-tools/issues)
- **Documentation**: see [README.md](./README.md)

## Code of Conduct

We are committed to providing a friendly, safe, and welcoming environment:

- ✅ Be respectful of differing viewpoints and experiences
- ✅ Accept constructive criticism gracefully
- ✅ Focus on what's best for the community
- ✅ Show empathy towards other community members
- ❌ No harassment, trolling, or insulting behavior
- ❌ No publishing others' private information
- ❌ No inappropriate sexual attention or advances

## License

By contributing, you agree that your contributions will be licensed under the same [MIT License](./LICENSE) that covers this project.

Third-party recommended content maintains its original licenses.

---

## Quick Start for New Contributors

1. **Fork** the repository
2. **Clone** your fork: `git clone https://github.com/YOUR-USERNAME/awesome-agent-tools`
3. **Create a branch**: `git checkout -b my-contribution`
4. **Make your changes**
5. **Test** your changes
6. **Commit**: `git commit -m "docs: add tool-name to AWESOME.md"`
7. **Push**: `git push origin my-contribution`
8. **Open a Pull Request** on GitHub

---

Thank you for contributing! 🎉

Your contributions help make AI agents more powerful and accessible to everyone.
