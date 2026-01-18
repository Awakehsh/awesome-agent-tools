# Awesome Agent Tools 🤖✨

> 精选的AI代理Skills、MCP服务器和强大工具集合

**支持平台**: [Claude Code](#claude-code-用户推荐) (⭐ **推荐**), [Codex](#codex-用户), [Cursor](#cursor-用户), 以及其他AI开发工具

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](../CONTRIBUTING.md)

[English](../README.md) | [中文](./README_CN.md)

---

## 📖 这是什么？

**Awesome Agent Tools** 是一个精选的高质量Skills、MCP（Model Context Protocol）服务器和强大工具的集合，它们能够将AI代理的能力从基本的聊天界面扩展到远超想象的程度。

### 你会在这里找到什么

- **原创Skills**: 为特定任务和工作流定制的Skills
- **原创MCP服务器**: 专门构建的服务器，用于高级集成
- **精选推荐**: 从社区精心挑选的第三方工具
- **跨平台支持**: 开箱即用支持多个AI平台

### 为什么创建这个仓库

AI编程助手很强大，但当它们配备了合适的工具时，才能变得**真正具有变革性**。这个仓库的存在是为了：

1. **集中优质工具**: 将最好的Skills和服务器聚合在一个地方
2. **分享知识**: 让强大的工具对所有人都可访问
3. **减少碎片化**: 统一跨不同AI平台工作的工具
4. **促进创新**: 为更高级的AI工作流提供构建模块

### 谁应该使用这个

- **开发者** 构建AI驱动的应用程序和工作流
- **研究人员** 利用AI进行数据分析和探索
- **内容创作者** 使用AI工具进行写作和文档编写
- **团队** 希望增强他们的AI助手能力
- **任何人** 想要扩展他们AI代理的能力

### 范围：不仅仅是编程

虽然名为"agent tools"，但这个集合包括用于以下方面的资源：

- ✅ **软件开发**: 代码生成、重构、测试、调试
- ✅ **内容创作**: 文档、翻译、写作辅助
- ✅ **研究与分析**: 数据处理、摘要、信息收集
- ✅ **工作流自动化**: CI/CD、部署、监控、任务自动化
- ✅ **设计与创意**: 资产生成、原型设计、工作流优化
- ✅ **更多更多**: 可能性是无限的！

---

## ✨ 特点

- 🎯 **精选集合**: 只包含高质量、经过良好测试的工具和Skills
- 🔧 **跨平台**: 适用于Claude Code、Codex、Cursor等
- 📦 **易于安装**: 大多数工具都可以一条命令搞定
- 🌍 **社区驱动**: 开源且欢迎贡献
- 🚀 **MCP驱动**: 利用Model Context Protocol标准
- 📚 **文档完善**: 每个工具都有清晰的说明和示例
- 🔄 **积极维护**: 定期更新和社区支持

---

## 🚀 快速开始

### Claude Code 用户（⭐ 推荐）

Claude Code提供最佳体验，原生支持SKILL.md和MCP集成。

#### 作为Marketplace安装
```bash
# 将此marketplace添加到Claude Code
claude plugin marketplace add Awakehsh/awesome-agent-tools

# 通过UI浏览和安装skills
claude plugin
```

#### 安装单个Skill
```bash
claude skill add https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli
```

### Codex 用户

Codex原生支持SKILL.md格式的skills。

```bash
# 使用skill-installer安装skill
$skill-installer https://github.com/Awakehsh/awesome-agent-tools/tree/main/skills/codex-cli

# 或克隆到你的skills目录
cd ~/.codex/skills
git clone https://github.com/Awakehsh/awesome-agent-tools
```

### Cursor 用户

Cursor通过MCP服务器或直接GitHub导入支持skills。

```bash
# 方法1: 从GitHub URL导入（在Cursor设置中）
# 方法2: 在Cursor设置中配置MCP服务器
# 方法3: 通过MCP集成使用skills
```

查看[跨平台指南](./CROSS_PLATFORM.md)获取详细设置说明。

### 其他工具用户

大多数AI编程工具都支持SKILL.md格式。请查看你的工具文档了解skill安装方法。

---

## 📦 包含内容

### 原创Skills

| Skill | 说明 | 使用场景 |
|-------|------|---------|
| **[codex-cli](../skills/codex-cli/)** | 让 Claude Code 等非 Codex LLM 调用 OpenAI Codex CLI 进行计划审查和代码分析 | • 编码前审查计划<br/>• 代码审查<br/>• 复杂技术讨论<br/>• 多轮迭代改进 |
| **[learn](../skills/learn/)** | 通用学习系统，从对话中提取见解并更新项目内存文件（CLAUDE.md、AGENTS.md、.cursorrules等）为LLM友好的文档 | • 从调试会话中捕获学习<br/>• 自动将知识路由到合适的文档<br/>• 跨平台内存文件同步<br/>• 基于新鲜度衰减的生命周期管理 |

### 原创MCP服务器

目前正在开发MCP服务器。即将推出：
- 自定义集成
- 专业工具
- 更多...

### 精选推荐

查看 **[AWESOME.md](../AWESOME.md)** 获取全面的分类列表，包括：
- 🎯 **官方Skills** (Anthropic, OpenAI)
- 🌟 **社区Skills** (来自可信开发者)
- 🔧 **MCP服务器** (官方和社区构建)
- 🛠️ **工具与实用程序** (安装器、框架、资源)
- 📚 **学习资源** (文档、教程、指南)

---

## 💡 为什么这些工具很重要

### 扩展AI能力

