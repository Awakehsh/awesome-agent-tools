# Tree Ring Memory Skill

Lifecycle-aware memory guidance for AI agents using
[Tree Ring Memory](https://github.com/TerminallyLazy/Tree-Ring-Memory).

## What It Does

Tree Ring Memory helps agents use local project memory without turning memory
into raw transcript storage. It gives agents a repeatable policy for:

- recalling project-scoped lessons before risky work
- writing concise decisions, warnings, preferences, and evidence
- keeping explicit boundaries around privacy and sensitive data
- auditing, forgetting, redacting, and superseding stale memory
- using DOX/Revolve adapters with source-linked dry runs

The runtime is a Rust CLI with SQLite/FTS storage, recall, audit, forgetting,
deterministic consolidation, JSONL import/export, framework discovery, and a
Ratatui terminal console.

## Install

### Claude Code

```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/tree-ring-memory
```

### Codex

Run this inside Codex CLI chat after this repository is available:

```text
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/tree-ring-memory
```

Then restart Codex so the skill is loaded.

### Tree Ring CLI

Install the backing CLI with Homebrew:

```bash
brew tap TerminallyLazy/tree-ring
brew install tree-ring
```

or with the project installer:

```bash
curl -fsSL https://raw.githubusercontent.com/TerminallyLazy/Tree-Ring-Memory/main/install.sh | sh
```

## Example Agent Workflows

### Recall before a risky change

```bash
tree-ring recall "release changes" --scope project
```

Use recalled lessons as context, then verify against source files, tests, and
current project docs.

### Store a concise project lesson

```bash
tree-ring remember "Run project-scoped recall before release changes." --event-type lesson --scope project
```

### Record evaluated evidence

```bash
tree-ring evidence \
  --outcome observed \
  --summary "Installer smoke test passed in an isolated HOME." \
  --evidence-ref "ci/install-smoke/2026-07-07"
```

### Audit and forget

```bash
tree-ring audit --stale-after-days 60
tree-ring forget --help
```

## When To Use

Use this skill when an agent needs to:

- resume a project with memory
- preserve durable project decisions
- avoid repeating a known failed approach
- remember an explicit user preference
- track an evaluated outcome
- keep local-first memory privacy-safe
- summarize rather than store transcripts

## Boundaries

Tree Ring Memory is protocol-preview software. Agents should inspect local
`tree-ring --help`, `.tree-ring/SKILL.md`, and `.tree-ring/CLI.md` when present
instead of assuming every project has the same command surface.

Do not use this skill to store secrets, raw chain-of-thought, hidden transcript
captures, or sensitive personal data without explicit user direction.

## Links

- Project: <https://github.com/TerminallyLazy/Tree-Ring-Memory>
- Website: <https://terminallylazy.github.io/Tree-Ring-Memory/>
- Press kit: <https://terminallylazy.github.io/Tree-Ring-Memory/press-kit.md>
