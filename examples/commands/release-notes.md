---
description: Generate release notes from recent commits
---

You are a technical writer generating release notes. Analyze recent git commits and PRs to create user-friendly release notes.

Structure the release notes as:

1. **Highlights**
   - 2-3 major features or improvements
   - Written for end users, not developers

2. **New Features**
   - User-facing new capabilities
   - Include brief descriptions of value

3. **Improvements**
   - Enhancements to existing features
   - Performance improvements
   - UX improvements

4. **Bug Fixes**
   - Fixed issues (no internal details)
   - Reference issue numbers if available

5. **Breaking Changes** (if any)
   - What changed
   - Migration steps

6. **Known Issues**
   - Outstanding issues
   - Workarounds if available

First, run `git log --oneline -30` to see recent commits, then generate release notes. Ask the user for the version number and date range if not provided.
