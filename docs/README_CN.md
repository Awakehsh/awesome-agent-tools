# Awesome Agent Tools 🤖✨

> 跨平台 AI 编程代理工具精选：Skills、MCP 服务器、插件等。

**支持平台**: [Claude Code](#快速安装) (⭐ 推荐) | [Codex](#快速安装) | [Cursor](#平台支持) | [Windsurf](#平台支持) | [Antigravity](#平台支持)

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](../CONTRIBUTING.md)

[English](../README.md) | [中文](./README_CN.md)

---

## 为什么选择这个合集？

大多数 "awesome" 列表只关注单一平台或单一类型。**我们不同**：

- **跨平台**：支持 Claude Code、Codex、Cursor、Windsurf、Antigravity 等
- **多样化**：Skills + MCP 服务器 + 插件 + 工具（不止一种类型）
- **质量优先**：每个工具都经过筛选，不是链接堆砌
- **开发者聚焦**：优先收录生产力工具，但不局限于编程

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
/plugin
# 输入: Awakehsh/awesome-agent-tools

# 或安装单个 skill
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn
```

### Codex

```bash
# 使用 skill-installer
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn

# 或克隆到 skills 目录
cd ~/.codex/skills && git clone https://github.com/Awakehsh/awesome-agent-tools
```

### Cursor / Windsurf / Antigravity

```bash
# 在设置中从 GitHub URL 导入
# 或配置 MCP 服务器集成
# 查看下方详细指南
```

**详细设置**: [跨平台指南](./CROSS_PLATFORM.md)

---

## 包含内容

### 原创 Skills

#### codex-cli

**在 Claude Code 中调用 OpenAI Codex CLI 进行计划审查和代码分析。**

- **使用场景**：
  - 编码前审查计划
  - 代码审查和分析
  - 复杂技术讨论
  - 多轮迭代改进
- **安装**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli`

[了解更多 →](../skills/codex-cli/README.md)

#### learn

**通用学习系统，从对话中提取见解并更新项目内存文件。**

- **使用场景**：
  - 从调试会话中捕获学习
  - 自动将知识路由到合适的文档（CLAUDE.md、AGENTS.md、.cursorrules）
  - 跨平台内存文件同步
  - 基于新鲜度衰减的生命周期管理
- **安装**: `claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/learn`

[了解更多 →](../skills/learn/README.md)

### 原创 MCP 服务器

即将推出：
- 自定义集成
- 专业工具
- 更多...

### 精选推荐

完整分类列表见 **[AWESOME.md](../AWESOME.md)**：

- 🎯 **官方 Skills** - Anthropic、OpenAI
- 🌟 **社区 Skills** - 来自可信开发者
- 🔧 **MCP 服务器** - 官方和社区构建
- 🛠️ **工具与实用程序** - 安装器、框架、资源

**亮点**：

| 工具 | 说明 |
|------|------|
| [ralph-loop](https://github.com/anthropics/claude-plugins-official) | 迭代循环实现自动化开发 |
| [context-engineering-kit](https://github.com/NeoLabHQ/context-engineering-kit) | 高级上下文工程，提升 8-21% 质量 |
| [openskills](https://github.com/numman-ali/openskills) | 通用 skills 加载器，支持多平台 |

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
| **`CLAUDE.md`** | 项目记忆，防止重复犯错 |
| **Slash Commands** | 在 `.claude/commands/` 中存储工作流实现自动化 |
| **并行 Agents** | 运行多个 Claude 实例提升生产力 |
| **Plan Mode** | 修改前进行只读代码库分析 |

**Anthropic 团队的专业技巧**：将错误添加到 CLAUDE.md，让 Claude 学习不再重复。

了解更多：[官方文档](https://code.claude.com/docs/en/skills) | [创建者的工作流](https://venturebeat.com/technology/the-creator-of-claude-code-just-revealed-his-workflow-and-developers-are)

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
