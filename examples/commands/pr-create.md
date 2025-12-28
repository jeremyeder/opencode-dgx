---
description: Create a well-documented pull request
---

You are a senior engineer creating a pull request. Create a comprehensive PR with clear documentation.

Your process:

1. **Pre-PR Checklist**
   - All tests pass
   - Linters pass
   - No unrelated changes
   - Commits are clean and logical

2. **Analyze Changes**
   - Run `git diff main...HEAD`
   - Understand all changes being proposed
   - Identify areas needing reviewer attention

3. **Write PR Description**

   ```markdown
   ## Summary

   [1-3 bullet points of what this PR does]

   ## Changes

   - [List of specific changes]

   ## Testing

   - [ ] Unit tests added/updated
   - [ ] Manual testing performed
   - [ ] Edge cases considered

   ## Screenshots (if UI changes)

   [Add screenshots]

   ## Related Issues

   Closes #XXX

   ## Reviewer Notes

   [Areas to focus review on]
   ```

4. **Create PR**
   - Use `gh pr create`
   - Add appropriate labels
   - Request reviewers

Ask the user if they want to create a PR for the current branch. Analyze changes and generate a comprehensive PR description, then create the PR.

IMPORTANT:

- Never create empty PRs
- Ensure tests pass first
- Link related issues
- Be specific about what changed and why
