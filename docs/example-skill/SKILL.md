---
name: example-skill
description: This is an example skill demonstrating the correct SKILL.md format. Use this as a reference when users want to learn how to create skills. Contains all required and recommended sections.
---

# Example Skill

This is an example skill demonstrating the correct SKILL.md format and best practices.

## Features

This skill demonstrates how to:
- Write a properly formatted SKILL.md file
- Organize skill directory structure
- Add scripts and reference materials
- Provide clear documentation and examples

## When to Use

Use this skill in the following scenarios:
- You want to create a new Claude Code skill
- You need to understand the correct SKILL.md format
- You want to reference skill directory structure

## Core Components

### SKILL.md Format

```yaml
---
name: skill-name
description: Detailed description including usage scenarios
---
```

### Directory Structure

```
skill-name/
├── SKILL.md           # Required
├── README.md          # Recommended
├── scripts/           # Optional
│   └── helper.py
├── references/        # Optional
│   └── docs.md
└── assets/           # Optional
    └── template.json
```

## Usage Examples

### Example 1: Create Basic Skill

```bash
mkdir my-skill
cd my-skill
touch SKILL.md
```

Add to SKILL.md:
```yaml
---
name: my-skill
description: My skill description
---

# My Skill

[Add detailed explanation...]
```

### Example 2: Add Scripts

```bash
mkdir scripts
# Add your Python or JavaScript scripts
```

### Example 3: Add Reference Materials

```bash
mkdir references
# Add API docs, configuration examples, etc.
```

## Best Practices

1. **Clear Description** - Clearly state usage scenarios in frontmatter
2. **Structured Content** - Organize content with headings and lists
3. **Concrete Examples** - Provide executable code examples
4. **Reference Materials** - Place detailed documentation in references/ directory
5. **Reusable Scripts** - Place code in scripts/ directory

## Limitations

- This skill serves only as an example and reference
- Does not provide actual functionality implementation
- Needs to be modified according to specific requirements

## Reference Resources

See the `references/` directory for:
- [Skill Development Guide](references/skill-development-guide.md)
- [Format Specification](references/format-spec.md)

## Next Steps

1. Copy this skill as a template
2. Modify name and description
3. Add your actual functionality
4. Test and verify
5. Share with the community!

---

Creator: Awesome Agent Tools
License: MIT
