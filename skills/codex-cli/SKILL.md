---
name: codex-cli
description: "Interact with OpenAI Codex CLI for plan review, code review, and complex problem discussion. Supports model selection and multi-round conversations. Usage: /codex-cli <command> [options]"
---

# Codex CLI Interaction Skill

Interact with OpenAI Codex CLI to leverage its powerful reasoning capabilities for plan review, code analysis, and complex problem discussions.

> **⚠️ Naming Clarification**:
> - **"codex-cli" Skill** = This AI agent skill (current document)
> - **Codex CLI** = The OpenAI command-line tool being invoked (the program)
> - **gpt-X-codex** = Model name suffix (e.g., gpt-5.2-codex) indicating code-optimized variants
>
> Throughout this document, "Codex CLI" refers to the command-line tool being called.

## ⚠️ Prerequisites (Required!)

**You MUST have these installed before using this skill:**

1. **Codex CLI** - The OpenAI Codex command-line tool
   ```bash
   # Check if installed
   which codex
   codex --version
   ```

2. **OpenAI API Key** - Required for authentication

   **Option A: Interactive login (Recommended - most secure)**
   ```bash
   # Interactive prompt - API key won't appear in shell history
   codex login
   # Follow the prompts to enter your API key
   ```

   **Option B: Environment variable**
   ```bash
   # Add to ~/.zshrc or ~/.bashrc (not in shell history)
   export OPENAI_API_KEY="your-api-key-here"
   source ~/.zshrc

   # Then login
   codex login --with-api-key <<< "$OPENAI_API_KEY"
   ```

   **Option C: File-based (if interactive not available)**
   ```bash
   # Create a temporary file with your key
   echo "your-api-key" > /tmp/key.txt
   codex login --with-api-key < /tmp/key.txt
   rm /tmp/key.txt

   # Or pipe directly (⚠️ key appears in shell history)
   echo "YOUR_KEY" | codex login --with-api-key
   ```

   **Verify login:**
   ```bash
   codex login status
   # Should show: "Logged in using an API key - sk-proj-***"
   ```

3. **Active API Access** - Your OpenAI account must have API access and credits

4. **Security Best Practices**

   ```bash
   # Secure your config file (contains API key reference)
   chmod 600 ~/.codex/config.toml

   # Clear shell history if you used echo with API key
   history -c  # or close and reopen terminal
   ```

**If not installed:**
- Get OpenAI API key from: https://platform.openai.com/api-keys
- Install Codex CLI: Refer to OpenAI Codex CLI documentation
- Alternative: This skill will NOT work without Codex CLI installed and configured

## 🔒 Security & Privacy Notice

**Important considerations when using this skill:**

1. **Code Transmission**: When you use Codex CLI, your code/prompts are sent to OpenAI servers for processing
2. **API Key Storage**: Your API key is stored in `~/.codex/config.toml` - ensure proper file permissions
3. **Sandbox Mode**: By default, this skill uses `--sandbox read-only` which prevents Codex from modifying files
4. **Shell History**: Avoid typing API keys directly in commands; use interactive login or environment variables
5. **Sensitive Code**: Be mindful when reviewing code containing secrets, credentials, or proprietary logic

**Recommendation**: Review OpenAI's [data usage policies](https://openai.com/policies/api-data-usage-policies) for API usage

## Quick Start

**Most common commands:**
```bash
/codex-cli ask "your question"                    # Quick questions (medium reasoning)
/codex-cli reviewplan                             # Review implementation plans (high reasoning)
/codex-cli review --uncommitted                   # Review uncommitted changes
/codex-cli review --base main                     # Review changes vs branch
```

**With custom model:**
```bash
/codex-cli --model gpt-5.2-codex reviewplan       # Use code-optimized variant
/codex-cli --model o3 ask "complex question"      # Use reasoning model
```

**Default behavior:**
- Model: `gpt-5.2` (unless you specify --model)
- Reasoning: `medium` for short questions, `high` for everything else

**Convenience shortcuts:**
```bash
# These are equivalent:
/codex-cli ask "question"
/codex-cli "question"                     # Shorter form

# For code-heavy tasks, add --coding flag idea:
/codex-cli --model gpt-5.2-codex reviewplan
```

## Help & Troubleshooting

### Common Errors & Solutions

**Error: "command not found: codex"**
```bash
# Codex CLI is not installed
# Solution: Install Codex CLI first (see Prerequisites above)
which codex  # Should return path like /opt/homebrew/bin/codex
```

**Error: "Authentication required" or "API key not found"**
```bash
# Not logged in with OpenAI API key
# Solution: Login with your API key (use interactive method for security)
codex login  # Interactive - recommended
# Or: codex login --with-api-key <<< "$OPENAI_API_KEY"
codex login status  # Verify you're logged in
```

**Error: "model 'xxx' does not exist"**
```bash
# The model name changed or doesn't exist
# Solution: Use default gpt-5.2
/codex-cli ask "question"  # Will auto-use gpt-5.2
```

