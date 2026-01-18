# 精选Skills和MCP服务器推荐 ⭐

这是一份精心挑选的AI编程助手工具清单，包括Skills、MCP服务器和相关资源。

## 🎯 优秀Skills

### 官方Skills（Anthropic）

- **[skill-creator](https://github.com/anthropics/skills/tree/main/skill-creator)** by Anthropic
  - 说明：帮助创建新的Claude Code skills的工具
  - 安装：`claude skill add https://github.com/anthropics/skills/tree/main/skill-creator`
  - 功能：自动生成SKILL.md模板、验证格式、打包发布

- **[changelog-generator](https://github.com/anthropics/skills/tree/main/changelog-generator)** by Anthropic
  - 说明：从Git提交历史自动生成用户友好的变更日志
  - 安装：`claude skill add https://github.com/anthropics/skills/tree/main/changelog-generator`
  - 功能：分析commits、分类变更、生成markdown格式

- **[pdf](https://github.com/anthropics/skills/tree/main/pdf)** by Anthropic
  - 说明：PDF文件处理工具包（提取、转换、填表单）
  - 安装：`claude skill add https://github.com/anthropics/skills/tree/main/pdf`
  - 功能：PDF文本提取、图片转换、表单填写

### 社区Skills集合

- **[awesome-agent-skills](https://github.com/heilcheng/awesome-agent-skills)** by heilcheng
  - 说明：大型AI编程助手skills集合，支持Claude、Codex、Copilot等
  - 分类：包含多个类别的实用skills

- **[awesome-codex-skills](https://github.com/ComposioHQ/awesome-codex-skills)** by ComposioHQ
  - 说明：Codex CLI和API的实用skills集合
  - 特点：针对Codex优化的工作流自动化

### 开发工具类

- **[cursor-skills](https://github.com/chrisboden/cursor-skills)** by chrisboden
  - 说明：Cursor AI编辑器的skills启动模板
  - 功能：MCP服务器、自动导入、快速上手

### 通用安装器

- **[ai-agent-skills](https://github.com/skillcreatorai/Ai-Agent-Skills)** by skillcreatorai
  - 说明：一键安装skill到所有AI工具的通用安装器
  - 使用：`npx ai-agent-skills install skill-name`
  - 支持：Claude Code、Cursor、Codex、VS Code等10+工具

- **[openskills](https://github.com/numman-ali/openskills)** by numman-ali
  - 说明：通用skills加载器
  - 使用：`npm i -g openskills && openskills install anthropics/skills`

## 🔧 MCP服务器推荐

### 官方MCP服务器（Model Context Protocol）

- **[filesystem](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)** by MCP Official
  - 说明：安全的文件系统操作服务器
  - 功能：读写文件、目录管理、权限控制

- **[github](https://github.com/modelcontextprotocol/servers/tree/main/src/github)** by MCP Official
  - 说明：GitHub集成服务器
  - 功能：仓库管理、Issue、PR操作

- **[fetch](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)** by MCP Official
  - 说明：Web内容获取服务器
  - 功能：HTTP请求、内容抓取、API调用

- **[git](https://github.com/modelcontextprotocol/servers/tree/main/src/git)** by MCP Official
  - 说明：Git仓库操作工具
  - 功能：提交、分支、日志查看

- **[memory](https://github.com/modelcontextprotocol/servers/tree/main/src/memory)** by MCP Official
  - 说明：知识图谱持久化记忆服务器
  - 功能：存储和检索上下文信息

### 社区MCP服务器

- **[awesome-mcp-servers](https://github.com/wong2/awesome-mcp-servers)** by wong2
  - 说明：精选MCP服务器集合
  - 包含：生产就绪和实验性MCP服务器

- **[GitHub MCP Server](https://github.com/github/github-mcp-server)** by GitHub Official
  - 说明：GitHub官方MCP实现
  - 功能：完整的GitHub API集成

## 🛠️ 相关工具和资源

### Marketplace和插件注册表

- **[Claude Code Plugin Marketplace](https://claudemarketplaces.com/)**
  - Claude Code官方插件市场

- **[Claude Plugins Registry](https://claude-plugins.dev/)**
  - 社区插件注册表

### 开发资源

- **[MCP Servers Repository](https://github.com/modelcontextprotocol/servers)**
  - 官方MCP服务器参考实现

- **[MCP SDK](https://github.com/modelcontextprotocol/typescript-sdk)**
  - TypeScript SDK用于构建MCP服务器

### Cursor相关

- **[awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules)** by PatrickJS
  - Cursor AI编辑器的配置文件集合
  - 包含自定义规则和行为

- **[vibe-tools](https://github.com/eastlondoner/vibe-tools)** by eastlondoner
  - 为Cursor Agent提供AI团队和高级skills

## 📚 学习资源

### 官方文档

- [Claude Code Skills 文档](https://code.claude.com/docs/en/skills)
- [Claude Code Plugins 文档](https://code.claude.com/docs/en/plugins)
- [MCP 规范](https://modelcontextprotocol.io/specification/2025-11-25)
- [Codex Skills 文档](https://developers.openai.com/codex/skills/)

### 教程和指南

- [构建MCP服务器](https://modelcontextprotocol.io/docs/develop/build-server)
- [MCP最佳实践](https://modelcontextprotocol.info/docs/best-practices/)
- [Composio MCP开发指南](https://composio.dev/blog/mcp-server-step-by-step-guide-to-building-from-scrtch)

## 🤝 贡献

发现了优秀的Skills或MCP服务器？欢迎提交PR添加到这个列表！

请确保包含：
- 名称和链接
- 作者信息
- 简短描述
- 安装说明
- 主要功能

---

**更新日期**：2026-01-18

