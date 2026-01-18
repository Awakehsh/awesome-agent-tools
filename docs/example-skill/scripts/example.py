#!/usr/bin/env python3
"""
Example script - demonstrates how to use a Python script in a skill.

This script demonstrates:
1. How to write a script an agent can invoke
2. Basic error handling
3. Clear input/output
"""

import sys
import json


def process_example(input_data):
    """
    Example function that processes input data.

    Args:
        input_data: Input data (string or JSON)

    Returns:
        Processed result
    """
    try:
        # Try parsing input as JSON
        if isinstance(input_data, str):
            data = json.loads(input_data)
        else:
            data = input_data

        # Add your processing logic here
        result = {
            "status": "success",
            "processed": data,
            "message": "Processing complete"
        }

        return result

    except json.JSONDecodeError as e:
        return {
            "status": "error",
            "message": f"Failed to parse JSON: {str(e)}"
        }
    except Exception as e:
        return {
            "status": "error",
            "message": f"Processing failed: {str(e)}"
        }


def main():
    """Main entrypoint."""
    if len(sys.argv) < 2:
        print(json.dumps({
            "status": "error",
            "message": "Usage: python example.py <input_data>"
        }))
        sys.exit(1)

    input_data = sys.argv[1]
    result = process_example(input_data)
    print(json.dumps(result, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