开箱即用的AI代理仅限于：
- 文本生成
- 基本代码理解
- 对话响应

有了Skills和MCP服务器，AI代理可以：
- ✅ 执行复杂的工作流
- ✅ 访问外部API和服务
- ✅ 操作文件和数据库
- ✅ 与你的开发环境集成
- ✅ 自动化重复任务
- ✅ 构建复杂的应用程序

### Model Context Protocol (MCP) 的强大之处

MCP是一个开放标准，它：
- 提供AI工具的**通用接口**
- 实现**跨平台兼容性**
- 降低**集成复杂性**
- 创建一个**繁荣的生态系统**，充满可互操作的工具

---

## 🎯 使用场景

### 软件开发
- **代码生成**: 生成样板代码、实现功能
- **重构**: 现代化代码库、改进架构
- **测试**: 编写测试、分析覆盖率、调试问题
- **文档**: 自动生成文档、编写教程
- **代码审查**: 分析代码质量、建议改进

### 内容与文档
- **技术写作**: 创建文档、指南、教程
- **翻译**: 跨语言翻译内容
- **内容创作**: 博客文章、文章、社交媒体
- **编辑与校对**: 提高清晰度、修复语法

### 研究与分析
- **数据处理**: 清理、转换、分析数据集
- **信息收集**: 研究主题、总结发现
- **文献综述**: 分析论文、提取见解
- **报告生成**: 创建综合报告

### 工作流自动化
- **CI/CD**: 自动化构建、测试、部署流程
- **任务自动化**: 定时任务、批处理
- **监控**: 跟踪指标、问题告警
- **集成**: 连接不同的工具和服务

---

## 🛠️ 平台对比

| 功能 | Claude Code | Codex | Cursor | 其他 |
|------|------------|-------|---------|------|
| **SKILL.md支持** | ✅ 原生 | ✅ 原生 | ✅ 原生 | 不定 |
| **MCP支持** | ✅ 完整 | ✅ 完整 | ✅ 完整 | 不定 |
| **Marketplace** | ✅ 是 | ✅ 是 | ✅ 是 | N/A |
| **易用性** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 不定 |
| **社区** | 增长中 | 大型 | 增长中 | 不定 |
| **文档** | 优秀 | 良好 | 良好 | 不定 |
| **我们的推荐** | ⭐ **最佳** | 很好 | 很好 | - |

**为什么我们推荐Claude Code**：
- 最精致的skill管理体验
- 出色的marketplace集成
- 最好的MCP服务器支持
- 优秀的文档
- 活跃的开发和更新

**但选择权在你！** 这个仓库中的所有工具都可以跨平台工作。

---

## 🤝 贡献

我们欢迎社区贡献！你可以这样帮助我们：

### 贡献方式

1. **添加你自己的Skill**: 分享你自定义构建的skills
2. **推荐工具**: 建议优秀的第三方skills和服务器
3. **改进文档**: 修复错别字、添加示例、澄清说明
4. **报告问题**: 发现bug？告诉我们！
5. **分享反馈**: 告诉我们如何改进

### 贡献指南

请阅读我们的 **[CONTRIBUTING.md](../CONTRIBUTING.md)** 了解：
- 如何提交skills
- 行为准则
- 质量标准
- PR流程

---

## 📚 资源

### 官方文档
- [Claude Code Skills指南](https://code.claude.com/docs/en/skills)
- [Model Context Protocol规范](https://modelcontextprotocol.io/specification)
- [Codex Skills文档](https://developers.openai.com/codex/skills/)
- [Cursor Agent最佳实践](https://cursor.com/blog/agent-best-practices)

### 社区资源
- [Awesome Skills集合](https://github.com/heilcheng/awesome-agent-skills)
- [MCP服务器仓库](https://github.com/modelcontextprotocol/servers)
- [Awesome MCP服务器](https://github.com/wong2/awesome-mcp-servers)

### 教程与指南
- [构建你的第一个Skill](./tutorials/first-skill.md)
- [创建MCP服务器](./tutorials/mcp-server.md)
- [跨平台设置](./CROSS_PLATFORM.md)

---

## 📄 许可证

本仓库采用 **MIT许可证**。查看 [LICENSE](../LICENSE) 了解详情。

### 重要说明

- **我们的内容**: 本仓库中的原创skills和文档采用MIT许可证
- **第三方内容**: [AWESOME.md](../AWESOME.md)中推荐的工具保持其原始许可证
- **无担保**: 工具按"原样"提供，不提供任何形式的担保

---

## 🌟 Star历史

如果你觉得这个仓库有用，请考虑给它一个star！⭐

---

## 📮 联系与支持

- **Issues**: [GitHub Issues](https://github.com/Awakehsh/awesome-agent-tools/issues)
- **讨论**: [GitHub Discussions](https://github.com/Awakehsh/awesome-agent-tools/discussions)
- **贡献**: 查看 [CONTRIBUTING.md](../CONTRIBUTING.md)

---

## 🙏 致谢

感谢：
- Anthropic团队提供Claude Code和skills框架
- MCP社区提供开放协议标准
- 所有分享他们skills和工具的贡献者
- 所有用AI代理构建amazing things的人！

---

<div align="center">

**[⬆ 回到顶部](#awesome-agent-tools-)**

用 ❤️ 由社区制作

[报告Bug](https://github.com/Awakehsh/awesome-agent-tools/issues) · [请求功能](https://github.com/Awakehsh/awesome-agent-tools/issues) · [贡献](../CONTRIBUTING.md)

</div>