**Error: "Specify --uncommitted, --base, or --commit"**
```bash
# Review command needs to know what to review
# Solutions:
/codex-cli review --uncommitted          # Review unstaged changes
/codex-cli review --base main            # Review vs main branch
/codex-cli review --commit HEAD~1        # Review specific commit
```

**Error: "Permission denied" or "Must execute in main session"**
- This skill requires running Bash commands
- It cannot run in background/Task mode
- Just approve the Bash execution when prompted

**Verify setup:**
```bash
# Check installation
which codex && codex --version

# Check login status
codex login status

# Test basic functionality
codex exec "test" -m gpt-5.2 --skip-git-repo-check
```

## Model Selection (Simple!)

**Default: Always `gpt-5.2`** unless you specify `--model` flag.

**Available models** (January 2026):

| Model | When to Use |
|-------|-------------|
| `gpt-5.2` | **Default** - all tasks |
| `gpt-5.2-codex` | Deep coding (user override with `--model`) |
| `gpt-5.1-codex-max` | Complex migrations (user override) |
| `gpt-5.1-codex-mini` | Budget-conscious (user override) |
| `o3`, `o4-mini` | Reasoning tasks (user override) |

> **Note**: Model names may change. If a model fails, it will fallback to `gpt-5.2`.

**Reasoning effort:**
- Short questions (< 500 chars): `medium`
- Everything else: `high`
- Critical tasks: `xhigh` (specify with `--reasoning xhigh`)

## Advanced Usage

**Multiple review rounds:**
- Max 3 rounds by default
- Codex returns "APPROVED" or "NEEDS REVISION"
- Continue until approved or max rounds reached

**For very long plans (>2000 chars):**
- Send executive summary first
- Provide details when Codex requests
- Max 4000 chars per submission

## Command Templates (for internal use)

### Plan Review
```bash
codex exec "Review this implementation plan: [plan content]
Evaluate: technical soundness, risks, missing considerations, approval status" \
  --skip-git-repo-check \
  --sandbox read-only \
  -m gpt-5.2 \
  -c model_reasoning_effort="high"
```

### Code Review
```bash
codex exec review --uncommitted -m gpt-5.2 -c model_reasoning_effort="high"
codex exec review --base main -m gpt-5.2 -c model_reasoning_effort="high"
```

### Simple Question
```bash
codex exec "Quick question: [...]" -m gpt-5.2 -c model_reasoning_effort="medium" --skip-git-repo-check --sandbox read-only
```


## Code Context Handling

Different commands have different ways of accessing your codebase:

### Commands with Automatic Context

**`review` / `exec review`**
- Automatically reads `git diff` as context
- No manual input needed
- Works in `--sandbox read-only` mode

### Commands Requiring Manual Context

**`reviewplan`**
- Plan content must be included in the prompt
- To provide code context, you have two options:

  **Option 1: Reference file paths in plan**
  ```markdown
  Plan modifies these files:
  - src/components/Button.tsx (lines 45-60)
  - src/utils/validate.ts (add validateEmail function)
  ```

  **Option 2: Include code snippets in prompt**
  ```markdown
  Current implementation (Button.tsx):
  [code snippet]

  Planned changes:
  [improved code]
  ```

- Codex CLI can read files in current working directory under `--sandbox read-only`

**`ask`**
- Completely depends on what you include in your question
- No automatic codebase access
- Provide relevant code snippets in the question if needed

> **Note**: Codex CLI uses `--sandbox read-only` by default, which allows reading files in the current directory but prevents writes.

## Output Format

After each Codex interaction:

```
=== CODEX FEEDBACK [Round N/MAX] ===
Model: <model name>
Reasoning: <effort level>
Status: APPROVED / NEEDS REVISION

[Codex full response]

=== END CODEX FEEDBACK ===
```

## Error Handling

| Error | Resolution |
|-------|------------|
| `codex` command fails | Check Codex installation: `brew install openai-codex` |
| Response timeout (3min) | Report and offer retry option |
| Plan file not found | Ask user to specify location |
| Permission denied | **Must execute in main session**, background Task not supported |

## Important Notes

1. **Permission Required**: Codex calls must execute in main session (requires user Bash approval)
2. **No Background**: Do not invoke this skill via background `Task` tool
3. **Preserve Original**: Faithfully relay Codex feedback, do not summarize or filter
4. **Track Iterations**: Always display `[Round N/MAX]`
5. **Models Evolve**: Check OpenAI docs for latest models before assuming availability


## References

- [OpenAI Models Documentation](https://platform.openai.com/docs/models) - Latest model list and updates
- [OpenAI API Changelog](https://platform.openai.com/docs/changelog) - Model releases and changes

> **Note**: Model availability and naming may change over time. If links are outdated or models fail, check your local Codex CLI configuration at `~/.codex/config.toml` or consult the latest OpenAI documentation.
