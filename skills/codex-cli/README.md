# codex-cli Skill

Enable Claude Code to leverage OpenAI Codex CLI for plan review, code review, and complex problem discussions.

## Why Use This Skill? 🎯

**The Problem**:
Blindly letting AI write code often results in low success rates. Complex tasks require thorough analysis before implementation.

**The Solution**:
Combine Claude's speed with Codex's comprehensive reasoning:
- ✅ **Plan Review**: Review implementation plans BEFORE coding
- ✅ **Code Review**: Deep code analysis with thorough feedback
- ✅ **Complex Questions**: Technical discussions requiring deep reasoning
- ✅ **Multi-Round**: Iterative improvement up to 3 rounds

**The Philosophy**:
> In vibe coding, doing plan or review is very important. While Claude Code is fast with multi-agent design, Codex (especially GPT-5.x models) provides thorough analysis. Combining both leads to higher quality outcomes.

## Prerequisites ⚠️ (Required!)

You MUST complete these setup steps before using this skill:

### 1. Install Codex CLI

```bash
# Check if installed
which codex
codex --version
```

If not installed, refer to OpenAI Codex CLI documentation for installation instructions.

### 2. Get OpenAI API Key

- Visit https://platform.openai.com/api-keys
- Create a new API key
- Save it securely

### 3. Login Configuration

```bash
echo "YOUR_OPENAI_API_KEY" | codex login --with-api-key

# Verify login status
codex login status
# Should display: "Logged in using an API key - sk-proj-***"
```

### 4. Confirm Account Has Credits

- Visit https://platform.openai.com/account/billing
- Ensure you have available credits for API usage

## Installation

### For Claude Code (Recommended)

```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### For Codex

```bash
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### Manual Installation

```bash
# Clone to your skills directory
git clone https://github.com/Awakehsh/awesome-agent-tools.git
cp -r awesome-agent-tools/skills/codex-cli ~/.claude/skills/
```

## Quick Start

### Most Common Commands

```bash
# Quick question (medium reasoning)
/codex-cli ask "your question"

# Review implementation plan (high reasoning)
/codex-cli reviewplan

# Review uncommitted code changes
/codex-cli review --uncommitted

# Review changes vs main branch
/codex-cli review --base main
```

### With Custom Model

```bash
# Use code-optimized model
/codex-cli --model gpt-5.2-codex reviewplan

# Use reasoning model for complex questions
/codex-cli --model o3 ask "complex architecture question"
```

## Use Cases

### 1. Plan Review Before Coding

```bash
# After creating an implementation plan in Claude Code
/codex-cli reviewplan

# Codex will review:
# - Technical feasibility
# - Potential risks
# - Missing considerations
# - Returns: APPROVED or NEEDS REVISION
```

**Workflow**:
1. Claude creates implementation plan
2. Use `/codex-cli reviewplan` to get Codex feedback
3. Iterate based on feedback (up to 3 rounds)
4. Implement with confidence after approval

### 2. Code Review

```bash
# Review code you just wrote (uncommitted)
/codex-cli review --uncommitted

# Compare with specific branch
/codex-cli review --base develop
```

**Benefits**:
- Catch issues before committing
- Get thorough analysis of changes
- Learn from detailed feedback

### 3. Complex Technical Discussions

```bash
# Architecture decisions
/codex-cli ask "Should I use microservices or monolith for..."

# Performance optimization
/codex-cli ask "How to optimize this database query..."

# Security considerations
/codex-cli ask "What security concerns should I address for..."
```

## Command Reference

| Command | Description | Reasoning Level |
|---------|-------------|----------------|
| `ask "question"` | Quick question | medium |
| `reviewplan` | Review implementation plan | high |
| `review --uncommitted` | Review uncommitted changes | high |
| `review --base <branch>` | Review vs specific branch | high |

**Options:**
- `--model <name>` - Specify model (default: gpt-5.2)
- `--reasoning <level>` - Reasoning effort (medium/high/xhigh)

## Available Models

| Model | When to Use |
|-------|-------------|
| `gpt-5.2` | Default, general tasks |
| `gpt-5.2-codex` | Code-optimized tasks |
| `gpt-5.1-codex-max` | Complex migrations |
| `o3`, `o4-mini` | Reasoning tasks |

**Note**: Model availability may change. Check [OpenAI Models Documentation](https://platform.openai.com/docs/models) for latest information.

## Troubleshooting

### Common Errors

**Error: "command not found: codex"**
```bash
# Solution: Install Codex CLI
which codex  # Should return path like /opt/homebrew/bin/codex
```

**Error: "Authentication required"**
```bash
# Solution: Login with API key
echo "YOUR_KEY" | codex login --with-api-key
codex login status  # Verify
```

**Error: "Permission denied"**
- This skill requires Bash execution
- Cannot run in background/Task mode
- Approve Bash execution when prompted by Claude Code

**Error: "model 'xxx' does not exist"**
```bash
# Solution: Use default model
/codex-cli ask "question"  # Will use gpt-5.2
```

### Verify Setup

```bash
# Check installation
which codex && codex --version

# Check login status
codex login status

# Test basic functionality
codex exec "test" -m gpt-5.2 --skip-git-repo-check
```

## How It Works

```
User in Claude Code: /codex-cli reviewplan
    ↓
Skill executes Bash: codex exec "Review this plan..." -m gpt-5.2
    ↓
Codex CLI calls OpenAI API for reasoning
    ↓
Returns: APPROVED / NEEDS REVISION
    ↓
Multi-round iteration (max 3 rounds if NEEDS REVISION)
```

**Key Points**:
- Executes in main session (requires Bash approval)
- Uses OpenAI API (consumes credits)
- Provides detailed feedback with reasoning
- Supports iterative improvement

## Output Format

After each Codex interaction, you'll see:

```
=== CODEX FEEDBACK [Round 1/3] ===
Model: gpt-5.2
Reasoning: high
Status: NEEDS REVISION

[Codex's detailed feedback and recommendations...]

=== END CODEX FEEDBACK ===
```

**Status Values**:
- `APPROVED` - Plan/code looks good, ready to proceed
- `NEEDS REVISION` - Issues found, review and iterate

## Advanced Usage

### Multi-Round Iterations

- Automatically continues up to 3 rounds
- Each round incorporates previous feedback
- Stops when approved or max rounds reached

### Long Plans (>2000 chars)

- Send executive summary first
- Provide details when Codex requests
- Max 4000 chars per submission

### Custom Reasoning Levels

```bash
# Critical tasks requiring maximum analysis
/codex-cli --reasoning xhigh reviewplan

# Quick questions with standard reasoning
/codex-cli --reasoning medium ask "..."
```

## Contributing

Found a bug or have suggestions? Please open an issue at:
https://github.com/Awakehsh/awesome-agent-tools/issues

## License

MIT License - see [LICENSE](../../LICENSE)

## References

- [OpenAI Models Documentation](https://platform.openai.com/docs/models) - Latest model list
- [OpenAI API Documentation](https://platform.openai.com/docs) - API usage and best practices
- [Codex CLI Documentation](https://docs.openai.com/codex-cli) - Codex CLI reference

---

**Created by**: [Awesome Agent Tools](https://github.com/Awakehsh/awesome-agent-tools)

**Philosophy**: Combining Claude's speed with Codex's depth for higher quality outcomes in vibe coding.
