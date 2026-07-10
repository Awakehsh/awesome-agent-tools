---
name: codex-cli
description: "Interact with OpenAI Codex CLI for plan review, code review, and complex problem discussion. Supports either ChatGPT-account or API-key login, model selection, and multi-round conversations. Usage: /codex-cli <command> [options]"
---

# Codex CLI Interaction Skill

Interact with OpenAI Codex CLI to leverage its reasoning for plan review, code analysis, and complex problem discussions.

> **Naming**: "codex-cli" **Skill** = this document. "Codex CLI" = the OpenAI command-line tool being invoked.

## 🚨 Model Rule — READ FIRST

- **If the user names a model, use exactly that model.** Respect the user's choice.
- **If the user does NOT name a model, do NOT pass `-m` or `-c model=` at all.** Let Codex use the default from `~/.codex/config.toml`.
- **Never hardcode a model name.** Model names change across Codex releases, and the names available under ChatGPT-account login differ from those under API-key login. Hardcoding a name is the #1 cause of "model does not exist" failures.
- To see the active default without guessing: run any `codex exec` — its header prints `model: <name>` — or read the `model = "..."` line in `~/.codex/config.toml`.

## `codex exec` IS an agent loop (not single-shot)

`codex exec` is **non-interactive**, which is NOT the same as "single-shot". Each `codex exec` call runs a **full agent loop**: Codex autonomously reads files, greps, runs shell commands, and reasons over many steps before returning. "Non-interactive" only means there is no human back-and-forth *mid-run* — it does not reduce Codex's agentic capability.

- This is why the skill uses `codex exec` (not the interactive TUI): you can't drive an interactive terminal from another agent, but `exec` gives you the same autonomous loop.
- For a **follow-up round** (e.g. round 2 of a review), continue the SAME session:
  `codex exec resume <session-id> "<follow-up>"`. Capture the `session id:` printed in round 1's header.
- **Do NOT use `resume --last` in automation.** `--last` resolves to the most recent session globally; any concurrent Codex call steals "last", so you resume the wrong thread. Always resume by explicit `<session-id>`.

## Prerequisites

1. **Codex CLI installed**
   ```bash
   which codex && codex --version
   ```
   Install path depends on your installer (e.g. `~/.local/bin/codex`, or a package manager). If missing, follow the OpenAI Codex CLI install docs.

2. **Logged in — two supported paradigms.** Check the current one first:
   ```bash
   codex login status
   ```

   **Paradigm A — ChatGPT account (OAuth).** Uses your ChatGPT subscription quota and rate limits.
   ```bash
   codex login          # opens a browser to authorize; no API key needed
   ```
   `codex login status` → `Logged in using ChatGPT`.

   **Paradigm B — API key.** Billed per API usage.
   ```bash
   codex login --with-api-key            # reads the key from stdin
   # non-interactive: codex login --with-api-key <<< "$OPENAI_API_KEY"
   ```
   `codex login status` → `Logged in using an API key - sk-***`.

   > The skill's commands are **identical** under both paradigms. What differs: billing, rate limits, and which **model names** are available — which is exactly why you must not hardcode `-m` (see Model Rule).

## Sandbox — what actually runs

- `codex exec`'s **nominal** default is `read-only`, **but `~/.codex/config.toml` (`sandbox_mode`) overrides it.** If your config sets `danger-full-access`, commands run with full write access unless you pass `-s read-only` explicitly.
- **This skill follows your config; it does NOT force a sandbox.** For a guaranteed no-writes review, add `-s read-only`.
- Check yours: the `codex exec` header prints `sandbox: <mode>`, or read `sandbox_mode` in `~/.codex/config.toml`.

## Capabilities inside `codex exec`

| Capability | Status | Notes |
|------------|--------|-------|
| Shell + file tools | ✅ stable | Codex autonomously reads your repo, greps, runs commands (subject to sandbox). |
| Web / internet search | ⚠️ not a stable default | Web-search feature flags are removed/deprecated in the current CLI. Do not assume Codex can browse the web from `exec`. |
| `browser_use` / `computer_use` | ⚠️ account-only | Depend on the ChatGPT.app ecosystem; unreliable under non-interactive `exec`. |

## CLI Flag Reference

> **⚠️ `codex review` and `codex exec review` have DIFFERENT flags.**
> - `codex review` (top-level): **NO `-m` flag.** Set a model with `-c model="..."` only.
> - `codex exec review`: supports `-m` **and** `-c model="..."`.

### Flag Compatibility Matrix

