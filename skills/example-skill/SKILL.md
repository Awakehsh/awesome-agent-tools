---
name: example-skill
description: 这是一个示例skill，展示正确的SKILL.md格式。当用户想了解如何创建skill时使用此示例作为参考。包含所有必需和推荐的部分。
---

# Example Skill

这是一个示例skill，用于演示正确的SKILL.md格式和最佳实践。

## 功能说明

此skill展示了如何：
- 编写符合格式的SKILL.md文件
- 组织skill目录结构
- 添加脚本和参考资料
- 提供清晰的文档和示例

## 使用时机

在以下场景使用此skill：
- 你想创建新的Claude Code skill
- 你需要了解SKILL.md的正确格式
- 你想参考skill的目录结构

## 核心组件

### SKILL.md格式

```yaml
---
name: skill-name
description: 详细描述，包括使用场景
---
```

### 目录结构

```
skill-name/
├── SKILL.md           # 必需
├── README.md          # 推荐
├── scripts/           # 可选
│   └── helper.py
├── references/        # 可选
│   └── docs.md
└── assets/           # 可选
    └── template.json
```

## 使用示例

### 示例 1: 创建基础skill

```bash
mkdir my-skill
cd my-skill
touch SKILL.md
```

在SKILL.md中添加：
```yaml
---
name: my-skill
description: 我的skill描述
---

# My Skill

[添加详细说明...]
```

### 示例 2: 添加脚本

```bash
mkdir scripts
# 添加你的Python或JavaScript脚本
```

### 示例 3: 添加参考资料

```bash
mkdir references
# 添加API文档、配置示例等
```

## 最佳实践

1. **清晰的描述** - 在frontmatter中明确说明使用场景
2. **结构化内容** - 使用标题和列表组织内容
3. **具体示例** - 提供可执行的代码示例
4. **参考资料** - 将详细文档放在references/目录
5. **可复用脚本** - 将代码放在scripts/目录

## 限制

- 此skill仅作为示例和参考
- 不提供实际的功能实现
- 需要根据具体需求进行修改

## 参考资源

查看 `references/` 目录获取：
- [Skill开发指南](references/skill-development-guide.md)
- [格式规范](references/format-spec.md)

## 下一步

1. 复制此skill作为模板
2. 修改name和description
3. 添加你的实际功能
4. 测试并验证
5. 分享给社区！

---

创建者：Awesome Coding Agents
许可证：MIT
