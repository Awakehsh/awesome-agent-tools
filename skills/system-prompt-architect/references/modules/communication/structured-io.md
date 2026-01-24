# Structured Input/Output Protocol

## Purpose

Standardize data exchange between agents to ensure:
- No information loss during handoffs
- Easy parsing and validation
- Clear context boundaries
- Efficient token usage

## Message Structure

```markdown
### Standard Agent Message Format

**Header:**
- From: [Agent ID/Type]
- To: [Agent ID/Type]
- Message ID: [Unique identifier]
- In-Reply-To: [Parent message ID, if applicable]
- Timestamp: [ISO 8601 format]

**Body:**
[Message content following domain-specific schema]

**Metadata:**
- Status: [Success/Partial/Failed/Pending]
- Confidence: [0.0-1.0 or High/Medium/Low]
- Tokens Used: [Approximate count]
- Processing Time: [Seconds]

**Attachments:** (Optional)
- [Data/files referenced but not embedded]
```

## Output Schemas

### Research Agent Output

```json
{
  "query": "Original research question",
  "findings": [
    {
      "claim": "Statement or fact discovered",
      "source": "URL or reference",
      "confidence": "high|medium|low",
      "evidence": "Supporting quote or data"
    }
  ],
  "summary": "2-3 sentence synthesis",
  "gaps": ["Unanswered questions"],
  "contradictions": [
    {
      "claim_a": "First statement",
      "claim_b": "Conflicting statement",
      "resolution": "How to reconcile or which to trust"
    }
  ]
}
```

### Code Implementation Agent Output

```json
{
  "task": "Feature or fix description",
  "files_modified": [
    {
      "path": "relative/path/to/file",
      "changes": "Brief description",
      "diff_summary": "+N lines, -M lines"
    }
  ],
  "tests_added": ["Test descriptions"],
  "dependencies_added": ["package@version"],
  "breaking_changes": ["API changes requiring user action"],
  "verification_steps": ["How to confirm it works"]
}
```

### Evaluator Agent Output

```json
{
  "evaluated_item": "Reference to what was evaluated",
  "criteria": ["List of evaluation dimensions"],
  "scores": {
    "criterion_1": {"score": 8.5, "max": 10, "justification": "Why"},
    "criterion_2": {"score": 7.0, "max": 10, "justification": "Why"}
  },
  "overall_assessment": "Pass|Fail|NeedsWork",
  "strengths": ["Positive aspects"],
  "weaknesses": ["Areas for improvement"],
  "action_items": ["Specific fixes required"]
}
```

## Context Propagation

```markdown
### What to Include in Context

**Always include:**
- Original user request (root context)
- Current task objective
- Relevant prior results

**Never include:**
- Entire conversation history (bloat)
- Redundant information from earlier steps
- Execution logs or debug output

**Example:**

❌ **Bad (Bloated):**
```
Context: User asked about authentication. Agent 1 researched OAuth
(full 2000 word report here). Agent 2 researched JWT (full 1500 word
report here). Agent 3 researched session tokens (full 1800 word report).
Your task: Compare the three methods.
```

✅ **Good (Compact):**
```
Context: User needs authentication method comparison.
Findings:
- OAuth 2.0: Best for third-party integrations [ref:agent1_report]
- JWT: Stateless, good for microservices [ref:agent2_report]
- Sessions: Simple, server-side state [ref:agent3_report]
Your task: Create comparison table with security, complexity, use cases.
```

## Data Format Conventions

### Markdown

**Use for:** Human-readable reports, documentation, structured text

```markdown
## Section Title
- Bullet point 1
- Bullet point 2

**Bold** for emphasis
*Italic* for terminology
`code` for technical terms

| Column 1 | Column 2 |
|----------|----------|
| Value    | Value    |
```

### JSON

**Use for:** Structured data, API responses, configuration

```json
{
  "snake_case_keys": "Preferred naming",
  "nested": {
    "structures": "Allowed but keep shallow"
  },
  "arrays": ["item1", "item2"],
  "null_for_missing": null,
  "no_comments": "JSON doesn't support them"
}
```

### YAML

**Use for:** Configuration files, multi-line strings

```yaml
key: value
nested:
  key: value
list:
  - item1
  - item2
multiline: |
  This is a long
  multiline string
  that preserves newlines
```

### XML

**Use for:** When required by external systems, structured documents

```xml
<root>
  <element attribute="value">
    <nested>Content</nested>
  </element>
</root>
```

## Token Efficiency

```markdown
### Minimize Token Usage

**Techniques:**

1. **Avoid redundancy**
   - Don't repeat information already in context
   - Reference instead of re-stating

2. **Use compact syntax**
   - Bullet points over paragraphs
   - Tables over verbose descriptions
   - Abbreviations when unambiguous

3. **Structured over prose**
   ❌ "The analysis revealed several important findings including that users prefer feature A, and also showed that feature B has poor adoption"
   ✅ "Findings: Feature A - high preference | Feature B - low adoption"

4. **Truncate when appropriate**
   - Summarize long documents
   - Extract key points only
   - Link to full content instead of embedding
```

## Validation

```markdown
### Output Validation Rules

Before sending to next agent:

**Schema compliance:**
- [ ] All required fields present
- [ ] Types match specification (string, number, array, etc.)
- [ ] Enums use allowed values only

**Data quality:**
- [ ] No null/undefined for required fields
- [ ] URLs are valid and accessible
- [ ] Dates in ISO 8601 format
- [ ] Numbers within reasonable ranges

**Context sufficiency:**
- [ ] Enough info for next agent to proceed
- [ ] References are resolvable
- [ ] Assumptions explicitly stated

**Error handling:**
- [ ] Status field indicates success/failure
- [ ] Error messages are actionable
- [ ] Partial results flagged appropriately
```

## Parameters to Customize

- Message header fields (add domain-specific metadata)
- Output schemas (define for your agent types)
- Data format preferences (JSON vs YAML vs custom)
- Token limits per message
- Validation rules based on domain requirements
