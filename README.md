# Dotfiles

My personal dotfiles for setting up a new development environment.

## Security Notice

This repository contains template files for sensitive configurations. Before using these dotfiles:

1. Copy template files and add your personal information:
   - `gitconfig.template` → `.gitconfig`
   - `env.template` → `.env`

2. Update the copied files with your personal information:
   - In `.gitconfig`:
     - Replace `YOUR_NAME` with your Git username
     - Replace `YOUR_EMAIL` with your Git email
     - Replace `YOUR_GPG_KEY` with your GPG signing key
   - In `.env`:
     - Replace `YOUR_SSH_KEY` with your SSH key filename
     - Add any personal API keys or tokens

## Installation

1. Clone this repository:
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git
cd dotfiles
```

2. Create your personal configuration files from templates:
```bash
cp gitconfig.template ~/.gitconfig
install -m 600 env.template ~/.env
install -m 600 /dev/null ~/.credentials
```

3. Run the installation script:
```bash
./install
```

## What's Included

- Neovim configuration with various plugins
- Git configuration and aliases
- Zsh configuration with custom setup
- iTerm2 configuration
- Various tool configurations (ripgrep, fd, bat, etc.)

## Structure

```
.
├── config/               # Configuration files for various tools
│   ├── nvim/            # Neovim configuration
│   ├── bat/             # Bat configuration
│   ├── fd/              # Fd configuration
│   ├── lazydocker/      # Lazydocker configuration
│   ├── lazygit/         # Lazygit configuration
│   └── ripgrep/         # Ripgrep configuration
├── git/                 # Git-related files
├── iTerm2/             # iTerm2 configuration
├── scripts/            # Utility scripts
└── various dotfiles    # Other configuration files
```

## Sensitive Information

The following files are git-ignored to protect sensitive information:
- `.gitconfig` (use `gitconfig.template` as a base)
- `.env` (use `env.template` as a base)
- `.credentials`
- `iTerm2/Profiles.json`
- Any files containing API keys, tokens, or certificates

## License

[MIT License](LICENSE)
