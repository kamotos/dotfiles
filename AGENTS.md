# AGENTS.md - Guidelines for Agentic Coding in Chezmoi Dotfiles

This repository is a **chezmoi dotfiles manager** repository. It manages configuration files across multiple machines using chezmoi's templating system.

## Repository Structure

- `run_*.sh` - Scripts that run once during setup
- `run_once_*.sh.tmpl` - Template scripts using chezmoi variables
- `dot_*` - Files that map to `~/.filename` (e.g., `dot_zshrc` → `~/.zshrc`)
- `dot_config/*` - Files that map to `~/.config/*`
- `dot_claude/*` - Claude Code configuration and commands
- `dot_local/*` - Local, machine-specific files (not committed)

## Build/Lint/Test Commands

This repository does not have traditional build/test commands as it's a configuration repository.

### Linting Scripts

```bash
# Shell script linting (if shellcheck is available)
shellcheck run_*.sh run_once_*.sh

# Format shell scripts
shfmt -w run_*.sh run_once_*.sh
```

### chezmoi Commands

```bash
# Preview changes without applying
chezmoi diff

# Apply all changes
chezmoi apply

# Update repository from remote
chezmoi update

# Edit a file in the source state
chezmoi edit ~/.zshrc
```

## Code Style Guidelines

### Shell Scripts

- Use `#!/usr/bin/env bash` or `#!/bin/bash` for bash scripts
- Use `#!/bin/sh` for POSIX-compatible scripts
- Use `set -euo pipefail` for strict error handling where appropriate
- Use `set -x` for debugging during installation scripts
- Use `${VAR}` syntax consistently for variable expansion
- Quote all variable expansions: `"$HOME"` not `$HOME`

### Naming Conventions

- Scripts: `run_once_NNN_description.sh.tmpl` (e.g., `run_once_100-install-tools.sh.tmpl`)
- Templates: Use `.tmpl` extension for chezmoi template files
- Functions: Use `snake_case` for shell function names
- Aliases: Use lowercase in dotfiles

### Template Syntax

Chezmoi uses Go templates with these common patterns:

```
{{ if eq .chezmoi.os "linux" }}
  # Linux-specific content
{{ else if eq .chezmoi.os "darwin" }}
  # macOS-specific content
{{ end }}

{{ $var := .variable }}
{{ .chezmoi.os }}     # Current OS
{{ .chezmoi.arch }}   # Architecture
{{ .chezmoi.hostname }} # Machine hostname
{{ .chezmoi.username }} # Current user
```

### Imports/Dependencies

- Keep system dependencies minimal and well-documented
- Use chezmoi's conditional OS detection instead of manual detection
- Document all external URLs and versions used in install scripts

### Formatting

- Indentation: 2 spaces for shell scripts
- Line length: Keep under 120 characters
- Shebang: First line of all scripts
- Exit codes: Use explicit `exit 0` or `exit 1`

### Error Handling

```bash
# Strict mode for most scripts
set -euo pipefail

# Installation scripts often use
set -x  # Print commands before execution

# Check for required tools
if ! command -v tool &> /dev/null; then
    echo "Error: tool not found"
    exit 1
fi
```

### Git Workflow

**IMPORTANT**: Always use `av` or `/usr/bin/git` instead of `git` directly.

```bash
# Stage all changes
av add .

# Create commit
av commit

# View diff
av diff
```

## Claude Code Configuration

This repository includes Claude Code commands in `dot_claude/commands/`:

- `git-commit-message.md` - Generate conventional commit messages
- `fix-circleci-build-failure.md` - Fix CircleCI build failures

## Editor Configuration

- Vim configuration in `dot_vimrc`
- Alacritty terminal config in `dot_config/alacritty/alacritty.toml`
- Zsh configuration in `dot_zshrc` and `dot_zshenv`

## Best Practices

1. **Test with `chezmoi diff`** before applying changes
2. **Use separate chezmoi templates** for OS-specific configurations
3. **Keep sensitive data in private files** (not committed to source)
