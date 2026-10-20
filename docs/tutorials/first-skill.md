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

`name` must match the folder name and use only lowercase letters, numbers, and hyphens. See the [Agent Skills specification](https://agentskills.io/specification) for all fields.

## 3) Add a `README.md` (recommended)

Add `skills/my-first-skill/README.md` with installation instructions and extra detail that doesn’t need to be in `SKILL.md`.

## 4) Add scripts (optional)

Put reusable code in `skills/my-first-skill/scripts/` and make sure it can run standalone.

## 5) Test locally

### Claude Code

```bash
mkdir -p ~/.claude/skills
cp -r skills/my-first-skill ~/.claude/skills/
```

Claude Code picks up the new skill in the running session. Try prompts that match your skill description.

### Codex

```bash
mkdir -p ~/.agents/skills
cp -r skills/my-first-skill ~/.agents/skills/
```

Codex detects new skills automatically (restart Codex if it doesn't appear). Try the same prompts.

For other agents' skill folders, see the [Cross-Platform Guide](../CROSS_PLATFORM.md).

