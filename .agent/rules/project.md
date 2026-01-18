---
trigger: always_on
---

# Awesome Agent Tools

This repository contains a curated collection of Skills, MCP servers, and powerful tools for AI agents.

## Project Structure

- `skills/` - Original skills built for this repository
- `mcp-servers/` - Original MCP servers
- `docs/` - Documentation including Chinese translations
- `AWESOME.md` - Curated list of third-party tools and resources

## Key Guidelines

### When Working on This Project

1. **Skills Development**
   - Follow the SKILL.md format with YAML frontmatter
   - Include clear descriptions with usage scenarios
   - Add examples and documentation in the skill's README.md
   - Test skills before committing

2. **Documentation**
   - Keep README.md (English) and docs/README_CN.md (Chinese) in sync
   - Update AWESOME.md when discovering great tools
   - Maintain CONTRIBUTING.md with clear contribution guidelines

3. **Cross-Platform Compatibility**
   - Ensure skills work with Claude Code (recommended), Codex, and Cursor
   - Test MCP servers across platforms when possible
   - Document any platform-specific requirements

4. **Quality Standards**
   - Only recommend high-quality, well-maintained tools
   - Verify licenses before including third-party content
   - Keep descriptions accurate and up-to-date

## Repository Philosophy

**Inclusive, Not Exclusive**: While named "agent tools", this collection includes resources for:
- Software development
- Content creation and documentation
- Research and analysis
- Workflow automation
- Design and creative work
- And much more

**Cross-Platform First**: All tools should work across multiple AI platforms, with Claude Code being the recommended platform due to its excellent skill management and MCP support.

**Community-Driven**: We welcome contributions from the community while maintaining high quality standards.

## Language Policy

**CRITICAL**: This repository uses English as the primary language for all documentation and code.

### Language Rules

**English-Only Files** (Default):
- ✅ `README.md` - Main documentation (English)
- ✅ `CONTRIBUTING.md` - Contribution guidelines (English)
- ✅ `AWESOME.md` - Curated list (English)
- ✅ `CLAUDE.md` - Project guidelines (English)
- ✅ All skills in `skills/` directory - SKILL.md, README.md, code comments, etc. (English)
- ✅ All MCP servers in `mcp-servers/` directory (English)
- ✅ All reference documentation in `references/` directories (English)
- ✅ All code comments and documentation strings (English)
- ✅ Commit messages (English)
- ✅ Issue discussions and PR descriptions (English)

**Chinese Translation** (Exception):
- ✅ `docs/README_CN.md` - Chinese translation of README.md ONLY

**Why English?**
- Wider international reach and accessibility
- Industry standard for technical documentation
- Easier for global contributors to participate
- Better integration with international tools and communities

**When Creating New Content**:
1. Write in English first
2. If needed, add Chinese translation to `docs/README_CN.md` (for main README only)
3. Never mix languages in a single file
4. Use clear, simple English for better comprehension

**If You Find Chinese Content** (Except docs/README_CN.md):
- Translate it to English immediately
- Update the file
- Commit with message: "docs: Translate [filename] to English"

## Working with Skills

### Adding a New Skill (Workflow)

When adding a new skill to the repository, follow this checklist:

**1. Create the skill structure:**
```bash
# Create skill directory
mkdir -p skills/my-skill/{scripts,references,assets}

# Create SKILL.md with frontmatter
cat > skills/my-skill/SKILL.md << 'EOF'
---
name: my-skill
description: Clear description including when to use this skill
---

# My Skill

[Your skill content...]
EOF

# Add README.md with installation and usage instructions
# Add any scripts, references, or assets
```

**2. Test the skill locally:**
```bash
# For Claude Code
cp -r skills/my-skill ~/.claude/skills/
# Restart Claude Code and test

# For Codex
cp -r skills/my-skill ~/.codex/skills/
# Restart Codex and test
```

**3. Update documentation (REQUIRED):**
- [ ] Update **README.md** - Add the skill to "Original Skills" section
- [ ] Update **docs/README_CN.md** - Add the skill to "原创Skills" section (Chinese)
- [ ] Update **AWESOME.md** if it's a third-party recommendation
- [ ] Ensure both English and Chinese docs are in sync

**4. Commit and push:**
```bash
git add skills/my-skill README.md docs/README_CN.md
git commit -m "feat: Add my-skill for [purpose]"
git push origin main
```

### Testing Skills Locally

```bash
# For Claude Code
cp -r skills/my-skill ~/.claude/skills/
# Restart Claude Code and test

# For Codex
cp -r skills/my-skill ~/.codex/skills/
# Restart Codex and test

# For Cursor
# Import via GitHub URL or configure as MCP server
```

