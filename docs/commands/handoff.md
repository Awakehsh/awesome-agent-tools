# handoff Slash Command

Generate a structured work handoff for the next coding agent picking up your task — Codex, Cursor, another Claude Code session, or a human.

## Why

When you stop working on a task mid-stream and need someone (or some other agent) to continue, the usual options leak signal: a quick paragraph misses decisions, dumping the full chat history is noisy and overflows context. This command produces an 8-section structured brief that captures goal, decisions, dead-ends, and open work in one paste-able chunk.

## Output Format

The command always produces these 8 sections, in order:

1. **Goal** — what the task is and why
2. **Current State** — what's done, what's working
3. **Decisions Made** — key choices and why, including rejected alternatives
4. **Failed Approaches** — what was tried that didn't work, so the next agent doesn't repeat
5. **Evidence** — test output, commits, repro steps
6. **Open Questions** — pending decisions
7. **Next Steps** — what's left (described as "X is not yet done", not "do X")
8. **Relevant Files** — paths + line numbers to read first

No preamble, no closing remarks — output is paste-ready.

## Install

### User-level (recommended)

Available in all Claude Code projects:

```bash
mkdir -p ~/.claude/commands
cp commands/handoff/handoff.md ~/.claude/commands/handoff.md
```

### Project-level

Only in the current project:

```bash
mkdir -p .claude/commands
cp commands/handoff/handoff.md .claude/commands/handoff.md
```

Restart Claude Code to pick up the new command.

## Usage

In a Claude Code session:

```text
/handoff
```

Or with an optional focus hint:

```text
/handoff focus on the auth refactor in src/auth/
```

Then copy the output and paste it into the next agent (Codex, another session, etc.) as the first message.

## Cross-Platform Notes

- **Claude Code**: native slash command support; install as above
- **Codex / Cursor / Windsurf**: no native slash command for this. Typically you *receive* a handoff in these tools rather than generate one. If you do want to generate from there, ask the agent directly: "produce a handoff with these 8 sections: Goal / Current State / Decisions Made / Failed Approaches / Evidence / Open Questions / Next Steps / Relevant Files"

## Design Notes

- **One-shot, not chained**: each handoff is a complete snapshot. No `seq-1` / `seq-2` references to prior handoffs — keeps the surface small
- **No file output**: output goes to chat. The user copies it (or pipes to `/copy`). No `.handoffs/` directory, no git noise
- **Tone is left to the generating agent**: section headings are fixed, but writing style is not enforced — keeps the prompt short
- **Receiver protocol is not embedded**: cross-tool, the receiver may be Codex or a human. The 8 sections are self-explanatory enough not to need a "how to read this" preamble
