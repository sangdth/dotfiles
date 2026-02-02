# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages development environment configuration using Dotbot. It handles shell configuration (Zsh), editor setup (Neovim), Git configuration, and various development tools.

## Installation & Setup

The repository uses Dotbot for automated installation:

```bash
./install
```

This script:
- Initializes git submodules (Dotbot)
- Creates symbolic links for all configuration files
- Sets up template files (~/.gitconfig, ~/.env, ~/.credentials) with secure permissions (600)

### Template Files

Before making changes, understand the template system:
- `gitconfig.template` → User creates `~/.gitconfig` (git-ignored)
- `env.template` → User creates `~/.env` (git-ignored)
- Template files contain placeholder values (YOUR_NAME, YOUR_EMAIL, YOUR_GPG_KEY, YOUR_SSH_KEY)

Never modify user's personal `.gitconfig` or `.env` files. Only suggest changes to templates.

## Key Architecture

### Configuration System

The shell environment loads in this order (see zshrc:1-88):
1. `~/.env` - User environment variables (if exists)
2. Homebrew environment (cached for performance)
3. `paths` - PATH configuration for all tools
4. `aliases` - Shell aliases and shortcuts
5. `fzf/fzf-git.sh` - FZF Git integration
6. `~/.credentials` - Sensitive credentials (if exists)
7. Lazy-loaded components: iTerm2 integration, GVM, NVM

### Symlink Structure

All configs are symlinked via install.conf.yaml:36-50:
- `~/.config/bat` → `config/bat`
- `~/.config/nvim` → `config/nvim`
- `~/.config/lazygit` → `config/lazygit`
- `~/.config/lazydocker` → `config/lazydocker`
- `~/.config/ripgrep/config` → `config/ripgrep/config`
- `~/.config/fd/ignore` → `config/fd/ignore`
- `~/.zshrc` → `zshrc`
- `~/.gitignore_global` → `gitignore_global`

Changes to files in `~/.config/` or `~/` automatically affect this repository.

### Performance Optimizations

The zshrc implements several lazy-loading strategies:
- Homebrew shellenv cached to `~/.brew_shellenv_cache` (zshrc:6-8)
- iTerm2 and GVM loaded in background after shell starts (zshrc:43)
- NVM loaded on-demand (zshrc:51-52)
- Pyenv initialization deferred via function wrapper (paths:46-50)

## Development Tools Configuration

### Git Setup

Git configuration uses:
- Delta as pager with side-by-side diffs (gitconfig.template:18, 28-30)
- GPG commit signing enabled (gitconfig.template:14)
- Auto-rebase on pull (gitconfig.template:95)
- Auto-setup remote on push (gitconfig.template:98)
- Custom aliases for common operations (gitconfig.template:70-89)

Key aliases:
- `git lg` - Pretty colored log with graph
- `git sync` - Fetch with prune and pull
- `git save/switch` - Bit integration

### PATH Management

All PATH configuration lives in `paths` file, organized by category:
- Base system paths (line 2)
- Development tools: LLVM, Cargo, custom scripts (lines 5-7)
- Conditional Android SDK (lines 10-14)
- Node.js: PNPM, Bun (lines 17-22)
- Python: Multiple versions and Poetry (lines 29-31, 42-50)
- Ruby with Homebrew (lines 34-36)
- PostgreSQL (line 52)

### Custom Scripts

Scripts in `scripts/` directory are in PATH (paths:7):
- `fnm2` - Fast Node Manager wrapper
- `sall`, `sar` - Search utilities

## Common Commands

### Testing Changes

```bash
# Reload shell configuration
source ~/.zshrc
# or
reload
```

### Managing Dotfiles

```bash
# Re-run installation (safe to run multiple times)
./install

# Check what would be linked
git submodule update --init --recursive
```

### Git Operations

The repository uses submodules for Dotbot. When making changes:

```bash
# Update submodules
git submodule update --remote --merge

# Check submodule status
git submodule status
```

## Security Considerations

Files with sensitive data are git-ignored (.gitignore:74-89):
- `.env`, `.env.*`
- `.credentials`
- `.npmrc`, `.netrc`
- `*.pem`, `*.key`, `*.cert`, `*.crt`
- `iTerm2/Profiles.json`
- `.gitconfig` (user must use gitconfig.template)

The installation script enforces 600 permissions on sensitive files (install.conf.yaml:19-34).

## Editing Configurations

### Neovim

Config located in `config/nvim/`:
- `init.lua` - Main configuration entry point
- `lua/` - Plugin and configuration modules
- Uses lazy.nvim for plugin management (lazy-lock.json tracks versions)

### Zsh

Primary shell config in `zshrc`. To add:
- Aliases → Add to `aliases` file
- PATH entries → Add to `paths` file
- Environment variables → User adds to their `~/.env` (never commit)
- Credentials → User adds to their `~/.credentials` (never commit)

### Tool Configurations

Each tool has dedicated config directory under `config/`:
- `bat/` - Syntax highlighting theme
- `fd/` - File search ignore patterns
- `lazygit/` - Git TUI configuration
- `lazydocker/` - Docker TUI configuration
- `ripgrep/` - Search tool configuration

## Important Notes

- This is a personal dotfiles repository - user-specific values are in template files
- Never commit actual credentials, API keys, or personal information
- The repository works via symlinks - editing `~/.zshrc` edits `dotfiles/zshrc`
- Git config template uses GPG signing - user must have GPG key configured
- Shell loads credentials from `~/.credentials` if it exists (zshrc:26)
