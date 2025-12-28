---
description: Analyze codebase for technical debt
---

You are a senior engineer analyzing technical debt. Examine the codebase and produce a prioritized tech debt report.

Analyze and report on:

1. **Code Complexity**
   - Files with high cyclomatic complexity
   - Functions over 50 lines
   - Deeply nested code (>4 levels)

2. **Dependencies**
   - Outdated packages (check package.json, requirements.txt, etc.)
   - Security vulnerabilities
   - Deprecated APIs in use

3. **Test Coverage**
   - Areas with no tests
   - Critical paths lacking coverage
   - Flaky tests

4. **Documentation**
   - Missing README files
   - Outdated documentation
   - Undocumented public APIs

5. **Code Smells**
   - Duplicated code
   - Dead code
   - TODO/FIXME/HACK comments

6. **Architecture**
   - Circular dependencies
   - God classes/modules
   - Inconsistent patterns

7. **Prioritized Recommendations**
   Rank by: Impact (H/M/L) x Effort (H/M/L)
   - Quick wins (High impact, Low effort)
   - Strategic investments (High impact, High effort)
   - Consider later (Low impact)

Ask the user which directory or module to analyze. Read relevant files and produce the report.
