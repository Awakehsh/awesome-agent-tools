# Building Your First Skill

This tutorial walks you through creating a minimal, high-quality skill.

## 1) Create the folder structure

```bash
mkdir -p skills/my-first-skill/{scripts,references,assets}
```

## 2) Create `SKILL.md`

Create `skills/my-first-skill/SKILL.md`:

```markdown
---
name: my-first-skill
description: |
  Use when you want a repeatable workflow for <your use case>.
  Includes steps, constraints, and examples so the agent can act consistently.
---

# My First Skill

## When to Use

- When you need <scenario A>
- When you need <scenario B>

## Workflow

1. Do X
2. Do Y
3. Validate Z

## Examples

- “<example prompt 1>”
- “<example prompt 2>”

## Limitations

- What this skill will not do
```

## 3) Add a `README.md` (recommended)

Add `skills/my-first-skill/README.md` with installation instructions and extra detail that doesn’t need to be in `SKILL.md`.

## 4) Add scripts (optional)

Put reusable code in `skills/my-first-skill/scripts/` and make sure it can run standalone.

## 5) Test locally

### Claude Code

```bash
cp -r skills/my-first-skill ~/.claude/skills/
```

Restart Claude Code and try prompts that match your skill description.

### Codex

```bash
cp -r skills/my-first-skill ~/.codex/skills/
```

Restart Codex and try the same prompts.

