---
description: Generate a structured handoff for the next coding agent picking up this task.
---

Generate a work handoff for the next coding agent picking up this task.

Hard rules:
- Output ONLY the handoff itself. No preamble ("Here is..."), no closing remarks, no meta-commentary.
- Include all 8 sections below, in this order, even if a section is empty (write what little is known).
- Section headings exactly as given so the next agent can parse them.

Sections:
1. ## Goal
2. ## Current State
3. ## Decisions Made (include rejected options + why)
4. ## Failed Approaches
5. ## Evidence (test output, commits, repro steps)
6. ## Open Questions
7. ## Next Steps
8. ## Relevant Files (paths + line numbers)

Optional focus from user: $ARGUMENTS

Begin handoff now.
