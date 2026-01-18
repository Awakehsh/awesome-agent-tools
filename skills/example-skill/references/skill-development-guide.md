# Skill开发指南

本指南介绍如何创建高质量的Claude Code skill。

## 基础概念

### 什么是Skill？

Skill是一个包含指令、工作流程和可选资源的包，帮助Claude更好地完成特定任务。

### Skill的组成

1. **SKILL.md** (必需) - 核心定义文件
2. **scripts/** (可选) - 可执行代码
3. **references/** (可选) - 参考文档
4. **assets/** (可选) - 资源文件

## SKILL.md格式

### YAML Frontmatter

```yaml
---
name: skill-name              # 必需：唯一标识符
description: |                # 必需：详细描述
  何时使用此skill的说明。
  应该清楚地描述触发条件和使用场景。
license: MIT                  # 可选：许可证
version: 1.0.0               # 可选：版本号
author: Your Name            # 可选：作者
---
```

### Markdown内容

```markdown
# Skill Title

## 功能说明
[详细说明skill做什么]

## 使用方法
[如何使用skill]

## 示例
[具体示例]

## 限制
[局限性说明]
```

## 最佳实践

### 1. 清晰的Description

描述应该回答：
- 何时使用此skill？
- 解决什么问题？
- 适用什么场景？

**好例子**：
```yaml
description: |
  当需要处理PDF文件（提取文本、转换图片、填写表单）时使用。
  适用于文档处理、数据提取、表单自动化等场景。
```

**坏例子**：
```yaml
description: A PDF tool
```

### 2. 模块化设计

将复杂逻辑拆分为：
- **SKILL.md**: 工作流程和指导
- **scripts/**: 具体实现
- **references/**: 详细文档

### 3. 提供示例

包含至少2-3个实际使用示例，展示：
- 基本用法
- 常见场景
- 边缘情况

### 4. 错误处理

在scripts中实现良好的错误处理：
```python
try:
    # 主要逻辑
    result = process_data(input)
    return {"status": "success", "data": result}
except Exception as e:
    return {"status": "error", "message": str(e)}
```

### 5. 文档完整性

确保包含：
- [ ] 清晰的功能说明
- [ ] 使用方法
- [ ] 实际示例
- [ ] 限制说明
- [ ] 安装指南（README.md）

## 目录结构示例

### 简单Skill

```
simple-skill/
└── SKILL.md
```

### 中等Skill

```
medium-skill/
├── SKILL.md
├── README.md
└── scripts/
    ├── helper.py
    └── utils.js
```

### 复杂Skill

```
complex-skill/
├── SKILL.md
├── README.md
├── scripts/
│   ├── main.py
│   ├── helper.py
│   └── config.json
├── references/
│   ├── api-docs.md
│   ├── examples.md
│   └── troubleshooting.md
└── assets/
    ├── templates/
    │   └── default.json
    └── schemas/
        └── input-schema.json
```

## 测试Skill

### 本地测试

```bash
# 1. 复制到skills目录
cp -r your-skill ~/.claude/skills/

# 2. 重启Claude Code
# Claude会自动加载新skill

# 3. 测试触发
# 尝试使用符合description的请求
```

### 验证清单

- [ ] SKILL.md包含完整frontmatter
- [ ] description清晰描述使用场景
- [ ] 包含至少一个使用示例
- [ ] scripts可以独立运行（如果有）
- [ ] 文档完整且易懂
- [ ] 没有硬编码的路径或凭证

## 发布Skill

### 1. GitHub发布

```bash
git add .
git commit -m "Add new skill: skill-name"
git push origin main
```

### 2. 添加到Marketplace

确保repo包含`.claude-plugin/marketplace.json`

### 3. 社区分享

- 提交到awesome lists
- 在Discord/论坛分享
- 写博客介绍

## 常见问题

### Q: Skill多大合适？

**A**: 保持SKILL.md在5000字以内，详细内容放references/。

### Q: 何时使用scripts/？

**A**: 当有可复用的计算逻辑、需要调用外部API或处理复杂数据时。

### Q: 如何处理敏感信息？

**A**:
- 不要在代码中硬编码
- 使用环境变量
- 在文档中说明配置要求

### Q: Skill可以调用其他skill吗？

**A**: 可以，但要在文档中说明依赖关系。

## 进阶话题

### 性能优化

- 避免在SKILL.md中包含大量数据
- 使用references/存储大型文档
- scripts应该快速响应

### 安全考虑

- 验证输入
- 避免执行任意代码
- 限制文件系统访问
- 清晰说明权限需求

### 版本管理

使用语义化版本：
- MAJOR: 不兼容的改动
- MINOR: 向后兼容的功能
- PATCH: 向后兼容的修复

## 参考资源

- [Claude Code文档](https://code.claude.com/docs/en/skills)
- [官方Skills仓库](https://github.com/anthropics/skills)
- [社区示例](https://github.com/heilcheng/awesome-agent-skills)