| Flag | `codex review` | `codex exec review` | `codex exec "prompt"` |
|------|:-:|:-:|:-:|
| `-m, --model` | **NO** | YES | YES |
| `-c, --config` | YES | YES | YES |
| `--uncommitted` | YES | YES | NO |
| `--base` | YES | YES | NO |
| `--commit` | YES | YES | NO |
| `-s, --sandbox` | NO | NO | YES |
| `--skip-git-repo-check` | NO | YES | YES |

## Recommended Command Forms

> These follow your `config.toml` model by default. Add `-c model_reasoning_effort="..."` to override effort; add a model flag ONLY if the user named a model.

### Code review (use top-level `codex review` — simplest)
```bash
codex review --uncommitted                       # review staged+unstaged+untracked
codex review --base main                          # review changes vs a branch
codex review --commit HEAD~1                      # review a specific commit
# effort override:  codex review --uncommitted -c model_reasoning_effort="high"
# user named model M: codex review --uncommitted -c model="M"   # NOTE: -c, not -m
```

### Plan review / questions (use `codex exec`)
```bash
codex exec "Review this implementation plan: [...]
Evaluate: technical soundness, risks, missing considerations, approval status" \
  --skip-git-repo-check
# guaranteed no writes:  add  -s read-only
# user named model M:    add  -m M
```

### Code review via exec (only when you need `-m`)
```bash
codex exec review --base main
codex exec review --uncommitted
```

### Multi-round review (preserve context)
```bash
# Round 1 — capture the session id printed in the header
codex exec review --uncommitted            # header shows: session id: <UUID>
# Round 2+ — resume that EXACT session (never --last in automation)
codex exec resume <UUID> "Re-review after I addressed points 1 and 3."
```

## Reasoning Effort

- **Default: follow config** — do not pass an effort flag. Your config may already set a high tier (e.g. `xhigh`).
- **Override per call:** `-c model_reasoning_effort="medium|high|xhigh"`.
- Rule of thumb if you must choose: short questions → `medium`; reviews/plans → `high`; critical → `xhigh`.

## Long-Running Calls — Background Mode

For calls expected to exceed ~60s (`xhigh` effort, `--base` on large diffs, full-repo audits):
- Invoke via `Bash(run_in_background=true)` so the main session stays responsive; poll with `BashOutput` or read the output file.
- **Sampling tip:** launch 2–3 background runs of the same prompt in parallel — Codex output is non-deterministic, and merging runs surfaces more real issues than one run.
- Do NOT background short `ask`/single-file reviews — the realtime reasoning trace is more useful in foreground.
- ❌ Do NOT invoke Codex via a subagent `Task(...)` — subagents can't surface Bash permission prompts and will hang. Use `Bash(run_in_background=true)` instead.

## User Interface (how the skill is invoked)

```bash
/codex-cli ask "question"          # quick question
/codex-cli "question"              # shorter form of ask
/codex-cli reviewplan              # review an implementation plan
/codex-cli review --uncommitted    # review uncommitted changes
/codex-cli review --base main      # review changes vs branch
```
Map each to the recommended command forms above.

## Output Format

Relay Codex feedback faithfully — do not summarize or filter. After each interaction:

```
=== CODEX FEEDBACK [Round N/MAX] ===
Model: <from header>   Reasoning: <effort>   Status: APPROVED / NEEDS REVISION
[Codex full response]
=== END CODEX FEEDBACK ===
```

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `command not found: codex` | Not installed. `which codex` should return your install path. |
| `Authentication required` | Not logged in. `codex login` (account) or `codex login --with-api-key` (API); verify with `codex login status`. |
| `model 'xxx' does not exist` | You passed `-m` with a name unavailable in your login mode. **Drop `-m`** to use the config default. |
| `-m` rejected on `codex review` | Top-level `codex review` has no `-m`. Use `-c model="..."`, or switch to `codex exec review`. |
| `Specify --uncommitted, --base, or --commit` | Review needs a target: `--uncommitted` / `--base <branch>` / `--commit <sha>`. |
| Resume ignored my prior context | You used `--last` with concurrent sessions. Resume by explicit `<session-id>`. |
| Command hangs | You invoked Codex via a subagent `Task`. Use `Bash(run_in_background=true)`. |

**Verify setup:**
```bash
which codex && codex --version
codex login status
codex exec "reply OK" --skip-git-repo-check   # header shows active model + sandbox
```

## Security & Privacy

- **Code transmission:** your code/prompts are sent to OpenAI for processing.
- **Credentials:** stored under `~/.codex/` (`auth.json`). Keep the directory private.
- **Sensitive code:** be mindful when reviewing code with secrets or proprietary logic.
- See [OpenAI's data usage policies](https://openai.com/policies/api-data-usage-policies).

## References

- [OpenAI Models Documentation](https://platform.openai.com/docs/models) — model names change; verify against your login mode.
- Local source of truth for defaults: `~/.codex/config.toml` and `codex login status`.
