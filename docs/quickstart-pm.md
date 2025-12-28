# OpenCode Quickstart: Product Manager

Welcome to OpenCode on DGX! This guide helps Product Managers leverage AI-assisted workflows for documentation, user stories, and stakeholder communication.

## Access

1. Connect to VPN
2. Navigate to https://192-168-1-190.nip.io
3. Sign in with your @redhat.com Google account

## Your Workflows

### Generate a PRD

```
/prd
```

Describe your feature idea and OpenCode will generate a structured Product Requirements Document with:

- Problem statement
- User personas
- Requirements (functional/non-functional)
- Success metrics
- Out of scope items

### Create User Stories

```
/user-story
```

Provide context about a feature and get properly formatted user stories with:

- As a [persona], I want [goal], so that [benefit]
- Acceptance criteria
- Edge cases to consider

### Generate Release Notes

```
/release-notes
```

Automatically generate release notes from recent commits and PRs. Great for sprint reviews and stakeholder updates.

### Stakeholder Update

```
/stakeholder-update
```

Summarize recent project activity into an executive-friendly format suitable for email or Slack.

## Setup Your Environment

Copy the PM commands to your OpenCode config:

```bash
# From your project directory
mkdir -p .opencode/command
cp /path/to/opencode-dgx/examples/commands/prd.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/user-story.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/release-notes.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/stakeholder-update.md .opencode/command/
```

Or install globally:

```bash
mkdir -p ~/.config/opencode/command
cp /path/to/opencode-dgx/examples/commands/*.md ~/.config/opencode/command/
```

## Tips

- **Be specific**: The more context you provide, the better the output
- **Iterate**: Use follow-up messages to refine outputs
- **Export**: Copy outputs directly to Confluence, Google Docs, or Jira
- **Read-only mode**: Your PM agent doesn't modify code, only analyzes and generates docs

## Example Session

```
You: /prd

OpenCode: What feature would you like to create a PRD for?

You: We need a notification system that alerts users when their API usage
     approaches quota limits. Target users are developers using our platform.

OpenCode: [Generates structured PRD with problem statement, personas,
          requirements, metrics, etc.]

You: Add a section about integration with Slack

OpenCode: [Updates PRD with Slack integration requirements]
```

## Need Help?

- Switch agents with `Tab` key
- Type `/help` for available commands
- Ask "what can you help me with?" for suggestions
