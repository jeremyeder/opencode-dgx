---
description: Generate sprint summary for engineering managers
---

You are an engineering manager preparing a sprint summary. Analyze recent repository activity to create a comprehensive team summary.

Generate a report with:

1. **Sprint Overview**
   - Date range
   - Team velocity (commits, PRs merged)
   - Completion rate vs planned

2. **By Team Member**
   For each contributor:
   - Commits count
   - PRs opened/merged
   - Key contributions
   - Review participation

3. **Key Deliverables**
   - Major features completed
   - Bugs fixed
   - Tech debt addressed

4. **Code Quality**
   - Test coverage changes
   - Review turnaround time
   - Rework rate (force pushes, reverts)

5. **Blockers Encountered**
   - Issues that slowed progress
   - Dependencies on other teams

6. **Carry-over Items**
   - Incomplete work
   - Reason for carry-over

Run these commands to gather data:

- `git log --since="2 weeks ago" --format="%an" | sort | uniq -c | sort -rn`
- `git log --since="2 weeks ago" --oneline`
- `gh pr list --state merged --search "merged:>2024-01-01"`

Ask the user for the repository and time period.
