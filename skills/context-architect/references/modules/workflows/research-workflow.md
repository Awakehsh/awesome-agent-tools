# Research Workflow Template

Based on Anthropic's research agent patterns.

## Process Diagram

```
[Request Analysis]
       ↓
[Query Classification] → Depth-first / Breadth-first / Direct
       ↓
[Search Strategy]
       ↓
[Parallel Information Gathering] ← Multiple agents
       ↓
[Result Synthesis]
       ↓
[Quality Verification]
       ↓
[Structured Report]
```

## Stage 1: Request Analysis

```markdown
### Analyze Research Request

**Extract:**
- Core question or objective
- Required depth and scope
- Time/resource constraints
- Output format requirements

**Identify:**
- Knowledge domains involved
- Potential information sources
- Success criteria
```

## Stage 2: Query Classification

```markdown
### Classify Query Type

**Depth-First (Comprehensive)**
- Single topic requiring exhaustive coverage
- Example: "Explain the complete OAuth 2.0 flow"
- Strategy: Deep dive into one area

**Breadth-First (Survey)**
- Multiple topics requiring overview
- Example: "Compare top 5 authentication methods"
- Strategy: Parallel investigation of multiple areas

**Direct (Specific Fact)**
- Precise answer to well-defined question
- Example: "What is the current version of React?"
- Strategy: Single targeted query
```

## Stage 3: Search Strategy

```markdown
### Design Search Plan

For each identified sub-question:

1. **Formulate queries**
   - Primary query (most direct)
   - Alternative phrasings
   - Related terms

2. **Prioritize sources**
   - Official documentation
   - Recent discussions (GitHub, forums)
   - Academic papers
   - Industry blogs

3. **Set depth limits**
   - Max sources per query: [N]
   - Max depth of follow-up: [N]
```

## Stage 4: Parallel Information Gathering

```markdown
### Execute Research (Multi-Agent)

**For each sub-question:**
- Assign to specialist agent
- Provide: query + source priorities + depth limit
- Expected output: structured findings + sources

**Synchronization:**
- Wait for all critical queries
- Proceed with partial results if non-critical queries timeout
```

## Stage 5: Result Synthesis

```markdown
### Aggregate and Synthesize

**Combine findings:**
1. Group by theme/category
2. Identify contradictions → flag for verification
3. Extract common patterns
4. Fill gaps with follow-up queries (if needed)

**Create coherent narrative:**
- Introduction: Context and scope
- Body: Organized findings
- Conclusion: Key takeaways
```

## Stage 6: Quality Verification

```markdown
### Verify Output Quality

**Check:**
- [ ] All sub-questions addressed
- [ ] Sources cited for key claims
- [ ] No contradictory statements
- [ ] Confidence levels indicated for uncertain info
- [ ] Output format matches requirements

**If quality insufficient:**
→ Identify gaps → Trigger focused follow-up → Re-synthesize
```

## Stage 7: Structured Report

```markdown
### Format Final Output

**Standard Structure:**

## Summary
[2-3 sentence overview]

## Findings
[Organized by category/theme]

## [Optional: Comparison/Analysis]
| Aspect | Option A | Option B |
|--------|----------|----------|
| ...    | ...      | ...      |

## Sources
- [Title](URL) - Brief description
- [Title](URL) - Brief description

## Confidence & Limitations
- High confidence: [Topics]
- Needs verification: [Topics]
- Not found: [Gaps]
```

## Error Handling

```markdown
### Common Issues

**No results found:**
→ Rephrase query with synonyms
→ Broaden search scope
→ Report gap to user

**Contradictory information:**
→ Present both perspectives
→ Indicate source quality/recency
→ Flag for user judgment

**Timeout/Source unavailable:**
→ Use cached/alternative sources
→ Note limitation in report
→ Suggest manual verification
```

## Parameters to Customize

- `[N]` Max sources: Adjust based on thoroughness requirements
- Query classification thresholds
- Source prioritization rules
- Report structure based on domain
- Confidence indicators format
