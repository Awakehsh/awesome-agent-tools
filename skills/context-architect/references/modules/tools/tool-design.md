# Tool Design Principles

> Design tools that maximize agent capability while minimizing context overhead.

## Core Principles

### 1. Minimize Overlap

Each tool should have a single, clear purpose. Overlapping tools force agents to waste reasoning tokens choosing between them.

**Anti-pattern:**
```
- search_web(query) — general web search
- find_information(topic) — topic-based search
- lookup(term) — term lookup
```
These three tools overlap significantly. The agent must reason about which to use.

**Better:**
```
- web_search(query, max_results) — unified search interface
```

**Guideline:** If two tools would produce similar results for >30% of inputs, merge them or make the distinction explicit and non-overlapping.

### 2. Self-Contained Design

Each tool must include everything the agent needs to use it correctly — without relying on instructions elsewhere in the context.

**Tool definition should include:**
- Clear description of what it does and when to use it
- All parameter descriptions with types, constraints, and examples
- Expected output format and structure
- Error cases and what the agent should do about them

**Example:**
```json
{
  "name": "create_file",
  "description": "Create a new file at the specified path. Use this when you need to write a new file. Fails if file already exists — use update_file for existing files.",
  "parameters": {
    "path": {
      "type": "string",
      "description": "Absolute file path (e.g., /src/utils/helper.ts). Parent directory must exist."
    },
    "content": {
      "type": "string",
      "description": "Complete file content. Include all imports and exports."
    }
  },
  "errors": {
    "FILE_EXISTS": "File already exists. Use update_file instead.",
    "DIR_NOT_FOUND": "Parent directory does not exist. Create it first."
  }
}
```

### 3. Descriptive, Unambiguous Parameters

Parameter names and descriptions are part of the context. They should eliminate guesswork.

**Weak parameters:**
```
- data: any — the data
- options: object — configuration
- flag: boolean — enable feature
```

**Strong parameters:**
```
- search_query: string — natural language search query (e.g., "Python async patterns")
- max_results: integer — maximum results to return (1-50, default: 10)
- include_snippets: boolean — if true, include code snippet previews in results
```

**Rules:**
- Use descriptive names that convey purpose (not `x`, `data`, `input`)
- Include type constraints and valid ranges
- Provide concrete examples in descriptions
- Specify defaults explicitly
- Use enums for limited option sets instead of free-text

### 4. Error-Robust Design

Tools should return structured errors that help the agent self-correct, not opaque failure messages.

**Error design principles:**
- Return error codes + human-readable descriptions
- Suggest corrective actions in error messages
- Distinguish between retriable and permanent failures
- Include context about what went wrong

**Example error response:**
```json
{
  "error": {
    "code": "RATE_LIMITED",
    "message": "API rate limit exceeded. 429 Too Many Requests.",
    "retry_after_seconds": 30,
    "suggestion": "Wait 30 seconds before retrying, or reduce request frequency."
  }
}
```

### 5. Appropriate Granularity

Tools should match the agent's cognitive level — not too low-level (too many calls), not too high-level (too rigid).

**Too granular (agent overhead):**
```
open_file(path) → read_line(handle, line_num) → close_file(handle)
```

**Too coarse (inflexible):**
```
process_entire_project(project_path, config)
```

**Right level:**
```
read_file(path, start_line?, end_line?) — read file with optional range
```

## Tool Set Composition

### Token Budget for Tools

Tool definitions consume context tokens. Budget them:

| Agent Complexity | Recommended Tool Count | Token Budget |
|---|---|---|
| Focused single-task | 3-5 tools | 500-1,000 tokens |
| General-purpose | 8-15 tools | 1,500-3,000 tokens |
| Complex multi-domain | 15-25 tools | 3,000-5,000 tokens |

**Warning:** Beyond ~25 tools, agents experience significant decision-making degradation ("tool confusion").

### Tool Organization

For larger tool sets, organize tools with clear naming conventions:

```
# Namespace pattern
file_read, file_write, file_delete
db_query, db_insert, db_update
api_get, api_post
```

This helps the agent navigate the tool set without scanning all descriptions.

### Dynamic Tool Loading

For agents with many potential tools, consider loading tools conditionally:

```
Phase 1 (Planning):     [analyze_task, search_docs, list_files]
Phase 2 (Implementation): [read_file, write_file, run_tests]
Phase 3 (Review):        [diff_changes, run_linter, submit_pr]
```

This keeps each phase's tool set focused and within token budget.

## Checklist

When designing tools for your agent, verify:

- [ ] No two tools overlap in >30% of use cases
- [ ] Each tool definition is self-contained (usable without external docs)
- [ ] All parameters have descriptive names, types, constraints, and examples
- [ ] Error responses include codes, descriptions, and corrective suggestions
- [ ] Tool count stays within budget for agent complexity level
- [ ] Tools are at the right granularity for the agent's reasoning level
- [ ] Naming conventions make the tool set navigable

## Parameters

- **domain**: The agent's operational domain (affects tool selection)
- **max_tools**: Maximum tool count for token budget
- **tool_loading**: Static (all at once) or Dynamic (phase-based)
- **error_verbosity**: Minimal / Standard / Verbose
