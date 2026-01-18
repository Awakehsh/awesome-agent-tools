# SKILL.md Format Specification

This document describes the minimum structure expected for a `SKILL.md` file.

## File Layout

1. YAML frontmatter (required)
2. Markdown content (required)

## YAML Frontmatter

At minimum, include:

```yaml
---
name: skill-name
description: |
  Explain when to use this skill.
  Include trigger conditions and typical scenarios.
---
```

### Required Fields

- `name`: Unique, lowercase identifier (use hyphens for separators).
- `description`: Clear usage scenarios and trigger conditions.

### Optional Fields (Common)

```yaml
license: MIT
version: 1.0.0
author: Your Name
```

## Markdown Content

Use headings and lists to keep the skill readable and scannable. Recommended sections:

- `## When to Use`
- `## Workflow`
- `## Examples`
- `## Limitations`

