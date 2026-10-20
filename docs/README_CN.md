# Awesome Agent Tools 🤖✨

> AI agent 开发的混合平台：原创 skills、精选工具和跨平台支持。

**服务开发者构建 AI agents** | 原创 Skills + 精选工具 | 跨平台

**支持平台**: [Claude Code](#快速安装) (⭐ 推荐) | [Codex](#平台支持) | [Cursor](#平台支持) | [GitHub Copilot](#平台支持) | [Antigravity](#平台支持) | [Devin Desktop](#平台支持) | [其他 Agent Skills 客户端](https://agentskills.io/clients)

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](../CONTRIBUTING.md)

[English](../README.md) | [中文](./README_CN.md)

---

## 为什么选择这个合集？

与其他列表不同，我们提供：

- **🔀 混合平台**：我们构建的原创 skills + 精心策展的第三方工具
- **👨‍💻 为开发者服务**：由开发者构建，为使用 AI agents 的开发者服务
- **🌐 跨平台**：Skills 采用开放的 [Agent Skills](https://agentskills.io) 格式，可在 Claude Code、Codex、Cursor、GitHub Copilot、Antigravity 及其他兼容 agent 中使用
- **⚡ 多样化**：Skills + MCP 服务器 + Agents + 插件（不止一种类型）
- **✨ 质量优先**：每个工具都经过测试和筛选，不是链接堆砌
- **🎯 Agent 开发**：特别关注 agent 工作流、并行执行和自动化

---

## ✨ 特性

- 🎯 **精选合集** - 只包含高质量、经过测试的工具和 skills
- 🔧 **跨平台** - Skills 可在任何兼容 Agent Skills 的 agent 中使用：Claude Code、Codex、Cursor、GitHub Copilot、Antigravity 等
- 📦 **易于安装** - 大多数工具一条命令即可安装
- 🌍 **社区驱动** - 开源且欢迎贡献
- 🚀 **MCP 驱动** - 利用 Model Context Protocol 标准
- 📚 **文档完善** - 每个工具都有清晰的说明和示例

---

## 快速安装

### Claude Code（⭐ 推荐）

以一个插件安装全部内容（skills、tech-scout agent 和 handoff 命令）：

```bash
# 在 Claude Code 会话中
/plugin marketplace add Awakehsh/awesome-agent-tools
/plugin install awesome-agent-tools@awesome-agent-tools

# 或在 shell 中
claude plugin marketplace add Awakehsh/awesome-agent-tools
claude plugin install awesome-agent-tools@awesome-agent-tools
```

插件组件带命名空间，例如 `/awesome-agent-tools:codex-cli` 和 `/awesome-agent-tools:handoff`。

### 任何兼容 Agent Skills 的 Agent

使用 [skills CLI](https://github.com/vercel-labs/skills) 安装单个 skill：

```bash
npx skills add Awakehsh/awesome-agent-tools --skill learn
# --list 列出可用 skills，-g 安装到用户级目录，-a 指定 agent（例如 -a codex）
```

### 手动复制

```bash
git clone https://github.com/Awakehsh/awesome-agent-tools
mkdir -p ~/.claude/skills ~/.agents/skills
cp -R awesome-agent-tools/skills/learn ~/.claude/skills/   # Claude Code
cp -R awesome-agent-tools/skills/learn ~/.agents/skills/   # Codex
```

在 Codex 中，也可以在会话里（不是 shell）运行 `$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn`。

其他 agent 的 skill 目录：[平台支持](#平台支持)。**详细设置**：[跨平台指南](./CROSS_PLATFORM.md)

---

## 🤖 Agent 开发亮点

构建 AI agent 系统的特色功能：

| 功能 | 说明 | 平台 |
|------|------|------|
| **自定义 Sub-Agents** | 为专业任务提供独立上下文（[指南](./agents/README.md)） | Claude Code |
| **并行执行** | 同时运行多个 agents（[示例](./agents/README.md#triggering-parallel-agents)） | Claude Code |
| **Agent Skills** | 可重用的 agent 技能包 | 任何兼容 [Agent Skills](https://agentskills.io) 的 agent |
| **MCP 集成** | 连接 agents 到外部工具和数据源 | 所有平台 |
| **工作流自动化** | Slash 命令、钩子和 agent 编排 | Claude Code |

**刚接触 agents？** 查看我们的 [Agent 开发指南](./agents/README.md)了解工作流、模式和最佳实践。

---

## 📦 包含内容

### 🎯 编辑精选（快速上手）

如果你是新手，从这里开始 - 这些工具可以立即带来价值：

| 工具 | 类型 | 功能说明 | 平台 |
|------|------|----------|------|
| **[ralph-loop](https://github.com/anthropics/claude-plugins-official)** | 官方插件 | 通过迭代循环实现通宵自动化开发 | Claude Code |
| **[learn](../skills/learn)** | 原创 Skill | 自动捕获见解到项目记忆（CLAUDE.md、AGENTS.md） | 所有平台 |
| **[context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)** | 社区工具 | 高级上下文工程，提升 8-21% 质量 | 所有平台 |
| **[codex-cli](../skills/codex-cli)** | 原创 Skill | 在 Claude Code 中调用 OpenAI Codex 进行计划审查 | Claude Code |
| **[awesome-mcp-servers](https://github.com/punkpeye/awesome-mcp-servers)** | 策展列表 | 广泛使用的社区 MCP 服务器合集 | 所有平台 |
| **[superpowers](https://github.com/obra/superpowers)** | Skill 框架 | 完整的 AI agent 开发工作流（TDD、代码审查、调试） | Claude Code、Codex、Cursor 等 |
| **[ECC](https://github.com/affaan-m/ECC)**（原 everything-claude-code） | 配置合集 | 黑客松获奖者的实战验证 agents、skills、hooks 和 rules | Claude Code、Codex 等 |

---

### 🛠️ 原创工具

本仓库的开源贡献：

#### Skills (3)

##### context-architect

**AI Agent 系统的上下文工程工具 — 设计系统提示词、工具集、示例策略和运行时上下文管理。**

- **目的**：通过引导式工作流将需求转化为生产就绪的 Context Engineering Package
- **理念**：上下文优先设计 — 管理整个信息状态（提示词、工具、示例、检索、压缩），而非仅仅编写指令
- **使用场景**:
  - 设计具有上下文隔离和子 agent 摘要约束的多 agent 编排系统
  - 以工程化方式规划 token 预算、工具集和 few-shot 示例
  - 通过压缩、笔记和即时检索策略管理长期运行的 agent 会话
- **核心优势**：从提示词工程升级到完整的上下文工程 — 基于 [Anthropic 上下文工程研究](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- **安装**: `npx skills add Awakehsh/awesome-agent-tools --skill context-architect`（或使用 [Claude Code 插件](#快速安装)）

[了解更多 →](../skills/context-architect/README.md)

##### codex-cli

**在 Claude Code 中调用 OpenAI Codex CLI 进行计划审查和代码分析。**

- **使用场景**：计划审查、代码分析、技术讨论、多轮迭代
- **安装**: `npx skills add Awakehsh/awesome-agent-tools --skill codex-cli`（或使用 [Claude Code 插件](#快速安装)）

[了解更多 →](../skills/codex-cli/README.md)

##### learn

**通用学习系统，从对话中提取见解并更新项目内存文件。**

- **使用场景**：捕获学习、自动路由到文档（CLAUDE.md、AGENTS.md）、跨平台同步
- **安装**: `npx skills add Awakehsh/awesome-agent-tools --skill learn`（或使用 [Claude Code 插件](#快速安装)）

[了解更多 →](../skills/learn/README.md)

#### Slash 命令 (1)

##### handoff

**为下一个 coding agent（Codex / Claude / Cursor）生成结构化交接文档。**

- **使用场景**：跨 agent 工作交接、任务中途暂停/恢复、特性开发中切换工具
- **输出**：8 个 section 的即可粘贴 brief — 目标、当前状态、关键决策、失败尝试、证据、未决问题、下一步、相关文件
- **安装**：已包含在 [Claude Code 插件](#快速安装)中（命令为 `/awesome-agent-tools:handoff`），或 `mkdir -p ~/.claude/commands && cp commands/handoff.md ~/.claude/commands/`

[了解更多 →](./commands/handoff.md)

#### Agents (1)

##### tech-scout

**技术研究专家。从 GitHub 和网络资源搜索业界解决方案、设计模式和 Bug 修复。**

- **目的**：在开发工作流程中进行并行研究
- **理念**：不要浪费时间重新发明轮子 - 先从业界方案中学习
- **使用场景**:
  - 功能规划 - 搜索架构模式和设计方法
  - Bug 调试 - 查找错误和常见问题的解决方案
  - 技术对比 - 研究库和框架的优缺点
- **核心优势**：独立运行不阻塞主工作流，返回包含对比和来源的结构化报告
- **安装**：已包含在 [Claude Code 插件](#快速安装)中，或 `mkdir -p ~/.claude/agents && cp agents/tech-scout.md ~/.claude/agents/`

[了解更多 →](./agents/tech-scout.md) | [所有 Agents 文档 →](./agents/README.md)

#### MCP 服务器（即将推出）
- 自定义集成
- 专业工具
- 敬请期待！

---

### 🌟 精选推荐

经过精心审查的第三方工具，按类别组织：

**查看完整策展列表**：**[AWESOME.md](../AWESOME.md)**

分类：
- 🎯 **Skills** - Anthropic 官方 skills、合集与安装器
- 🧩 **插件与市场** - Claude Code 插件市场与精选插件
- 🔧 **MCP 服务器** - 参考实现、开源服务器与托管服务
- 🧰 **Agent 运行时、安全与评测** - 编排器、记忆、扫描器与基准
- 🛠️ **开发者资源** - SDK、框架与社区目录

---

### 📚 指南与文档

- [Agent 开发指南](./agents/README.md) - 工作流、并行执行、最佳实践
- [跨平台设置](./CROSS_PLATFORM.md) - 各平台的 skill 目录和安装步骤
- [构建你的第一个 Skill](./tutorials/first-skill.md) - 分步编写 `SKILL.md` 的教程
- [创建 MCP 服务器](./tutorials/mcp-server.md) - 构建跨客户端可用 MCP 服务器的检查清单
- [贡献指南](../CONTRIBUTING.md) - 如何添加你的工具、收录标准和仓库规范

---

## 使用场景

| 类别 | 示例 |
|------|------|
| **开发** | 代码生成、重构、测试、调试 |
| **内容** | 文档、翻译、技术写作 |
| **研究** | 数据分析、摘要、文献综述 |
| **自动化** | CI/CD、任务自动化、监控 |

---

## 平台支持

本仓库的 skills 遵循开放的 [Agent Skills](https://agentskills.io) 标准：一个包含 `SKILL.md` 文件的文件夹。以下 agent 原生读取 `SKILL.md`：

| 平台 | 项目级 skills | 用户级 skills |
|------|---------------|---------------|
| Claude Code ⭐ | `.claude/skills/` | `~/.claude/skills/` |
| Codex | `.agents/skills/` | `~/.agents/skills/` |
| Cursor | `.agents/skills/` 或 `.cursor/skills/` | `~/.agents/skills/` 或 `~/.cursor/skills/` |
| GitHub Copilot | `.agents/skills/` 或 `.github/skills/` | `~/.agents/skills/` 或 `~/.copilot/skills/` |
| Antigravity | `.agents/skills/` | `~/.gemini/config/skills/`（CLI：`~/.gemini/antigravity-cli/skills/`） |
| Devin Desktop（原 Windsurf） | `.agents/skills/` 或 `.devin/skills/` | `~/.agents/skills/` 或 `~/.config/devin/skills/` |

除 Claude Code 外，上表所有 agent 都从 `.agents/skills/` 读取项目级 skills。各平台详情和文档链接见[跨平台指南](./CROSS_PLATFORM.md)。更多兼容 agent 见 [Agent Skills 客户端展示](https://agentskills.io/clients)。

**为什么推荐 Claude Code**：本仓库提供 Claude Code 插件，一次安装即可获得 skills、tech-scout agent 和 handoff 命令。其他 agent 使用其中的 skills。

---

## Claude Code 技巧

Claude Code 有强大的内置功能：

| 功能 | 说明 |
|------|------|
| **`/skills`** | 列出当前会话可用的 skills 并管理其可见性 |
| **`/agents`** | 创建具有独立上下文的自定义 sub-agents（[了解更多](./agents/README.md)） |
| **`CLAUDE.md`** | 项目记忆，防止重复犯错 |
| **Slash Commands** | 在 `.claude/commands/` 中存储工作流实现自动化 |
| **并行 Agents** | 同时运行多个 agents 处理独立任务（[了解更多](./agents/README.md#triggering-parallel-agents)） |
| **Plan Mode** | 修改前进行只读代码库分析 |

**Anthropic 团队的专业技巧**：将错误添加到 CLAUDE.md，让 Claude 学习不再重复。

了解更多：[官方文档](https://code.claude.com/docs/en/skills) | [创建者的工作流](https://venturebeat.com/technology/the-creator-of-claude-code-just-revealed-his-workflow-and-developers-are)

---

## Codex 小贴士

Codex 的 skill 是按文件夹加载的：`~/.agents/skills/<skill-name>/SKILL.md`（用户级）或 `.agents/skills/<skill-name>/SKILL.md`（仓库级）。

| 提示 | 说明 |
|------|------|
| **`$skill-installer ...`** | 在 Codex 会话里运行（不是终端 shell），后接 skill 名称或指向 skill 文件夹的 GitHub URL |
| **验证是否安装成功** | 在 Codex 中运行 `/skills`，或输入 `$` 提及某个 skill |
| **创建新 skill** | 在 `~/.agents/skills/<skill-name>/` 建文件夹并添加 `SKILL.md`（YAML 头 + Markdown） |
| **重新加载** | Codex 会自动检测新增或修改的 skill；若未出现，重启 Codex |

---

## 资源

### 官方文档

- [Claude Code Skills 文档](https://code.claude.com/docs/en/skills)
- [MCP 规范](https://modelcontextprotocol.io/specification)
- [Codex Skills 文档](https://learn.chatgpt.com/docs/build-skills)
- [Agent Skills 规范](https://agentskills.io/specification)

### 社区资源

- [Awesome MCP Servers](https://github.com/wong2/awesome-mcp-servers) - MCP 服务器策展列表
- [Awesome Claude](https://awesomeclaude.ai/) - 综合目录
- [MCP Servers 仓库](https://github.com/modelcontextprotocol/servers)
- [MCP Registry](https://registry.modelcontextprotocol.io) - 公开 MCP 服务器的官方注册表（预览版）

---

## 贡献

欢迎贡献！你可以：

- **添加你自己的 Skill** - 分享你自定义构建的 skills
- **推荐工具** - 建议优秀的第三方 skills 和服务器
- **改进文档** - 修复错误、添加示例
- **报告问题** - 发现 bug？告诉我们！

详见 [CONTRIBUTING.md](../CONTRIBUTING.md)。

---

## 许可证

MIT 许可证。详见 [LICENSE](../LICENSE)。

- **我们的内容**：MIT 许可证适用于本仓库的原创内容和文档
- **第三方内容**：[AWESOME.md](../AWESOME.md) 中列出的工具保留其各自的许可证；本仓库仅作为索引，不主张对其拥有任何权利

---

<div align="center">

**[⬆ 回到顶部](#awesome-agent-tools-)**

由社区用 ❤️ 制作

[报告 Bug](https://github.com/Awakehsh/awesome-agent-tools/issues) · [请求功能](https://github.com/Awakehsh/awesome-agent-tools/issues) · [贡献](../CONTRIBUTING.md)

</div>
