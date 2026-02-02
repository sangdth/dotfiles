if [[ -f $HOME/.env && -r $HOME/.env ]]; then
  source $HOME/.env
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"

# Cache brew shellenv for faster startup
if [[ ! -f ~/.brew_shellenv_cache ]] || [[ ~/.brew_shellenv_cache -ot /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv > ~/.brew_shellenv_cache
fi
# Validate cache file ownership before sourcing
if [[ -f ~/.brew_shellenv_cache && -O ~/.brew_shellenv_cache ]]; then
  eval "$(cat ~/.brew_shellenv_cache)"
fi

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Always automatically upgrade.
zstyle ':omz:update' mode auto

# How often to auto-update (in days).
zstyle ':omz:update' frequency 7

# not work well with starship
VI_MODE_SET_CURSOR="false"

# Add completion paths
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)
fi

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/paths
source $HOME/dotfiles/aliases
source $HOME/dotfiles/fzf/fzf-git.sh
source $HOME/.cargo/env

# Load credentials if exists
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

# Lazy load NVM (only when needed)
export NVM_DIR="$HOME/.config/nvm"
function nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}

# Setup completions (single call for performance)
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit -C
