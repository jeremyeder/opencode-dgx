# OpenCode Quickstart: Engineering Manager

Welcome to OpenCode on DGX! This guide helps Engineering Managers leverage AI-assisted workflows for team oversight, technical planning, and 1:1 preparation.

## Access

1. Connect to VPN
2. Navigate to https://192-168-1-190.nip.io
3. Sign in with your @redhat.com Google account

## Your Workflows

### Sprint Summary

```
/sprint-summary
```

Generate a summary of your team's recent activity:

- Commits by team member
- PRs merged/opened
- Key changes and their impact
- Blockers identified in commit messages

### Tech Debt Analysis

```
/tech-debt
```

Analyze a codebase for technical debt:

- Code complexity hotspots
- Outdated dependencies
- Missing tests
- Documentation gaps
- Suggested prioritization

### PR Review (Manager Lens)

```
/review-pr
```

Review a PR with focus on:

- Scope creep risk
- Timeline impact
- Cross-team dependencies
- Security/compliance considerations
- Knowledge transfer needs

### 1:1 Prep

```
/1on1-prep
```

Prepare for 1:1s with team members:

- Recent contributions
- PR review patterns
- Areas of focus
- Suggested talking points

## Setup Your Environment

Copy the EM commands to your OpenCode config:

```bash
# From your project directory
mkdir -p .opencode/command
cp /path/to/opencode-dgx/examples/commands/sprint-summary.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/tech-debt.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/review-pr-em.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/1on1-prep.md .opencode/command/
```

Or install globally:

```bash
mkdir -p ~/.config/opencode/command
cp /path/to/opencode-dgx/examples/commands/*.md ~/.config/opencode/command/
```

## Tips

- **Scope queries**: Specify date ranges, team members, or repos for focused analysis
- **Export to slides**: Outputs are formatted for easy copy to presentations
- **Combine with Jira**: Reference Jira tickets for richer context
- **Balanced access**: Your EM agent can read code but asks before making changes

## Example Session

```
You: /sprint-summary

OpenCode: Which repository and time period would you like to analyze?

You: opencode-dgx, last 2 weeks

OpenCode: [Generates summary with commits, PRs, key changes by contributor]

You: Who had the most review comments on their PRs?

OpenCode: [Analyzes PR review patterns and identifies areas for coaching]
```

## Integrations

### GitHub

```
You: Show me open PRs older than 7 days in our repo
```

### Jira

```
You: What Jira tickets were closed this sprint?
```

## Need Help?

- Switch agents with `Tab` key
- Type `/help` for available commands
- Ask "what reports can you generate?" for suggestions
