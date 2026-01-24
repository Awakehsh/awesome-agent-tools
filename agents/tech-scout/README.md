# Tech Scout Agent

Technical research specialist that searches industry solutions, design patterns, and bug fixes from GitHub and web sources.

## Purpose

Tech Scout is a Claude Code agent designed to run in parallel during development workflows, providing quick, structured research results when you need to:

- **Plan features** - Search industry architecture patterns and design approaches
- **Debug issues** - Find solutions for errors, bugs, and common problems
- **Compare technologies** - Research pros/cons of libraries, frameworks, and tools

## Key Features

- **Parallel execution** - Runs independently without blocking main workflow
- **Structured output** - Consistent format with comparison tables and recommendations
- **Multiple sources** - Searches both GitHub and general web
- **Quick turnaround** - Focused on decision-making, not deep research

## Installation

### User-level (Available in all projects)

```bash
# Copy to user-level agents directory
cp -r agents/tech-scout ~/.claude/agents/

# Or use symbolic link
ln -s $(pwd)/agents/tech-scout ~/.claude/agents/tech-scout

# Restart Claude Code
```

### Project-level (Current project only)

```bash
# Copy to project agents directory
mkdir -p .claude/agents
cp -r agents/tech-scout .claude/agents/

# Restart Claude Code
```

### Via GitHub (Recommended)

```bash
# Clone this repository
git clone https://github.com/Awakehsh/awesome-agent-tools.git

# Copy tech-scout to your agents directory
cp -r awesome-agent-tools/agents/tech-scout ~/.claude/agents/

# Restart Claude Code
```

## Usage

### Manual Invocation

Explicitly request tech-scout in your prompts:

```
Use tech-scout to research how industry implements rate limiting
```

```
Use tech-scout to search solutions for "ECONNREFUSED" error
```

```
Use tech-scout to compare React vs Vue for our new dashboard
```

### Automatic Delegation

Claude Code will automatically delegate to tech-scout when appropriate:

```
Help me design an authentication system
→ Claude may automatically invoke tech-scout to research auth patterns
```

```
I'm getting a "Module not found" error
→ Claude may invoke tech-scout to search for solutions
```

### Parallel Execution

Run multiple research tasks in parallel:

```
Research these topics in parallel:
- Authentication patterns
- Database schema design
- API rate limiting strategies

Use tech-scout for all three
```

## Output Format

Tech Scout returns structured reports:

```markdown
## Summary
[2-3 sentences describing key findings]

## Comparison
| Approach | Pros | Cons | Use Case |
|----------|------|------|----------|
| ...      | ...  | ...  | ...      |

## Recommendation
[Suggested approach with reasoning]

## Sources
- [Title](URL) - Brief description
- [Title](URL) - Brief description
```

## Example Session

**Input:**
```
Use tech-scout to research how to implement websocket authentication
```

**Output:**
```markdown
## Summary
WebSocket authentication in 2025-2026 primarily uses three approaches:
token-based (JWT), session-based, and OAuth2. Industry leaders like
Slack and Discord use JWT tokens passed during handshake for stateless
authentication.

## Comparison
| Approach | Pros | Cons | Use Case |
|----------|------|------|----------|
| JWT in handshake | Stateless, scalable, simple | Token exposure in URLs | Real-time apps, microservices |
| Session cookies | Familiar, secure | Requires sticky sessions | Traditional web apps |
| OAuth2 flow | Enterprise-ready | Complex setup | Multi-tenant SaaS |

## Recommendation
Use JWT tokens passed via query parameter during WebSocket handshake
for most modern applications. Implement short-lived tokens (15-30 min)
with refresh mechanism. This approach is used by Slack, Discord, and
most real-time platforms.

## Sources
- [WebSocket Authentication Guide - Auth0](https://auth0.com/...) - Comprehensive patterns
- [socket.io Authentication](https://socket.io/docs/...) - Implementation examples
- [JWT WebSocket Security Best Practices](https://example.com/...) - Security considerations
```

## Configuration

Tech Scout uses these tools (defined in frontmatter):

```yaml
tools: WebSearch, WebFetch
model: sonnet
```

**Model Options:**
- `sonnet` (default) - Balanced speed and quality
- `haiku` - Faster, lower cost for simple queries
- `opus` - Deeper analysis for complex topics

To modify, edit `tech-scout.md` frontmatter.

## Best Practices

### When to Use Tech Scout

✅ **Good use cases:**
- Researching architecture patterns before planning
- Finding solutions to specific errors
- Comparing libraries/frameworks
- Understanding industry best practices

❌ **Not ideal for:**
- Deep technical research (use main agent)
- Reading specific documentation (use WebFetch directly)
- Codebase-specific questions (use Explore agent)

### Optimization Tips

1. **Be specific in prompts:**
   - ✅ "Research JWT vs session auth for REST APIs"
   - ❌ "Tell me about authentication"

2. **Combine with other workflows:**
   - Use during `brainstorming` skill for design research
   - Use during `systematic-debugging` for error solutions
   - Use during `writing-plans` for architecture reference

3. **Parallel research:**
   - Request multiple independent topics simultaneously
   - Each runs in separate context (no pollution)
   - Results compile faster than sequential research

## Troubleshooting

**Agent not being invoked?**
- Check agent is installed: `ls ~/.claude/agents/tech-scout/`
- Restart Claude Code
- Try explicit invocation: "Use tech-scout to..."

**Getting generic results?**
- Be more specific in your research request
- Include context about your use case
- Mention specific technologies or constraints

**Want different output format?**
- Edit `tech-scout.md` "Output Format" section
- Customize the table structure or sections
- Restart Claude Code to apply changes

## Technical Details

**Files:**
- `tech-scout.md` - Agent definition with YAML frontmatter and system prompt

**Tools:**
- `WebSearch` - Primary search tool for finding resources
- `WebFetch` - Secondary tool for fetching page details

**Model:**
- Default: `sonnet` (claude-sonnet-4-5)
- Configurable via frontmatter

## Contributing

Found an issue or have suggestions? Please contribute:

1. Test the agent with your use case
2. Share feedback via GitHub Issues
3. Submit improvements via Pull Request

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](../../LICENSE) for details.

## Related Resources

**Other Agents:**
- `Explore` - Built-in agent for codebase exploration
- `Plan` - Built-in agent for implementation planning

**Skills:**
- `brainstorming` - Feature design with research integration
- `systematic-debugging` - Debugging workflow with solution search
- `writing-plans` - Implementation planning with architecture research

**Documentation:**
- [Custom Subagents - Claude Code Docs](https://code.claude.com/docs/en/sub-agents)
- [Agent Best Practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [This Repository's Agent Guide](../README.md)
