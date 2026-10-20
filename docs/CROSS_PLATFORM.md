# Cross-Platform Setup Guide

The skills in this repository (`codex-cli`, `context-architect`, `learn`) use the open [Agent Skills](https://agentskills.io) format, so any compatible agent can load them:

- A **skill** is a folder containing a `SKILL.md` file: YAML frontmatter with `name` and `description`, then Markdown instructions. It can also bundle `scripts/`, `references/`, and `assets/`. See the [specification](https://agentskills.io/specification).
- The **tech-scout agent** (`agents/tech-scout.md`) and the **handoff command** (`commands/handoff.md`) are Claude Code subagent and command files.
- An **MCP server** is a separately runnable process that exposes tools via the Model Context Protocol.

## Install Options

### Claude Code plugin (everything)

```bash
# In a Claude Code session
/plugin marketplace add Awakehsh/awesome-agent-tools
/plugin install awesome-agent-tools@awesome-agent-tools

# Or from your shell
claude plugin marketplace add Awakehsh/awesome-agent-tools
claude plugin install awesome-agent-tools@awesome-agent-tools
```

How this differs from installing skills directly:

- One install brings the three skills, the tech-scout agent, and the handoff command.
- Components are namespaced by the plugin name: `/awesome-agent-tools:codex-cli`, `/awesome-agent-tools:handoff`, and so on. A skill copied into `~/.claude/skills/` is invoked without a prefix, for example `/learn`.
- Update with `claude plugin update awesome-agent-tools@awesome-agent-tools`, or from the **Installed** tab in `/plugin`.

See [Install and manage plugins](https://code.claude.com/docs/en/discover-plugins) for scopes and team setup.

### skills CLI (one skill, any agent)

The [skills CLI](https://github.com/vercel-labs/skills) (Node.js 22.20 or later) installs skills from a GitHub repository into the agent you choose:

```bash
# List the skills in this repository
npx skills add Awakehsh/awesome-agent-tools --list

# Install one skill into the current project
npx skills add Awakehsh/awesome-agent-tools --skill learn

# Install for your user, for a specific agent
npx skills add Awakehsh/awesome-agent-tools --skill learn -g -a codex
```

Agent IDs include `claude-code`, `codex`, `cursor`, `github-copilot`, and `antigravity`; see the CLI's [supported agents](https://github.com/vercel-labs/skills/blob/main/docs/agents.md).

### Manual copy

```bash
git clone https://github.com/Awakehsh/awesome-agent-tools
mkdir -p <skills-folder>
cp -R awesome-agent-tools/skills/learn <skills-folder>/
```

Replace `<skills-folder>` with a path from the table below.

## Where Each Agent Looks for Skills

| Agent | Project skills | User skills | Docs |
|-------|----------------|-------------|------|
| Claude Code | `.claude/skills/` | `~/.claude/skills/` | [Skills](https://code.claude.com/docs/en/skills) |
| Codex | `.agents/skills/` (from the working directory up to the repository root) | `~/.agents/skills/` | [Build skills](https://learn.chatgpt.com/docs/build-skills) |
| Cursor | `.agents/skills/`, `.cursor/skills/` | `~/.agents/skills/`, `~/.cursor/skills/` | [Agent Skills](https://cursor.com/docs/skills) |
| GitHub Copilot | `.github/skills/`, `.claude/skills/`, `.agents/skills/` | `~/.copilot/skills/`, `~/.agents/skills/` | [About agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) |
| Antigravity (App, IDE) | `.agents/skills/` | `~/.gemini/config/skills/` | [Agent skills](https://antigravity.google/docs/skills) |
| Antigravity CLI | `.agents/skills/` | `~/.gemini/antigravity-cli/skills/` | [Agent skills](https://antigravity.google/docs/skills) |
| Devin Desktop (formerly Windsurf) | `.devin/skills/`, `.agents/skills/` | `~/.config/devin/skills/`, `~/.codeium/windsurf/skills/`, `~/.agents/skills/` | [Skills](https://docs.devin.ai/desktop/cascade/skills) |

More compatible agents are listed in the [Agent Skills client showcase](https://agentskills.io/clients).

## Platform Notes

### Claude Code

- Claude Code picks up new and edited skills under `~/.claude/skills/` and `.claude/skills/` in the running session.
- Install the agent or command without the plugin:

  ```bash
  mkdir -p ~/.claude/agents ~/.claude/commands
  cp agents/tech-scout.md ~/.claude/agents/
  cp commands/handoff.md ~/.claude/commands/
  ```

### Codex

- In a Codex session (not your shell), `$skill-installer` installs a curated skill by name or a skill from a GitHub URL:

  ```text
  $skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn
  ```

- Run `/skills` or type `$` to see and mention installed skills.
- Codex follows symlinked skill folders, so you can link a clone and update it with `git pull`:

  ```bash
  git clone https://github.com/Awakehsh/awesome-agent-tools ~/awesome-agent-tools
  mkdir -p ~/.agents/skills
  for d in ~/awesome-agent-tools/skills/*; do ln -s "$d" ~/.agents/skills/; done
  ```

- Codex detects new skills automatically; restart Codex if one doesn't appear.

### Cursor

Cursor also reads `.claude/skills/`, `.codex/skills/`, `~/.claude/skills/`, and `~/.codex/skills/`, so skills installed for Claude Code show up in Cursor too.

### GitHub Copilot

Agent skills work with Copilot cloud agent, Copilot code review, the Copilot CLI, the GitHub Copilot app, and agent mode in VS Code and JetBrains IDEs.

### Antigravity

Antigravity CLI succeeds Gemini CLI, which stopped serving Google AI Pro, Ultra, and free users on June 18, 2026; see [Transitioning Gemini CLI to Antigravity CLI](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigravity-cli/) and the [migration guide](https://antigravity.google/docs/gcli-migration). Antigravity still reads the older `.agent/skills/` folder for backward compatibility.

### Devin Desktop (formerly Windsurf)

`.windsurf/skills/` is still read as a legacy project folder. Devin Desktop scans `.claude/skills/` and `~/.claude/skills/` only if you enable Claude Code config reading.

## MCP Servers (General)

MCP servers run as standalone processes (Node, Python, etc.). Clients connect to them using stdin/stdout (JSON-RPC 2.0) or other supported transports.

Typical setup steps:

1. Build or install the server (per its README).
2. Configure your client with the server `command` and `args`.
3. Restart the client.
4. Verify tools appear and can be invoked.

## Troubleshooting

- Skill not loading: confirm `SKILL.md` exists, the YAML frontmatter is valid, and `name` matches the folder name.
- Changes not picked up: restart the client after editing files.
- Script failures: run scripts directly from a terminal first to validate dependencies and permissions.
- MCP issues: check server logs and validate JSON-RPC framing/format.
