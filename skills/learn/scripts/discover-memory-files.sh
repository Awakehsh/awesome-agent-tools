#!/bin/bash
# discover-memory-files.sh
# Discovers all memory files in current project and home directory
# Usage: ./discover-memory-files.sh [path]

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default search path
SEARCH_PATH="${1:-.}"

echo -e "${BLUE}🔍 Discovering Memory Files${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

# Initialize counters
PRIMARY_COUNT=0
SPECIALIZED_COUNT=0

echo -e "${GREEN}📍 Primary Memory Files${NC}"
echo "----------------------------------------"

# Search for primary memory files in project
while IFS= read -r file; do
    if [ -f "$file" ]; then
        size=$(wc -c < "$file" | tr -d ' ')
        modified=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$file" 2>/dev/null || stat -c "%y" "$file" 2>/dev/null | cut -d. -f1)
        lines=$(wc -l < "$file" | tr -d ' ')

        # Detect platform
        platform=""
        if [[ "$file" == *"CLAUDE.md" ]]; then
            platform="Claude Code"
        elif [[ "$file" == *"AGENTS.md" ]]; then
            platform="Codex"
        elif [[ "$file" == *".cursorrules" ]]; then
            platform="Cursor"
        elif [[ "$file" == *".agentrules" ]]; then
            platform="Generic"
        elif [[ "$file" == *".agent/rules/project-rules.md" ]]; then
            platform="Gemini"
        fi

        echo -e "  ${GREEN}✓${NC} $file"
        echo -e "    Platform: ${YELLOW}$platform${NC}"
        echo -e "    Size: ${size} bytes | Lines: ${lines}"
        echo -e "    Modified: ${modified}"
        echo ""

        PRIMARY_COUNT=$((PRIMARY_COUNT + 1))
    fi
done < <(find "$SEARCH_PATH" -maxdepth 3 \( -name "CLAUDE.md" -o -name "AGENTS.md" -o -name ".cursorrules" -o -name ".agentrules" \) 2>/dev/null)

# Search for project-rules.md in .agent/rules
if [ -f "$SEARCH_PATH/.agent/rules/project-rules.md" ]; then
    file="$SEARCH_PATH/.agent/rules/project-rules.md"
    size=$(wc -c < "$file" | tr -d ' ')
    modified=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$file" 2>/dev/null || stat -c "%y" "$file" 2>/dev/null | cut -d. -f1)
    lines=$(wc -l < "$file" | tr -d ' ')

    echo -e "  ${GREEN}✓${NC} $file"
    echo -e "    Platform: ${YELLOW}Gemini${NC}"
    echo -e "    Size: ${size} bytes | Lines: ${lines}"
    echo -e "    Modified: ${modified}"
    echo ""

    PRIMARY_COUNT=$((PRIMARY_COUNT + 1))
fi

# Check home directory
echo -e "${GREEN}📍 Home Directory Memory Files${NC}"
echo "----------------------------------------"

for file in ~/CLAUDE.md ~/AGENTS.md ~/.cursorrules ~/.agentrules; do
    if [ -f "$file" ]; then
        size=$(wc -c < "$file" | tr -d ' ')
        modified=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$file" 2>/dev/null || stat -c "%y" "$file" 2>/dev/null | cut -d. -f1)
        lines=$(wc -l < "$file" | tr -d ' ')

        # Detect platform
        platform=""
        if [[ "$file" == *"CLAUDE.md" ]]; then
            platform="Claude Code"
        elif [[ "$file" == *"AGENTS.md" ]]; then
            platform="Codex"
        elif [[ "$file" == *".cursorrules" ]]; then
            platform="Cursor"
        elif [[ "$file" == *".agentrules" ]]; then
            platform="Generic"
        fi

        echo -e "  ${GREEN}✓${NC} $file"
        echo -e "    Platform: ${YELLOW}$platform${NC}"
        echo -e "    Size: ${size} bytes | Lines: ${lines}"
        echo -e "    Modified: ${modified}"
        echo ""

        PRIMARY_COUNT=$((PRIMARY_COUNT + 1))
    fi
