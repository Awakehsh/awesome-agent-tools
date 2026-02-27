# Evaluation Criteria Module

## Purpose

Define standardized quality assessment frameworks for agent outputs.

## General Quality Framework

### Dimension 1: Completeness
**Measures:** Coverage of requirements

**Assessment Questions:**
- Are all specified requirements addressed?
- Are there obvious gaps or omissions?
- Is depth appropriate for the task?

**Scoring Guide:**
- 9-10: Exceeds requirements, comprehensive
- 7-8: Meets all requirements fully
- 5-6: Meets most requirements, minor gaps
- 3-4: Missing significant elements
- 0-2: Incomplete, unusable

### Dimension 2: Accuracy
**Measures:** Correctness of information and logic

**Assessment Questions:**
- Are facts and data correct?
- Is reasoning logically sound?
- Are sources credible and properly cited?

**Scoring Guide:**
- 9-10: No errors, fully verified
- 7-8: Accurate with minor imperfections
- 5-6: Mostly accurate, some questionable claims
- 3-4: Significant errors present
- 0-2: Fundamentally incorrect

### Dimension 3: Coherence
**Measures:** Organization and clarity

**Assessment Questions:**
- Is structure logical and easy to follow?
- Are transitions smooth?
- Is presentation clear?

**Scoring Guide:**
- 9-10: Exceptionally clear and well-organized
- 7-8: Good structure and clarity
- 5-6: Understandable but could be clearer
- 3-4: Confusing structure or presentation
- 0-2: Incoherent or incomprehensible

### Dimension 4: Usefulness
**Measures:** Fitness for intended purpose

**Assessment Questions:**
- Does it solve the intended problem?
- Is it actionable/usable?
- Does it add value?

**Scoring Guide:**
- 9-10: Highly valuable, immediately usable
- 7-8: Useful with minor adjustments
- 5-6: Partially useful, needs refinement
- 3-4: Limited usefulness
- 0-2: Not useful for intended purpose

## Domain-Specific Criteria

### For Code Outputs

**Additional Dimensions:**
- **Correctness:** Does it work as intended? Tests pass?
- **Code Quality:** Readable, maintainable, follows standards?
- **Security:** No vulnerabilities or unsafe practices?
- **Performance:** Efficient, scalable?

### For Research Outputs

**Additional Dimensions:**
- **Depth:** Sufficient detail and analysis?
- **Recency:** Sources up-to-date?
- **Objectivity:** Balanced perspective, not biased?
- **Citation Quality:** Authoritative, verifiable sources?

### For Design Outputs

**Additional Dimensions:**
- **Feasibility:** Can it be implemented?
- **Scalability:** Will it work at scale?
- **Maintainability:** Easy to modify and extend?
- **User Experience:** Intuitive and user-friendly?

## Composite Scoring

### Weighted Average
When criteria have different importance:

```
Overall Score = (C1 × W1 + C2 × W2 + ... + Cn × Wn) / (W1 + W2 + ... + Wn)

Where:
C = Criterion score
W = Weight (importance factor)
```

Example:
```
Completeness: 8.0 (weight: 2)
Accuracy: 9.0 (weight: 3)
Coherence: 7.0 (weight: 1)

Overall = (8×2 + 9×3 + 7×1) / (2+3+1)
        = (16 + 27 + 7) / 6
        = 50 / 6
        = 8.33
```

### Must-Pass Criteria
Some criteria may be mandatory:

```
IF any must-pass criterion < threshold THEN
    Overall = Fail
ELSE
    Overall = Weighted Average
END
```

## Feedback Guidelines

### Actionable Feedback Format

**For each weakness identified:**

```markdown
**Issue:** [Specific problem]
**Impact:** [Why it matters]
**Recommendation:** [Concrete fix]
**Priority:** [High/Medium/Low]
**Effort:** [Small/Medium/Large]
```

**Example:**
```markdown
**Issue:** JWT token validation missing signature verification
**Impact:** Security vulnerability allowing token forgery
**Recommendation:** Add `verify=True` parameter to jwt.decode() call in auth.py:45
**Priority:** High
**Effort:** Small
```

### Positive Feedback
Also highlight strengths:

```markdown
**Strength:** [What was done well]
**Why valuable:** [Benefit or impact]
```

## Calibration

**Maintain consistency across evaluations:**

1. **Anchor examples:** Define reference outputs at each score level
2. **Blind evaluation:** Assess without knowing previous scores
3. **Cross-validation:** Have multiple evaluators score same output
4. **Trend tracking:** Monitor average scores over time to detect drift

## Usage in System Prompts

```markdown
### Quality Evaluation

Assess outputs using these criteria:

1. **Completeness** (Weight: 2)
   - Score 0-10
   - [Scoring guide from above]

2. **Accuracy** (Weight: 3)
   - Score 0-10
   - [Scoring guide from above]

[Continue for all criteria...]

**Overall Assessment:**
- Pass: All criteria >= 7.0, weighted average >= 7.5
- NeedsWork: Any criterion < 7.0
- Fail: Any criterion < 5.0

**Output Format:**
[Use evaluator.md output schema]
```

## Parameters to Customize

- Number and type of evaluation dimensions
- Scoring scale (0-10, percentage, etc.)
- Criterion weights
- Pass/fail thresholds
- Must-pass criteria
- Domain-specific additions
