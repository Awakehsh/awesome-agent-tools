---
name: tree-ring-memory
description: Lifecycle-aware memory guidance for AI agents using Tree Ring Memory. Use when agents need local-first recall, explicit memory writes, audit, forgetting, evidence records, or project-scoped durable lessons without transcript dumping.
---

# Tree Ring Memory

Tree Ring Memory is a framework-agnostic, local-first memory lifecycle layer for
AI agents. Use this skill when an agent should preserve useful decisions,
warnings, preferences, evidence, or future follow-ups without keeping raw
conversation transcripts.

The public runtime is a Rust CLI with SQLite/FTS storage, recall, audit,
forgetting, deterministic consolidation, JSONL import/export, DOX/Revolve source
adapters, framework discovery, and a Ratatui terminal console.

## When To Use

Use Tree Ring Memory before:

- starting or resuming work in a project with existing memory
- making architecture, privacy, security, release, or storage decisions
- repeating a workflow where prior mistakes may matter
- responding to a user correction or durable preference
- closing meaningful work and deciding what should help future agents

Use it after:

- a decision is validated by tests, review, or production behavior
- a failed approach should not be repeated
- a useful project convention is discovered
- the user explicitly says something should be remembered
- an evaluated outcome should become evidence, a warning, or a future seed

## Memory Model

Tree Ring Memory treats memory as something that ages:

- `cambium`: active or recent task context
- `outer`: recent project lessons and decisions
- `inner`: older compressed project knowledge
- `heartwood`: durable high-confidence truths
- `scar`: important failures, regressions, rejected approaches, and warnings
- `seed`: unresolved hypotheses and future work

Prefer concise memories. Store the lesson, decision, warning, or evidence
summary, not the full conversation.

## Install Or Discover

If Tree Ring Memory is already initialized in the project, read:

```bash
.tree-ring/SKILL.md
.tree-ring/CLI.md
```

If the CLI is not installed, use one of the public install paths:

```bash
brew tap TerminallyLazy/tree-ring
brew install tree-ring
```

or:

```bash
curl -fsSL https://raw.githubusercontent.com/TerminallyLazy/Tree-Ring-Memory/main/install.sh | sh
```

Project repository:

```text
https://github.com/TerminallyLazy/Tree-Ring-Memory
```

## Core Commands

Inspect the local CLI first because preview commands can evolve:

```bash
tree-ring --help
tree-ring init --help
tree-ring remember --help
tree-ring recall --help
tree-ring evidence --help
tree-ring audit --help
tree-ring forget --help
tree-ring maintain --help
```

Typical local workflow:

```bash
tree-ring init
tree-ring remember "Use project-scoped recall before risky release changes." --event-type lesson --scope project
tree-ring recall "release changes"
tree-ring audit --stale-after-days 60
```

Use source adapters with dry runs first:

```bash
tree-ring dox sync --source-root . --dry-run
tree-ring revolve sync --source-root revolve --dry-run
tree-ring integrations scan --source-root .
```

Only write adapter summaries when they are concise, useful, and source-linked.
Memory does not replace the source `AGENTS.md`, Revolve record, evaluation,
issue, PR, or test artifact.

## Evidence Records

Use `tree-ring evidence` instead of a plain memory when the lesson comes from:

- tests or benchmarks
- release validation
- an incident or rollback
- an evaluation run
- reviewed branch, PR, issue, or run artifact

Outcome mapping:

- `promoted`: durable heartwood from strong evidence
- `rejected`: scar for reusable failed or rolled-back approaches
- `deferred`: seed for promising unresolved options
- `observed`: outer-ring evaluation result

Do not promote weak or unreviewed claims to `heartwood`.

## Privacy And Safety

Tree Ring Memory should not be used as a hidden recorder.

Do not store:

- secrets, credentials, tokens, or private keys
- raw chain-of-thought or private scratchpad content
- temporary notes with no future value
- unverified claims as durable truth
- sensitive personal data unless the user explicitly asks and the summary is
  safe to retain
- copyrighted source text beyond short allowed snippets

If a useful memory contains sensitive details, store a redacted summary with the
minimum context needed for future work.

## Closeout Habit

At the end of meaningful work, ask:

- What did we decide?
- What did we learn?
- What should future agents avoid repeating?
- Did the user state a durable preference?
- Is there a future seed worth revisiting?
- Is any memory sensitive and better left unstored?

Only write memories that will materially improve future work.
