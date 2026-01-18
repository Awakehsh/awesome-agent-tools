# Example Skill

This is an example skill that demonstrates how to create a well-structured skill for Claude Code (and other agents that support `SKILL.md`).

## Installation

### Claude Code
```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/example-skill
```

### Codex
```bash
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/example-skill
```

### Manual Install
```bash
# Clone into your local skills directory
cd ~/.claude/skills
git clone https://github.com/Awakehsh/awesome-agent-tools
ln -s awesome-agent-tools/skills/example-skill example-skill
```

## What This Demonstrates

- ✅ A correct `SKILL.md` structure (YAML frontmatter + Markdown content)
- ✅ A recommended directory layout for skills
- ✅ A reusable template you can copy and modify
- ✅ Reference documentation and a small example script

## How to Use

1. **As a reference**: read `SKILL.md` to understand the format.
2. **As a template**: copy this folder and replace name/description/examples.
3. **As a learning aid**: review how docs, scripts, and references are organized.

## Directory Structure

```
example-skill/
├── SKILL.md                # Skill definition
├── README.md               # This file
├── scripts/                # Example scripts
│   └── example.py
└── references/             # Reference docs
    ├── skill-development-guide.md
    └── format-spec.md
```

## File Notes

- `SKILL.md`: The core skill definition file (required).
- `README.md`: Extra documentation for humans (recommended).
- `scripts/`: Executable scripts (optional).
- `references/`: Longer-form documentation and specs (optional).

## Contributing

Improvements are welcome. If you have better recommendations or find issues, please open a PR.

## License

MIT License
