# Cross-Platform Setup Guide

This repository is designed to work across multiple agent runtimes. The core idea is the same everywhere:

- A **Skill** is a folder containing a `SKILL.md` file (and optionally `README.md`, `scripts/`, `references/`, `assets/`).
- An **MCP server** is a separately runnable process that exposes tools via the Model Context Protocol.

## Claude Code

### Install a skill from GitHub

```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### Install a skill locally

```bash
cp -r skills/codex-cli ~/.claude/skills/
```

Restart Claude Code after copying new skills.

## Codex

Codex supports `SKILL.md` skills and can load them from your Codex skills directory.

```bash
cp -r skills/codex-cli ~/.codex/skills/
```

Restart Codex after copying new skills.

## Cursor

Cursor can use skills via MCP servers or other agent integrations depending on your setup.

If you are using an MCP workflow, configure your MCP server in Cursor’s MCP settings, then restart Cursor.

## MCP Servers (General)

MCP servers run as standalone processes (Node, Python, etc.). Clients connect to them using stdin/stdout (JSON-RPC 2.0) or other supported transports.

Typical setup steps:

1. Build or install the server (per its README).
2. Configure your client with the server `command` and `args`.
3. Restart the client.
4. Verify tools appear and can be invoked.

## Troubleshooting

- Skill not loading: confirm `SKILL.md` exists and YAML frontmatter is valid.
- Changes not picked up: restart the client after editing files.
- Script failures: run scripts directly from a terminal first to validate dependencies and permissions.
- MCP issues: check server logs and validate JSON-RPC framing/format.

