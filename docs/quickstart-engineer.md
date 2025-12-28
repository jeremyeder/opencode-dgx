# OpenCode Quickstart: Software Engineer

Welcome to OpenCode on DGX! This guide helps Software Engineers leverage AI-assisted workflows for implementation, debugging, and code review.

## Access

1. Connect to VPN
2. Navigate to https://192-168-1-190.nip.io
3. Sign in with your @redhat.com Google account

## Your Workflows

### Implement Feature

```
/implement
```

Implement a feature from a spec or description:

- Analyzes existing codebase patterns
- Generates code following project conventions
- Includes tests
- Creates appropriate commits

### Debug Issue

```
/debug
```

Structured debugging workflow:

- Reproduce the issue
- Identify root cause
- Propose fix with explanation
- Verify fix doesn't introduce regressions

### Refactor Code

```
/refactor
```

Refactor code with safety:

- Identifies code smells
- Proposes improvements
- Ensures tests pass before/after
- Preserves behavior

### Create PR

```
/pr-create
```

Create a well-documented PR:

- Summarizes changes
- Links related issues
- Highlights areas needing review
- Includes test plan

## Setup Your Environment

Copy the engineer commands to your OpenCode config:

```bash
# From your project directory
mkdir -p .opencode/command
cp /path/to/opencode-dgx/examples/commands/implement.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/debug.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/refactor.md .opencode/command/
cp /path/to/opencode-dgx/examples/commands/pr-create.md .opencode/command/
```

Or install globally:

```bash
mkdir -p ~/.config/opencode/command
cp /path/to/opencode-dgx/examples/commands/*.md ~/.config/opencode/command/
```

## Built-in Agents

Switch between agents with `Tab`:

| Agent     | Use Case                                         |
| --------- | ------------------------------------------------ |
| **build** | Full access - implementing features, fixing bugs |
| **plan**  | Read-only - exploring code, planning changes     |

## Tips

- **Let it read first**: OpenCode works best when it understands your codebase
- **Be specific**: "Add a retry mechanism to the API client" > "improve the code"
- **Iterate**: Review changes, provide feedback, refine
- **Trust but verify**: Always review generated code before committing

## Example Session

```
You: /implement

OpenCode: What feature would you like to implement?

You: Add rate limiting to our REST API endpoints. Use a token bucket
     algorithm with configurable limits per endpoint.

OpenCode: Let me analyze your existing API structure first...
          [Reads relevant files]

          I'll implement rate limiting with:
          1. A RateLimiter middleware
          2. Configuration in opencode.jsonc
          3. Per-endpoint limit overrides
          4. Unit tests

          [Generates code, creates files, runs tests]

You: Can you also add Redis support for distributed rate limiting?

OpenCode: [Extends implementation with Redis backend]
```

## Power User Commands

```bash
# Explore codebase
@general find all error handling patterns in this repo

# Quick fixes
fix the TypeScript errors in src/api/

# Code review
review my staged changes for security issues
```

## Keyboard Shortcuts

| Key       | Action                   |
| --------- | ------------------------ |
| `Tab`     | Switch agent             |
| `Ctrl+C`  | Cancel current operation |
| `Up/Down` | Navigate history         |
| `/`       | Start command            |

## Need Help?

- Type `/help` for available commands
- Ask "how do I..." for guidance
- Check CLAUDE.md in your project for repo-specific instructions
