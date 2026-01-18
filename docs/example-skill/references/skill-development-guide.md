# Skill Development Guide

This guide explains how to create high-quality Claude Code skills.

## Basic Concepts

### What is a Skill?

A Skill is a package containing instructions, workflows, and optional resources that helps Claude better complete specific tasks.

### Skill Components

1. **SKILL.md** (Required) - Core definition file
2. **scripts/** (Optional) - Executable code
3. **references/** (Optional) - Reference documentation
4. **assets/** (Optional) - Resource files

## SKILL.md Format

### YAML Frontmatter

```yaml
---
name: skill-name              # Required: unique identifier
description: |                # Required: detailed description
  Description of when to use this skill.
  Should clearly describe trigger conditions and usage scenarios.
license: MIT                  # Optional: license
version: 1.0.0               # Optional: version number
author: Your Name            # Optional: author
---
```

### Markdown Content

```markdown
# Skill Title

## Features
[Detailed explanation of what the skill does]

## Usage
[How to use the skill]

## Examples
[Concrete examples]

## Limitations
[Explanation of limitations]
```

## Best Practices

### 1. Clear Description

The description should answer:
- When to use this skill?
- What problem does it solve?
- What scenarios is it suitable for?

**Good Example**:
```yaml
description: |
  Use when processing PDF files (extract text, convert images, fill forms).
  Suitable for document processing, data extraction, form automation, etc.
```

**Bad Example**:
```yaml
description: A PDF tool
```

### 2. Modular Design

Split complex logic into:
- **SKILL.md**: Workflow and guidance
- **scripts/**: Concrete implementation
- **references/**: Detailed documentation

### 3. Provide Examples

Include at least 2-3 practical usage examples showing:
- Basic usage
- Common scenarios
- Edge cases

### 4. Error Handling

Implement good error handling in scripts:
```python
try:
    # Main logic
    result = process_data(input)
    return {"status": "success", "data": result}
except Exception as e:
    return {"status": "error", "message": str(e)}
```

### 5. Documentation Completeness

Ensure it includes:
- [ ] Clear feature description
- [ ] Usage instructions
- [ ] Practical examples
- [ ] Limitation explanation
- [ ] Installation guide (README.md)

## Directory Structure Examples

### Simple Skill

```
simple-skill/
└── SKILL.md
```

### Medium Skill

```
medium-skill/
├── SKILL.md
├── README.md
└── scripts/
    ├── helper.py
    └── utils.js
```

### Complex Skill

```
complex-skill/
├── SKILL.md
├── README.md
├── scripts/
│   ├── main.py
│   ├── helper.py
│   └── config.json
├── references/
│   ├── api-docs.md
│   ├── examples.md
│   └── troubleshooting.md
└── assets/
    ├── templates/
    │   └── default.json
    └── schemas/
        └── input-schema.json
```

## Testing Skills

### Local Testing

```bash
# 1. Copy to skills directory
cp -r your-skill ~/.claude/skills/

# 2. Restart Claude Code
# Claude will automatically load the new skill

# 3. Test triggering
# Try using requests that match the description
```

### Verification Checklist

- [ ] SKILL.md contains complete frontmatter
- [ ] Description clearly describes usage scenarios
- [ ] Contains at least one usage example
- [ ] Scripts can run independently (if present)
- [ ] Documentation is complete and easy to understand
- [ ] No hardcoded paths or credentials

## Publishing Skills

### 1. GitHub Release

```bash
git add .
git commit -m "Add new skill: skill-name"
git push origin main
```

### 2. Add to Marketplace

Ensure repo contains `.claude-plugin/marketplace.json`

### 3. Community Sharing

- Submit to awesome lists
- Share on Discord/forums
- Write blog posts introducing it

## Common Questions

### Q: How large should a skill be?

**A**: Keep SKILL.md under 5000 words, place detailed content in references/.

### Q: When to use scripts/?

**A**: When there's reusable computational logic, need to call external APIs, or process complex data.

### Q: How to handle sensitive information?

**A**:
- Don't hardcode in code
- Use environment variables
- Document configuration requirements

### Q: Can skills call other skills?

**A**: Yes, but document the dependencies.

## Advanced Topics

### Performance Optimization

- Avoid including large amounts of data in SKILL.md
- Use references/ to store large documents
- Scripts should respond quickly

### Security Considerations

- Validate input
- Avoid executing arbitrary code
- Limit filesystem access
- Clearly state permission requirements

### Version Management

Use semantic versioning:
- MAJOR: Incompatible changes
- MINOR: Backward-compatible features
- PATCH: Backward-compatible fixes

## Reference Resources

- [Claude Code Documentation](https://code.claude.com/docs/en/skills)
- [Official Skills Repository](https://github.com/anthropics/skills)
- [Community Examples](https://github.com/heilcheng/awesome-agent-skills)
