# 贡献指南 🤝

感谢你对 Awesome Coding Agents 项目的关注！我们欢迎各种形式的贡献。

## 贡献方式

### 1. 添加你的原创Skill

如果你创建了一个实用的skill，欢迎添加到这个仓库！

**步骤**：
1. Fork 此仓库
2. 在 `skills/` 目录下创建新的子目录（使用kebab-case命名，如：`my-awesome-skill`）
3. 添加必需的 `SKILL.md` 文件
4. （可选）添加 `README.md`、`scripts/`、`references/` 等
5. 提交 Pull Request

**Skill格式要求**：

`SKILL.md` 必须包含YAML frontmatter：

```yaml
---
name: skill-name
description: 详细描述你的skill，包括它解决什么问题、什么时候应该使用它
---

# Skill Name

## 功能说明

[详细说明skill的功能]

## 使用方法

[使用示例和说明]

## 示例

[具体的使用示例]
```

**命名规范**：
- 使用小写字母和连字符（kebab-case）
- 名称应该简洁、描述性强
- 例如：`pdf-processor`、`code-reviewer`、`api-tester`

### 2. 推荐优秀的第三方Skills/工具

发现了好用的skills或MCP服务器？欢迎推荐！

**步骤**：
1. Fork 此仓库
2. 编辑 `AWESOME.md` 文件
3. 在合适的分类下添加你的推荐
4. 提交 Pull Request

**推荐格式**：

```markdown
- **[skill-name](https://github.com/author/repo)** by author-name
  - 说明：简短描述
  - 安装：`claude skill add https://...`
  - 功能：主要功能列表
```

**推荐标准**：
- ✅ 开源项目（MIT、Apache 2.0、BSD等）
- ✅ 有清晰的文档
- ✅ 项目活跃（6个月内有更新）
- ✅ 功能实用、质量可靠

### 3. 贡献MCP服务器

如果你开发了MCP服务器，可以添加到 `mcp-servers/` 目录：

**步骤**：
1. Fork 此仓库
2. 在 `mcp-servers/` 下创建子目录
3. 添加你的MCP服务器代码
4. 包含 `README.md` 说明安装和使用方法
5. 提交 Pull Request

**MCP服务器要求**：
- 遵循 [MCP规范](https://modelcontextprotocol.io/specification/2025-11-25)
- 包含清晰的安装和配置说明
- 提供使用示例
- 处理错误情况

### 4. 改进文档

发现文档有误或需要改进？欢迎提交PR！

## Pull Request 指南

### PR检查清单

在提交PR之前，请确保：

- [ ] 我已阅读并遵循贡献指南
- [ ] 代码/内容符合格式要求
- [ ] 包含必要的文档和说明
- [ ] SKILL.md包含完整的frontmatter（如适用）
- [ ] 链接有效且指向正确的资源（如适用）
- [ ] 提交信息清晰描述了改动

### PR模板

```markdown
## 改动类型
- [ ] 添加新skill
- [ ] 推荐第三方工具
- [ ] 添加MCP服务器
- [ ] 文档改进
- [ ] Bug修复
- [ ] 其他

## 描述
[清楚描述你的改动]

## 测试
[如何测试这些改动]
```

## Skill开发最佳实践

### SKILL.md结构

一个好的SKILL.md应该包含：

1. **清晰的description** - 说明何时使用这个skill
2. **功能说明** - 详细解释skill做什么
3. **使用方法** - 如何使用skill
4. **示例** - 具体的使用示例
5. **限制** - 说明skill的局限性（如果有）

### 目录结构建议

```
skills/my-skill/
├── SKILL.md           # 必需
├── README.md          # 推荐 - 额外的说明
├── scripts/           # 可选 - 可执行脚本
│   └── helper.py
├── references/        # 可选 - 参考文档
│   └── api-docs.md
└── assets/           # 可选 - 资源文件
    └── template.json
```

## 代码规范

- 使用清晰的变量和函数命名
- 添加适当的注释
- 保持代码简洁易读
- 处理错误情况

## 获取帮助

有问题？可以通过以下方式获取帮助：

- 提交 [Issue](https://github.com/your-username/awesome-coding-agents/issues)
- 查看 [文档](./README.md)
- 参考现有的skills示例

## 行为准则

我们致力于提供友好、安全和包容的环境：

- 尊重不同观点和经验
- 优雅地接受建设性批评
- 专注于对社区最有利的事情
- 对其他社区成员表示同理心

## 许可证

通过贡献代码，你同意你的贡献将使用与本项目相同的 [MIT许可证](./LICENSE)。

推荐的第三方内容保持其原始许可证。

---

感谢你的贡献！🎉
