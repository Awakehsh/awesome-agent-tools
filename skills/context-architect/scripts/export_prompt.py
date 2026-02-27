#!/usr/bin/env python3
"""
Multi-format system prompt exporter.

Converts system prompts to various formats: Markdown, JSON, YAML, XML, Plain Text.
"""

import json
import yaml
import xml.etree.ElementTree as ET
from typing import Dict, Any
from datetime import datetime
from pathlib import Path


class PromptExporter:
    """Export system prompts to multiple formats."""

    def __init__(self, prompt_data: Dict[str, Any]):
        """
        Initialize exporter with prompt data.

        Args:
            prompt_data: Dictionary containing:
                - metadata: Dict with name, type, domain, version, created
                - sections: Dict with section_name: content pairs
        """
        self.prompt_data = prompt_data
        self.metadata = prompt_data.get('metadata', {})
        self.sections = prompt_data.get('sections', {})

    def to_markdown(self) -> str:
        """Export to Markdown format."""
        lines = []

        # Header with metadata
        lines.append(f"# {self.metadata.get('name', 'Agent')} System Prompt\n")
        lines.append("<!-- Metadata")
        for key, value in self.metadata.items():
            lines.append(f"{key}: {value}")
        lines.append("-->\n")

        # Sections
        for section_name, content in self.sections.items():
            title = section_name.replace('_', ' ').title()
            lines.append(f"## {title}\n")
            lines.append(f"{content}\n")
            lines.append("---\n")

        return '\n'.join(lines)

    def to_json(self, indent: int = 2) -> str:
        """Export to JSON format."""
        return json.dumps(self.prompt_data, indent=indent, ensure_ascii=False)

    def to_yaml(self) -> str:
        """Export to YAML format."""
        return yaml.dump(
            self.prompt_data,
            default_flow_style=False,
            allow_unicode=True,
            sort_keys=False
        )

    def to_txt(self) -> str:
        """Export to plain text (prompt only, no metadata)."""
        lines = []

        for section_name, content in self.sections.items():
            lines.append(content)
            lines.append("")  # Blank line between sections

        return '\n'.join(lines).strip()

    def to_xml(self) -> str:
        """Export to XML format."""
        root = ET.Element('system_prompt')

        # Metadata
        metadata_elem = ET.SubElement(root, 'metadata')
        for key, value in self.metadata.items():
            elem = ET.SubElement(metadata_elem, key)
            elem.text = str(value)

        # Sections
        sections_elem = ET.SubElement(root, 'sections')
        for section_name, content in self.sections.items():
            section_elem = ET.SubElement(sections_elem, 'section')
            section_elem.set('name', section_name)
            section_elem.text = content

        # Pretty print
        ET.indent(root, space='  ')
        return ET.tostring(root, encoding='unicode', method='xml')

    def export(self, format: str, output_path: str):
        """
        Export prompt to specified format and save to file.

        Args:
            format: One of 'md', 'json', 'yaml', 'txt', 'xml'
            output_path: Path to save the exported file
        """
        format_map = {
            'md': self.to_markdown,
            'json': self.to_json,
            'yaml': self.to_yaml,
            'txt': self.to_txt,
            'xml': self.to_xml
        }

        if format not in format_map:
            raise ValueError(f"Unsupported format: {format}. Choose from: {list(format_map.keys())}")

        content = format_map[format]()

        Path(output_path).parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(content)

        return output_path

    def export_all(self, base_name: str, output_dir: str = '.'):
        """
        Export to all supported formats.

        Args:
            base_name: Base filename (without extension)
            output_dir: Directory to save exports

        Returns:
            Dict mapping format to file path
        """
        formats = ['md', 'json', 'yaml', 'txt', 'xml']
        exports = {}

        for fmt in formats:
            filename = f"{base_name}.{fmt}"
            output_path = Path(output_dir) / filename
            self.export(fmt, str(output_path))
            exports[fmt] = str(output_path)

        return exports


# Example usage
if __name__ == "__main__":
    # Example prompt data
    example_data = {
        "metadata": {
            "name": "Research Agent",
            "type": "Worker",
            "domain": "Information Gathering",
            "version": "1.0",
            "created": datetime.now().isoformat()
        },
        "sections": {
            "role_definition": "You are a Research Agent specialized in web-based information gathering.",
            "workflow": "1. Analyze query\n2. Execute searches\n3. Synthesize findings",
            "communication": "Output JSON with findings and sources",
            "quality": "Verify sources, cross-reference claims"
        }
    }

    exporter = PromptExporter(example_data)

    # Export all formats
    exports = exporter.export_all("research-agent", "./exports")

    print("Exported to:")
    for fmt, path in exports.items():
        print(f"  - {fmt}: {path}")