## Working with MCP Servers

### Adding a New MCP Server (Workflow)

When adding a new MCP server to the repository, follow this checklist:

**1. Create the MCP server:**
```bash
# Create MCP server directory
mkdir -p mcp-servers/my-server

# Implement following MCP specification
# https://modelcontextprotocol.io/
```

**2. Key implementation points:**
- Implement proper JSON-RPC 2.0 communication
- Include clear configuration examples
- Document all tools, resources, and prompts
- Test with multiple MCP clients (Claude Code, Codex, Cursor)

**3. Update documentation (REQUIRED):**
- [ ] Update **README.md** - Add the MCP server to "Original MCP Servers" section
- [ ] Update **docs/README_CN.md** - Add to "原创MCP服务器" section (Chinese)
- [ ] Add installation instructions to the server's README.md
- [ ] Ensure both English and Chinese docs are in sync

**4. Test configuration:**
```json
// Example: ~/.claude/claude_desktop_config.json
{
  "mcpServers": {
    "my-server": {
      "command": "node",
      "args": ["/path/to/mcp-servers/my-server/build/index.js"]
    }
  }
}
```

**5. Commit and push:**
```bash
git add mcp-servers/my-server README.md docs/README_CN.md
git commit -m "feat: Add my-server MCP server for [purpose]"
git push origin main
```

## Maintenance Tasks

### Regular Updates

- [ ] Review and update AWESOME.md with new discoveries
- [ ] Check for broken links in documentation
- [ ] Update dependencies in MCP servers
- [ ] Test skills with latest Claude Code releases
- [ ] Sync English and Chinese documentation

### Community Management

- [ ] Review and respond to issues
- [ ] Review pull requests for quality
- [ ] Update contribution guidelines as needed
- [ ] Maintain friendly and helpful community atmosphere

## Documentation Synchronization Rules

**CRITICAL**: English and Chinese documentation must always be kept in sync.

### When updating README.md:
1. ✅ Make changes to README.md (English)
2. ✅ Immediately update docs/README_CN.md (Chinese) with corresponding changes
3. ✅ Ensure both versions have the same structure and content
4. ✅ Commit both files together

### When adding new skills/MCP servers:
1. ✅ Add to README.md "Original Skills" or "Original MCP Servers" section
2. ✅ Add to docs/README_CN.md "原创Skills" or "原创MCP服务器" section
3. ✅ Keep descriptions consistent (translated appropriately)

### When updating AWESOME.md:
1. ✅ Add new recommendations to AWESOME.md
2. ✅ Ensure descriptions are clear and accurate
3. ✅ Include installation instructions

### When updating CONTRIBUTING.md:
1. ✅ CONTRIBUTING.md is English-only (no Chinese version needed)
2. ✅ Keep guidelines clear and actionable

**Verification**: Before pushing, always check:
```bash
# Ensure both files were modified together
git diff README.md docs/README_CN.md
```

## Important Reminders

- **Never commit secrets** or API keys
- **Attribute properly** when referencing third-party work
- **Test before pushing** to main branch
- **Keep documentation synchronized** - English and Chinese must match
- **Update both README files** when adding new content
- **Be welcoming** to new contributors

## Resources

### Official Documentation
- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills)
- [Claude Code Plugins Documentation](https://code.claude.com/docs/en/plugins)
- [MCP Specification](https://modelcontextprotocol.io/specification)
- [Codex Skills Guide](https://developers.openai.com/codex/skills/)
- [Cursor Agent Documentation](https://cursor.com/docs)

### Community Resources
- [Awesome Claude](https://awesomeclaude.ai/) - Comprehensive directory of Claude AI resources, tools, SDKs, MCP servers, and integrations
- [Awesome MCP Servers](https://github.com/wong2/awesome-mcp-servers) - Curated list of MCP servers (79,000+ stars)
- [Awesome Agent Skills](https://github.com/heilcheng/awesome-agent-skills) - Large collection of AI coding assistant skills
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers) - Official MCP server implementations

### Learning & Tutorials
- [Building MCP Servers](https://modelcontextprotocol.io/docs/develop/build-server)
- [MCP Best Practices](https://modelcontextprotocol.info/docs/best-practices/)
- [Composio MCP Development Guide](https://composio.dev/blog/mcp-server-step-by-step-guide-to-building-from-scrtch)

---

**Repository**: https://github.com/Awakehsh/awesome-agent-tools
**License**: MIT
