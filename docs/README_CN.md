# Awesome Agent Tools 🤖✨

> AI agent 开发的混合平台：原创 skills、精选工具和跨平台支持。

**服务开发者构建 AI agents** | 原创 Skills + 精选工具 | 跨平台

**支持平台**: [Claude Code](#快速安装) (⭐ 推荐) | [Codex](#快速安装) | [Cursor](#平台支持) | [Windsurf](#平台支持) | [Antigravity](#平台支持)

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](../CONTRIBUTING.md)

[English](../README.md) | [中文](./README_CN.md)

---

## 为什么选择这个合集？

与其他列表不同，我们提供：

- **🔀 混合平台**：我们构建的原创 skills + 精心策展的第三方工具
- **👨‍💻 为开发者服务**：由开发者构建，为使用 AI agents 的开发者服务
- **🌐 跨平台**：支持 Claude Code、Codex、Cursor、Windsurf、Antigravity 等
- **⚡ 多样化**：Skills + MCP 服务器 + Agents + 插件（不止一种类型）
- **✨ 质量优先**：每个工具都经过测试和筛选，不是链接堆砌
- **🎯 Agent 开发**：特别关注 agent 工作流、并行执行和自动化

---

## ✨ 特性

- 🎯 **精选合集** - 只包含高质量、经过测试的工具和 skills
- 🔧 **跨平台** - 支持 Claude Code、Codex、Cursor、Windsurf、Antigravity
- 📦 **易于安装** - 大多数工具一条命令即可安装
- 🌍 **社区驱动** - 开源且欢迎贡献
- 🚀 **MCP 驱动** - 利用 Model Context Protocol 标准
- 📚 **文档完善** - 每个工具都有清晰的说明和示例

---

## 快速安装

### Claude Code（⭐ 推荐）

```bash
# 作为 marketplace 安装（浏览所有 skills）
/plugin marketplace add Awakehsh/awesome-agent-tools
/plugin install awesome-agent-tools@awesome-agent-tools

# 或手动添加到设置
# 添加到 ~/.claude/settings.json：
# {
#   "extraKnownMarketplaces": {
#     "awesome-agent-tools": {
#       "source": {
#         "source": "github",
#         "repo": "Awakehsh/awesome-agent-tools"
#       }
#     }
#   },
#   "enabledPlugins": {
#     "awesome-agent-tools@awesome-agent-tools": true
#   }
# }

# 或安装单个 skill
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn
```

### Codex

```text
# 安装单个 skill（在 Codex CLI 对话里运行，不是 shell 命令）
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn

# 安装后重启 Codex 才会生效
```

```bash
# 安装全部 skills
git clone https://github.com/Awakehsh/awesome-agent-tools ~/awesome-agent-tools
mkdir -p ~/.codex/skills

# 方式 A（推荐）：把所有 skills 软链到 ~/.codex/skills，后续 `git pull` 就能更新
for d in ~/awesome-agent-tools/skills/*; do ln -s "$d" ~/.codex/skills/; done

# 方式 B：直接复制（不使用软链）
# cp -R ~/awesome-agent-tools/skills/* ~/.codex/skills/

# 后续更新
# (cd ~/awesome-agent-tools && git pull) 后重启 Codex
```

### Cursor / Windsurf / Antigravity

```bash
# 在设置中从 GitHub URL 导入
# 或配置 MCP 服务器集成
# 查看下方详细指南
```

**详细设置**: [跨平台指南](./CROSS_PLATFORM.md)

---

## 🤖 Agent 开发亮点

构建 AI agent 系统的特色功能：

