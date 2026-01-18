# Example Skill

这是一个示例skill，用于演示如何创建符合规范的Claude Code skill。

## 安装

### Claude Code
```bash
claude skill add https://github.com/your-username/awesome-coding-agents/tree/main/skills/example-skill
```

### Codex
```bash
$skill-installer https://github.com/your-username/awesome-coding-agents/tree/main/skills/example-skill
```

### 手动安装
```bash
# 克隆到本地skills目录
cd ~/.claude/skills
git clone https://github.com/your-username/awesome-coding-agents
ln -s awesome-coding-agents/skills/example-skill example-skill
```

## 功能

- ✅ 展示正确的SKILL.md格式
- ✅ 演示目录结构组织
- ✅ 提供可复用的模板
- ✅ 包含最佳实践指南

## 使用方法

1. **作为参考** - 查看SKILL.md了解格式
2. **作为模板** - 复制并修改创建新skill
3. **学习示例** - 理解skill的组织方式

## 目录结构

```
example-skill/
├── SKILL.md                # 主要skill定义
├── README.md               # 本文件
├── scripts/                # 示例脚本
│   └── example.py
└── references/             # 参考文档
    ├── skill-development-guide.md
    └── format-spec.md
```

## 文件说明

- **SKILL.md**: 包含YAML frontmatter和markdown内容，这是Claude Code识别和加载skill的核心文件
- **README.md**: 额外的说明文档，帮助用户理解和使用skill
- **scripts/**: 存放可执行脚本，可被Claude调用
- **references/**: 存放详细文档、API规范等参考资料

## 贡献

欢迎改进此示例！如果你有更好的建议或发现问题，请提交PR。

## 许可证

MIT License
