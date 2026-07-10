# codex-cli Skill

Enable Claude Code to leverage OpenAI Codex CLI for plan review, code review, and complex problem discussions.

## Why Use This Skill? 🎯

**The Problem**: Blindly letting AI write code often results in low success rates. Complex tasks need thorough analysis before implementation.

**The Solution**: Combine Claude's speed with Codex's reasoning:
- ✅ **Plan Review** — review implementation plans BEFORE coding
- ✅ **Code Review** — deep analysis of a diff
- ✅ **Complex Questions** — technical discussions requiring deep reasoning
- ✅ **Multi-Round** — iterative refinement via session `resume`

**The Philosophy**: In plan-and-review workflows, a second opinion matters. Claude Code is fast; Codex adds thorough analysis. Combining both raises quality.

## `codex exec` IS an agent loop (not single-shot)

`codex exec` is **non-interactive**, not "single-shot". Each call runs a **full agent loop**: Codex autonomously reads files, greps, runs shell commands, and reasons over many steps before returning. The skill uses `exec` because you can't drive the interactive TUI from another agent — but `exec` keeps the full agentic loop. For follow-up rounds, resume the **same session** by its `session id` (see Multi-Round below).

## Prerequisites ⚠️ (Required!)

### 1. Install Codex CLI
```bash
which codex && codex --version
```
Install path depends on your installer (e.g. `~/.local/bin/codex`, or a package manager). If missing, follow the OpenAI Codex CLI install docs.

### 2. Log in — two supported paradigms

Check the current one first:
```bash
codex login status
```

**Paradigm A — ChatGPT account (OAuth)** — uses your ChatGPT subscription quota + rate limits:
```bash
codex login          # opens a browser to authorize; no API key needed
```
Status shows `Logged in using ChatGPT`.

**Paradigm B — API key** — billed per API usage:
```bash
codex login --with-api-key             # reads key from stdin
# non-interactive: codex login --with-api-key <<< "$OPENAI_API_KEY"
```
Status shows `Logged in using an API key - sk-***`.

> Commands are **identical** under both paradigms. What differs: billing, rate limits, and which **model names** are available.

## Installation

### For Claude Code (Recommended)
```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### For Codex
```bash
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### Manual
```bash
git clone https://github.com/Awakehsh/awesome-agent-tools.git
cp -r awesome-agent-tools/skills/codex-cli ~/.claude/skills/
```

## Model Selection

- **If the user names a model, use exactly that model.**
- **If not, do NOT pass a model flag** — Codex uses the default from `~/.codex/config.toml`.
- **Never hardcode a model name.** Names change across releases and differ between login modes; hardcoding causes "model does not exist" failures.
- See the active default: any `codex exec` header prints `model: <name>`, or read `model = "..."` in `~/.codex/config.toml`.

> Note on flags: top-level `codex review` has **no `-m`** — pass a model with `-c model="..."`. `codex exec` / `codex exec review` accept `-m`.

## Quick Start

```bash
/codex-cli ask "your question"        # quick question
/codex-cli reviewplan                 # review an implementation plan
/codex-cli review --uncommitted       # review uncommitted changes
/codex-cli review --base main         # review changes vs a branch
```

Underlying commands (follow config model by default):
```bash
codex review --uncommitted
codex review --base main
codex exec "Review this plan: [...]" --skip-git-repo-check
```

## Sandbox — what actually runs

`codex exec`'s nominal default is `read-only`, **but `~/.codex/config.toml` (`sandbox_mode`) overrides it.** If your config sets `danger-full-access`, commands run with full write access unless you pass `-s read-only`. This skill **follows your config** — it does not force a sandbox. For a guaranteed no-writes review, add `-s read-only`. Check the `sandbox: <mode>` line in the `codex exec` header.

## Capabilities inside `codex exec`

| Capability | Status |
|------------|--------|
| Shell + file tools (read repo, grep, run commands) | ✅ stable |
| Web / internet search | ⚠️ not a stable default (flags removed/deprecated) |
| `browser_use` / `computer_use` | ⚠️ account-only, unreliable under `exec` |

## Multi-Round Iterations

```bash
# Round 1 — capture the session id printed in the header
codex exec review --uncommitted            # header: session id: <UUID>
# Round 2+ — resume that EXACT session (never --last in automation)
codex exec resume <UUID> "Re-review after I addressed points 1 and 3."
```
`resume --last` is unreliable: any concurrent Codex call becomes "last". Always resume by explicit `<session-id>`.

## Reasoning Levels

- Default: **follow config** (don't pass an effort flag).
- Override per call: `-c model_reasoning_effort="medium|high|xhigh"`.

## Troubleshooting

| Error | Solution |
|-------|----------|
| `command not found: codex` | Install Codex CLI; `which codex` should return your path. |
| `Authentication required` | `codex login` (account) or `codex login --with-api-key` (API); verify `codex login status`. |
| `model 'xxx' does not exist` | Drop `-m` to use the config default (name unavailable in your login mode). |
| `-m` rejected on `codex review` | Top-level review has no `-m`; use `-c model="..."` or `codex exec review`. |
| `Specify --uncommitted, --base, or --commit` | Give the review a target. |
| Resume lost context | You used `--last` with concurrent sessions; resume by explicit `<session-id>`. |

## Security & Privacy

| Aspect | Detail |
|--------|--------|
| Code transmission | Your code/prompts are sent to OpenAI for processing. |
| Credentials | Stored under `~/.codex/` (`auth.json`); keep the directory private. |
| Sandbox | Follows `config.toml`; add `-s read-only` for guaranteed no-writes. |
| Sensitive code | Be mindful when reviewing secrets or proprietary logic. |

See [OpenAI's data usage policies](https://openai.com/policies/api-data-usage-policies).

## How It Works

```
/codex-cli reviewplan
    ↓
Bash: codex exec "Review this plan..."   (follows config model; full agent loop)
    ↓
Codex autonomously reads files / runs tools / reasons
    ↓
Returns: APPROVED / NEEDS REVISION
    ↓
Round 2+ via: codex exec resume <session-id> "..."
```

## Contributing

Open an issue: https://github.com/Awakehsh/awesome-agent-tools/issues

## License

MIT License — see [LICENSE](../../LICENSE)

## References

- [OpenAI Models Documentation](https://platform.openai.com/docs/models) — model names change; verify against your login mode.
- Local source of truth: `~/.codex/config.toml` and `codex login status`.