done

# Search for specialized documentation
echo -e "${GREEN}📚 Specialized Documentation${NC}"
echo "----------------------------------------"

if [ -d "$SEARCH_PATH/.agent/rules" ]; then
    while IFS= read -r file; do
        # Skip project-rules.md as it's already counted
        if [[ "$file" == *"project-rules.md" ]]; then
            continue
        fi

        size=$(wc -c < "$file" | tr -d ' ')
        modified=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$file" 2>/dev/null || stat -c "%y" "$file" 2>/dev/null | cut -d. -f1)
        lines=$(wc -l < "$file" | tr -d ' ')
        basename=$(basename "$file")

        echo -e "  ${BLUE}•${NC} $file"
        echo -e "    Type: Domain-specific"
        echo -e "    Size: ${size} bytes | Lines: ${lines}"
        echo -e "    Modified: ${modified}"
        echo ""

        SPECIALIZED_COUNT=$((SPECIALIZED_COUNT + 1))
    done < <(find "$SEARCH_PATH/.agent/rules" -name "*.md" -type f 2>/dev/null)
fi

# Search for skill README files
if [ -d "$HOME/.claude/skills" ]; then
    echo -e "${GREEN}🎯 Skill Documentation${NC}"
    echo "----------------------------------------"

    while IFS= read -r file; do
        size=$(wc -c < "$file" | tr -d ' ')
        modified=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M" "$file" 2>/dev/null || stat -c "%y" "$file" 2>/dev/null | cut -d. -f1)
        lines=$(wc -l < "$file" | tr -d ' ')
        skill_name=$(basename "$(dirname "$file")")

        echo -e "  ${BLUE}•${NC} $file"
        echo -e "    Skill: ${YELLOW}$skill_name${NC}"
        echo -e "    Size: ${size} bytes | Lines: ${lines}"
        echo -e "    Modified: ${modified}"
        echo ""

        SPECIALIZED_COUNT=$((SPECIALIZED_COUNT + 1))
    done < <(find "$HOME/.claude/skills" -name "README.md" -type f 2>/dev/null | head -10)
fi

# Summary
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}Summary${NC}"
echo "----------------------------------------"
echo -e "Primary Memory Files: ${GREEN}${PRIMARY_COUNT}${NC}"
echo -e "Specialized Docs: ${BLUE}${SPECIALIZED_COUNT}${NC}"
echo -e "Total: ${YELLOW}$((PRIMARY_COUNT + SPECIALIZED_COUNT))${NC}"
echo ""

# Recommendations
if [ $PRIMARY_COUNT -eq 0 ]; then
    echo -e "${RED}⚠️  No primary memory files found!${NC}"
    echo -e "   Consider creating CLAUDE.md in project root or home directory"
    echo ""
fi

if [ ! -d "$SEARCH_PATH/.agent/rules" ]; then
    echo -e "${YELLOW}💡 Tip: Create .agent/rules/ directory for specialized documentation${NC}"
    echo ""
fi

echo -e "${BLUE}🎯 Platform Detection${NC}"
echo "----------------------------------------"

platforms_found=()
[ -f "$SEARCH_PATH/CLAUDE.md" ] || [ -f ~/CLAUDE.md ] && platforms_found+=("Claude Code")
[ -f "$SEARCH_PATH/AGENTS.md" ] || [ -f ~/AGENTS.md ] && platforms_found+=("Codex")
[ -f "$SEARCH_PATH/.cursorrules" ] || [ -f ~/.cursorrules ] && platforms_found+=("Cursor")
[ -f "$SEARCH_PATH/.agent/rules/project-rules.md" ] && platforms_found+=("Gemini")

if [ ${#platforms_found[@]} -eq 0 ]; then
    echo -e "${YELLOW}No platform-specific configs found${NC}"
else
    echo -e "Detected platforms: ${GREEN}${platforms_found[*]}${NC}"
fi

echo ""
echo -e "${BLUE}✨ Discovery complete!${NC}"
