# gtma - AI-Powered Git Commit Message Generator

Generates conventional commit messages using AI and applies them via Graphite CLI (`gt modify`).

## Requirements

- [Graphite CLI](https://graphite.dev) (`gt`)
- `agent` CLI tool (AI assistant)

## Setup

Add the `gtma` function to your shell:

```bash
source ~/.zshrc  # or source the file containing gtma
```

## Usage

```bash
gtma           # Generate message and amend current commit
gtma -c        # Generate message and create new commit
gtma --commit  # Same as -c
```

## How It Works

1. Detects staged/unstaged/untracked changes
2. Sends diff to `agent` for conventional commit message generation
3. Prepends new message **on top of** existing commit message
4. Applies via `gt modify --message`

## Message Format

```
<type>(scope): <description>

<body>

<previous commit message>
```

## Examples

```bash
# Amend with AI-generated message
gtma

# Create new commit with AI-generated message
gtma -c
```
