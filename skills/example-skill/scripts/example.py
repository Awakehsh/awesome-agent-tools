#!/usr/bin/env python3
"""
示例脚本 - 展示如何在skill中使用Python脚本

这个脚本演示了：
1. 如何编写可被Claude调用的脚本
2. 基本的错误处理
3. 清晰的输入输出
"""

import sys
import json


def process_example(input_data):
    """
    处理输入数据的示例函数

    Args:
        input_data: 输入数据（字符串或JSON）

    Returns:
        处理后的结果
    """
    try:
        # 尝试解析为JSON
        if isinstance(input_data, str):
            data = json.loads(input_data)
        else:
            data = input_data

        # 这里添加你的处理逻辑
        result = {
            "status": "success",
            "processed": data,
            "message": "处理完成"
        }

        return result

    except json.JSONDecodeError as e:
        return {
            "status": "error",
            "message": f"JSON解析失败: {str(e)}"
        }
    except Exception as e:
        return {
            "status": "error",
            "message": f"处理失败: {str(e)}"
        }


def main():
    """主函数"""
    if len(sys.argv) < 2:
        print(json.dumps({
            "status": "error",
            "message": "用法: python example.py <input_data>"
        }))
        sys.exit(1)

    input_data = sys.argv[1]
    result = process_example(input_data)
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