| 功能 | 说明 | 平台 |
|------|------|------|
| **自定义 Sub-Agents** | 为专业任务提供独立上下文（[指南](../agents/README.md)） | Claude Code |
| **并行执行** | 同时运行多个 agents（[示例](../agents/README.md#triggering-parallel-agents)） | Claude Code |
| **Agent Skills** | 可重用的 agent 技能包 | Claude Code, Codex |
| **MCP 集成** | 连接 agents 到外部工具和数据源 | 所有平台 |
| **工作流自动化** | Slash 命令、钩子和 agent 编排 | Claude Code |

**刚接触 agents？** 查看我们的 [Agent 开发指南](../agents/README.md)了解工作流、模式和最佳实践。

---

## 📦 包含内容

### 🎯 编辑精选（快速上手）

如果你是新手，从这里开始 - 这些工具可以立即带来价值：

| 工具 | 类型 | 功能说明 | 平台 |
|------|------|----------|------|
| **[ralph-loop](https://github.com/anthropics/claude-plugins-official)** | 官方插件 | 通过迭代循环实现通宵自动化开发 | Claude Code |
| **[learn](../skills/learn)** | 原创 Skill | 自动捕获见解到项目记忆（CLAUDE.md、AGENTS.md） | 所有平台 |
| **[tree-ring-memory](../skills/tree-ring-memory)** | 社区 Skill | 本地优先的记忆生命周期指导，支持 recall、evidence、audit 和 forgetting | Claude Code, Codex |
| **[context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit)** | 社区工具 | 高级上下文工程，提升 8-21% 质量 | 所有平台 |
| **[codex-cli](../skills/codex-cli)** | 原创 Skill | 在 Claude Code 中调用 OpenAI Codex 进行计划审查 | Claude Code |
| **[awesome-mcp-servers](https://github.com/wong2/awesome-mcp-servers)** | 策展列表 | 79k+ stars - 权威的 MCP 服务器合集 | 所有平台 |
| **[superpowers](https://github.com/obra/superpowers)** | Skill 框架 | 35k+ stars - 完整的 AI agent 开发工作流（TDD、代码审查、调试） | Claude Code |
| **[everything-claude-code](https://github.com/affaan-m/everything-claude-code)** | 配置合集 | 黑客松获奖者的实战验证 agents/skills/commands/hooks | Claude Code |

---

### 🛠️ 原创工具

本仓库的开源贡献：

#### Skills (4)

##### context-architect

**AI Agent 系统的上下文工程工具 — 设计系统提示词、工具集、示例策略和运行时上下文管理。**

- **目的**：通过引导式工作流将需求转化为生产就绪的 Context Engineering Package
- **理念**：上下文优先设计 — 管理整个信息状态（提示词、工具、示例、检索、压缩），而非仅仅编写指令
- **使用场景**:
  - 设计具有上下文隔离和子 agent 摘要约束的多 agent 编排系统
  - 以工程化方式规划 token 预算、工具集和 few-shot 示例
  - 通过压缩、笔记和即时检索策略管理长期运行的 agent 会话
- **核心优势**：从提示词工程升级到完整的上下文工程 — 基于 [Anthropic 上下文工程研究](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- **安装**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/context-architect`

[了解更多 →](../skills/context-architect/README.md)

##### codex-cli
**在 Claude Code 中调用 OpenAI Codex CLI 进行计划审查和代码分析。**
- **使用场景**：计划审查、代码分析、技术讨论、多轮迭代
- **安装**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli`

[了解更多 →](../skills/codex-cli/README.md)

##### learn
**通用学习系统，从对话中提取见解并更新项目内存文件。**
- **使用场景**：捕获学习、自动路由到文档（CLAUDE.md、AGENTS.md）、跨平台同步
- **安装**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn`

[了解更多 →](../skills/learn/README.md)

##### tree-ring-memory

**使用 Tree Ring Memory 为 AI agents 提供本地优先的记忆生命周期指导。**

- **目的**：帮助 agents recall、写入、audit、forget 和记录 evidence，同时避免把原始对话 transcript 当作长期记忆
- **理念**：记忆应该会老化 —— 新鲜工作保持细节，旧经验压缩成 rings，失败成为 scars，稳定事实成为 heartwood，未来想法成为 seeds
- **使用场景**:
  - 在高风险架构、发布、存储或隐私变更前 recall 项目经验
  - 记录简洁的 decisions、warnings、preferences 和 evaluated outcomes
  - 使用显式 audit、redaction、forgetting，以及带来源链接的 DOX/Revolve adapter 工作流
- **安装**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/tree-ring-memory`

[了解更多 →](../skills/tree-ring-memory/README.md)

#### Slash 命令 (1)

##### handoff

**为下一个 coding agent（Codex / Claude / Cursor）生成结构化交接文档。**

- **使用场景**：跨 agent 工作交接、任务中途暂停/恢复、特性开发中切换工具
- **输出**：8 个 section 的即可粘贴 brief — 目标、当前状态、关键决策、失败尝试、证据、未决问题、下一步、相关文件
- **安装**：`cp commands/handoff/handoff.md ~/.claude/commands/handoff.md`

[了解更多 →](../commands/handoff/README.md)

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
- **安装**：将 `agents/tech-scout/` 复制到 `~/.claude/agents/` 或通过 marketplace 安装

[了解更多 →](../agents/tech-scout/README.md) | [所有 Agents 文档 →](../agents/README.md)

#### MCP 服务器（即将推出）
- 自定义集成
- 专业工具
- 敬请期待！

---

### 🌟 精选推荐（30+ 工具）

经过精心审查的第三方工具，按类别组织：

**查看完整策展列表**：**[AWESOME.md](../AWESOME.md)**

分类：
- 🎯 **官方 Skills** - 来自 Anthropic、OpenAI
- 🌟 **社区 Skills** - 可信开发者
- 🔧 **MCP 服务器** - 官方和社区构建
- 🛠️ **工具与实用程序** - 安装器、框架、资源

---

### 📚 指南与文档

- [Agent 开发指南](../agents/README.md) - 工作流、并行执行、最佳实践
- [跨平台设置](./CROSS_PLATFORM.md) - 各平台的详细设置
- [贡献指南](../CONTRIBUTING.md) - 如何添加你的工具
- [项目指南](../CLAUDE.md) - 仓库理念和标准

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

| 平台 | SKILL.md | MCP | 内存文件 | 推荐 |
|------|----------|-----|----------|------|
| Claude Code | ✅ | ✅ | CLAUDE.md | ⭐ 最佳 |
| Codex | ✅ | ✅ | AGENTS.md | 很好 |
| Cursor | ✅ | ✅ | .cursorrules | 很好 |
| Windsurf | ✅ | ✅ | .windsurfrules | 良好 |
| Antigravity | ✅ | ✅ | .agent/rules/ | 良好 |

**为什么推荐 Claude Code**：最佳 skill 管理、出色的 MCP 支持、优秀的文档。

---

## Claude Code 技巧

Claude Code 有强大的内置功能：

| 功能 | 说明 |
|------|------|
| **`/skills`** | 直接在 CLI 中创建自定义 skills |
| **`/agents`** | 创建具有独立上下文的自定义 sub-agents（[了解更多](../agents/README.md)） |
| **`CLAUDE.md`** | 项目记忆，防止重复犯错 |
| **Slash Commands** | 在 `.claude/commands/` 中存储工作流实现自动化 |
| **并行 Agents** | 同时运行多个 agents 处理独立任务（[了解更多](../agents/README.md#triggering-parallel-agents)） |
| **Plan Mode** | 修改前进行只读代码库分析 |

**Anthropic 团队的专业技巧**：将错误添加到 CLAUDE.md，让 Claude 学习不再重复。

了解更多：[官方文档](https://code.claude.com/docs/en/skills) | [创建者的工作流](https://venturebeat.com/technology/the-creator-of-claude-code-just-revealed-his-workflow-and-developers-are)

---

## Codex 小贴士

Codex 的 skill 是按文件夹加载的：`~/.codex/skills/<skill-name>/SKILL.md`。

| 提示 | 说明 |
|------|------|
| **`$skill-installer ...`** | 在 Codex CLI 对话里运行（不是终端 shell），然后重启 Codex |
| **验证是否安装成功** | 确认 `~/.codex/skills/<skill-name>/SKILL.md` 存在 |
| **创建新 skill** | 在 `~/.codex/skills/<skill-name>/` 建文件夹并添加 `SKILL.md`（YAML 头 + Markdown） |
| **重新加载** | 新增或修改 skill 后重启 Codex |

---

## 资源

### 官方文档

- [Claude Code Skills 文档](https://code.claude.com/docs/en/skills)
- [MCP 规范](https://modelcontextprotocol.io/specification)
- [Codex Skills 文档](https://developers.openai.com/codex/skills/)

### 社区资源

- [Awesome MCP Servers](https://github.com/wong2/awesome-mcp-servers) - 79,000+ stars
- [Awesome Claude](https://awesomeclaude.ai/) - 综合目录
- [MCP Servers 仓库](https://github.com/modelcontextprotocol/servers)

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

- **我们的内容**：原创 skills 和文档采用 MIT 许可证
- **第三方内容**：AWESOME.md 中的工具保持其原始许可证

---

<div align="center">

**[⬆ 回到顶部](#awesome-agent-tools-)**

由社区用 ❤️ 制作

[报告 Bug](https://github.com/Awakehsh/awesome-agent-tools/issues) · [请求功能](https://github.com/Awakehsh/awesome-agent-tools/issues) · [贡献](../CONTRIBUTING.md)

</div>
