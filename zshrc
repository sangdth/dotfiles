if [[ -f $HOME/.env && -r $HOME/.env ]]; then
  source $HOME/.env
fi

# Cache brew shellenv for faster startup
if [[ ! -f ~/.brew_shellenv_cache ]] || [[ ~/.brew_shellenv_cache -ot /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv > ~/.brew_shellenv_cache
fi
eval "$(cat ~/.brew_shellenv_cache)"

# Trying to disable the permission prompt
ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Always automatically upgrade.
zstyle ':omz:update' mode auto

# How often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# This makes repository status check for large repositories much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# not work well with starship
VI_MODE_SET_CURSOR="false"

plugins=(
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/paths
source $HOME/dotfiles/aliases
source $HOME/dotfiles/fzf/fzf-git.sh
source $HOME/.cargo/env

# Load credentials (only if exists)
[[ -f "$HOME/.credentials" ]] && source "$HOME/.credentials"

# Lazy load iTerm2 integration
function load-iterm2() {
  if [[ -e "$HOME/.iterm2_shell_integration.zsh" ]]; then
    source "$HOME/.iterm2_shell_integration.zsh"
  fi
}

# Lazy load GVM
function load-gvm() {
  if [[ -s "$HOME/.gvm/scripts/gvm" ]]; then
    source "$HOME/.gvm/scripts/gvm"
  fi
}

# Load iTerm2 and GVM in background after shell starts
([[ $- == *i* ]] && (load-iterm2 & load-gvm &)) &>/dev/null &!

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Setup completions (consolidated for performance)
autoload -U +X bashcompinit && bashcompinit

# Lazy load NVM (only when needed)
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
# PROMPT='%F{blue}%3(~:../:)%2~%f %F{green}${vcs_info_msg_0_}%f$ '
PROMPT='%F{blue}%3(~:../:)%2~%f %F{green}${vcs_info_msg_0_}%f'$'\n''$ '

# Docker CLI completions (optimized)
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)
fi

# Single compinit call for all completions (performance optimized)
autoload -Uz compinit
compinit -C
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/sang/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Added by Antigravity
export PATH="/Users/sang/.antigravity/antigravity/bin:$PATH"
