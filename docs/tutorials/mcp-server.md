# Creating an MCP Server

This tutorial provides a practical checklist for building an MCP server that works well across clients.

## Key Requirements

- Implement JSON-RPC 2.0 correctly (requests, responses, errors).
- Provide clear tool schemas (names, descriptions, input/output).
- Handle errors and invalid inputs gracefully.
- Document installation and configuration for each supported client.

## Recommended Structure

```
mcp-servers/my-server/
├── README.md
├── server.json            # If your ecosystem uses it
├── src/                   # Implementation
└── build/                 # Compiled output (if applicable)
```

## Client Configuration Pattern

Most MCP clients need:

- `command`: the executable (e.g., `node`, `python`)
- `args`: path(s) to your server entrypoint

Example shape (exact location varies per client):

```json
{
  "mcpServers": {
    "my-server": {
      "command": "node",
      "args": ["/absolute/path/to/mcp-servers/my-server/build/index.js"]
    }
  }
}
```

## Testing Checklist

- Server starts cleanly with no client attached.
- Tools list correctly.
- Each tool validates inputs and returns helpful errors.
- Server handles multiple sequential tool calls without leaking state.

