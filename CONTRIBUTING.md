# Contributing Guide 🤝

Thank you for your interest in **Awesome Agent Tools**! We welcome contributions of all kinds from the community.

## Ways to Contribute

### 1. Add Your Original Skill

Have you created a useful skill? We'd love to include it!

**Steps**:
1. Fork this repository
2. Create a new directory under `skills/` (use kebab-case: `my-awesome-skill`)
3. Add the required `SKILL.md` file
4. (Optional) Add `README.md`, `scripts/`, `references/`, `assets/`
5. Submit a Pull Request

**Skill Format Requirements**:

Your `SKILL.md` must include YAML frontmatter:

```yaml
---
name: skill-name
description: Detailed description including what problem it solves and when to use it
---

# Skill Name

## Overview

[Explain what the skill does]

## Usage

[Usage examples and instructions]

## Examples

[Concrete usage examples]
```

**Naming Conventions**:
- Use lowercase letters and hyphens (kebab-case)
- Names should be concise and descriptive
- Examples: `pdf-processor`, `code-reviewer`, `api-tester`

### 2. Recommend Third-Party Skills/Tools

Found an amazing skill or MCP server? Share it with us!

**Steps**:
1. Fork this repository
2. Edit `AWESOME.md`
3. Add your recommendation under the appropriate category
4. Submit a Pull Request

**Recommendation Format**:

```markdown
- **[tool-name](https://github.com/author/repo)** by author-name
  - Description: Brief description of what it does
  - Install: `claude skill add https://...`
  - Features: Key features list
```

**Recommendation Criteria**:
- ✅ Open source license (MIT, Apache 2.0, BSD, etc.)
- ✅ Clear documentation
- ✅ Active maintenance (updated within last 6 months)
- ✅ High quality and reliability

### 3. Contribute MCP Servers

Built an MCP server? Add it to the `mcp-servers/` directory!

**Steps**:
1. Fork this repository
2. Create a subdirectory under `mcp-servers/`
3. Add your MCP server code
4. Include a `README.md` with installation and usage instructions
5. Submit a Pull Request

**MCP Server Requirements**:
- Follows the [MCP specification](https://modelcontextprotocol.io/specification)
- Includes clear installation and configuration instructions
- Provides usage examples
- Handles errors gracefully

### 4. Improve Documentation

Found a typo or unclear instruction? Help us improve!

**Documentation Files**:
- `README.md` - Main English documentation
- `docs/README_CN.md` - Chinese documentation
- `AWESOME.md` - Curated list of tools
- `CONTRIBUTING.md` - This file

## Pull Request Guidelines

### PR Checklist

Before submitting your PR, ensure:

- [ ] I have read the contribution guidelines
- [ ] My content follows the format specifications
- [ ] Documentation is clear and complete
- [ ] SKILL.md includes complete frontmatter (if applicable)
- [ ] Links are valid and point to correct resources (if applicable)
- [ ] Commit messages clearly describe changes

### PR Template

When submitting a PR, please include:

```markdown
## Type of Contribution
- [ ] Add new skill
- [ ] Recommend third-party tool
- [ ] Add MCP server
- [ ] Improve documentation
- [ ] Bug fix
- [ ] Other

## Description
[Clearly describe what this adds or changes]

## Testing
[Explain how you tested these changes]

## Screenshots (if applicable)
[Add screenshots to help explain your changes]
```

## Skill Development Best Practices

### SKILL.md Structure

A well-written SKILL.md should include:

1. **Clear Description** - Explain when to use this skill
2. **Overview** - What the skill does in detail
3. **Usage Instructions** - How to use the skill
4. **Examples** - Concrete usage examples
5. **Limitations** - Known limitations (if any)

### Directory Structure

```
skills/my-skill/
├── SKILL.md           # Required
├── README.md          # Recommended - additional documentation
├── scripts/           # Optional - executable scripts
│   └── helper.py
├── references/        # Optional - reference documentation
│   └── api-docs.md
└── assets/           # Optional - resource files
    └── template.json
```

### Testing Your Skill

**Local Testing for Claude Code**:
```bash
# Copy to local skills directory
cp -r skills/my-skill ~/.claude/skills/

# Restart Claude Code
# Test the skill with various inputs
```

**Local Testing for Codex**:
```bash
# Copy to Codex skills directory
cp -r skills/my-skill ~/.codex/skills/

# Restart Codex
# Test the skill
```

## Code Standards

- Use clear variable and function names
- Add appropriate comments
- Keep code simple and readable
- Handle error cases properly
- Follow language-specific best practices

## Quality Standards

All contributions must meet these minimum criteria:

### For Skills

- ✅ Valid SKILL.md with complete frontmatter
- ✅ Clear description including usage scenarios
- ✅ At least 2 usage examples
- ✅ README.md explaining the skill's purpose
- ✅ License file (MIT recommended)

### For MCP Servers

- ✅ Valid server.json following MCP spec
- ✅ Works with latest Claude Code/MCP clients
- ✅ Installation instructions
- ✅ Security considerations documented
- ✅ Error handling implemented

### For Recommendations

- ✅ Open source license (MIT, Apache 2.0, BSD, GPL)
- ✅ Public GitHub/GitLab repository
- ✅ Active maintenance (commit within 6 months)
- ✅ Minimum 10 GitHub stars OR vouched by maintainer
- ✅ No known security vulnerabilities
- ✅ Passes basic quality checks

## Getting Help

Need assistance? Here's how to get help:

- **Questions**: Open a [Discussion](https://github.com/Awakehsh/awesome-agent-tools/discussions)
- **Bugs**: Create an [Issue](https://github.com/Awakehsh/awesome-agent-tools/issues)
- **Documentation**: Check [README.md](./README.md) and [CLAUDE.md](./CLAUDE.md)
- **Examples**: Look at example skill documentation in `docs/example-skill/`

## Code of Conduct

We are committed to providing a friendly, safe, and welcoming environment:

- ✅ Be respectful of differing viewpoints and experiences
- ✅ Accept constructive criticism gracefully
- ✅ Focus on what's best for the community
- ✅ Show empathy towards other community members
- ❌ No harassment, trolling, or insulting behavior
- ❌ No publishing others' private information
- ❌ No inappropriate sexual attention or advances

## License

By contributing, you agree that your contributions will be licensed under the same [MIT License](./LICENSE) that covers this project.

Third-party recommended content maintains its original licenses.

---

## Quick Start for New Contributors

1. **Fork** the repository
2. **Clone** your fork: `git clone https://github.com/YOUR-USERNAME/awesome-agent-tools`
3. **Create a branch**: `git checkout -b my-contribution`
4. **Make your changes**
5. **Test** your changes
6. **Commit**: `git commit -m "Add: brief description"`
7. **Push**: `git push origin my-contribution`
8. **Open a Pull Request** on GitHub

---

Thank you for contributing! 🎉

Your contributions help make AI agents more powerful and accessible to everyone.
