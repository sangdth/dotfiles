# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository using Dotbot for automated configuration management. Handles Zsh shell, Neovim, Git, and various development tools on macOS.

## Installation

```bash
./install
```

Creates symlinks and sets up template files with secure permissions (600).

### Template System

- `gitconfig.template` → User creates `~/.gitconfig` (git-ignored)
- `env.template` → User creates `~/.env` (git-ignored)
- Templates contain placeholders: YOUR_NAME, YOUR_EMAIL, YOUR_GPG_KEY, YOUR_SSH_KEY

**Never modify user's personal `.gitconfig`, `.env`, or `.credentials` files.** Only suggest changes to templates.

## Shell Loading Order

The zshrc loads components in this order:
1. `~/.env` - User environment variables (if exists)
2. Homebrew environment (cached to `~/.brew_shellenv_cache`)
3. Oh-My-Zsh with pure prompt
4. `paths` - PATH configuration
5. `aliases` - Shell aliases
6. `~/.credentials` - Sensitive credentials (if exists)
7. NVM - Lazy loaded via function wrappers

## Symlink Structure (install.conf.yaml)

```
~/.config/bat       → config/bat
~/.config/nvim      → config/nvim
~/.config/lazygit   → config/lazygit
~/.config/lazydocker → config/lazydocker
~/.config/ripgrep/config → config/ripgrep/config
~/.config/fd/ignore → config/fd/ignore
~/.zshrc            → zshrc
~/.gitignore_global → gitignore_global
```

Changes to files in `~/.config/` or `~/` directly affect this repository.

## Performance Optimizations

- Homebrew shellenv cached to avoid slow startup
- NVM lazy-loaded via function wrappers (zshrc:38-49)
- Pyenv lazy-loaded via function wrapper (paths:46-50)

## Key Files

| File | Purpose |
|------|---------|
| `zshrc` | Main shell configuration |
| `paths` | All PATH exports by category |
| `aliases` | Shell aliases |
| `gitconfig.template` | Git config with Delta pager, GPG signing |
| `install.conf.yaml` | Dotbot configuration |

## Custom Scripts (in PATH via paths:7)

- `fnm2` - Fast Node Manager wrapper that reinstalls global packages after `fnm install`
- `sall`, `sar` - Interactive ripgrep + fzf search, opens results in lvim

## Git Configuration Highlights

- Delta as pager with side-by-side diffs
- GPG commit signing enabled
- Auto-rebase on pull, auto-setup remote on push
- Key aliases: `git lg` (pretty log), `git sync` (fetch+pull)

## Testing Changes

```bash
source ~/.zshrc
```

Or use `reload` alias.

## Adding New Configuration

- **PATH entries** → `paths` file
- **Aliases** → `aliases` file
- **Environment variables** → User's `~/.env`
- **Credentials** → User's `~/.credentials`
- **Tool configs** → `config/<tool>/` directory

## Git-Ignored Sensitive Files

`.env`, `.env.*`, `.credentials`, `.npmrc`, `.netrc`, `*.pem`, `*.key`, `iTerm2/Profiles.json`, `.gitconfig`
