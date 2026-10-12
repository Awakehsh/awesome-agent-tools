# Invokely Statistics Skill

This skill helps an agent retrieve official statistical figures through a connected Invokely MCP server, then report each result with its period, unit, source citation, and comparability notes. It includes instructions only. It does not provide an MCP server or the hosted Invokely service implementation.

## Setup

Configure the `invokely` MCP server separately. The public [Invokely MCP connector](https://github.com/estevecastells/invokely-mcp-connector) is an MIT-licensed Node.js 22 local stdio adapter. Its README has client configuration instructions. It uses the no-account trial endpoint when no API key is set, and uses the authenticated endpoint when `INVOKELY_API_KEY` is configured. The adapter does not implement OAuth. It forwards requests to the hosted service; the hosted backend is not included in the connector repository.

As checked on 2026-10-12, the no-account trial allows 25 calls per day per IP address and the Free account plan includes 500 MCP calls per month. These allowances can change. Check [Invokely pricing](https://invokely.ai/pricing) for current limits and plans.

After this skill is merged into this catalog, install its directory using the instructions in the [catalog README](https://github.com/Awakehsh/awesome-agent-tools#quick-install). For Codex, the catalog currently documents `$skill-installer` for a single skill. For Claude Code, it documents `claude skill add`.

## Source and license

This skill adapts the workflow from the public MIT-licensed [Invokely statistics skill at commit `9d96d33228f753cf26d7da5115598da2c19ad900`](https://github.com/estevecastells/awesome-copilot/blob/9d96d33228f753cf26d7da5115598da2c19ad900/skills/invokely-statistics/SKILL.md). The instructions here were rewritten against the current Invokely MCP tool schemas and public documentation. The full MIT notice is included in this directory's `LICENSE` file and preserves the source notice. That license applies to this skill package; it does not grant rights to or describe the hosted service implementation.

## References

- [Invokely developer documentation](https://invokely.ai/docs)
- [Invokely pricing](https://invokely.ai/pricing)
- [Invokely machine-readable guide](https://invokely.ai/llms.txt)
- [Invokely MCP connector README](https://github.com/estevecastells/invokely-mcp-connector/blob/main/README.md)
- [Pinned MIT-licensed source skill](https://github.com/estevecastells/awesome-copilot/blob/9d96d33228f753cf26d7da5115598da2c19ad900/skills/invokely-statistics/SKILL.md)
