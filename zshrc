if [[ -f $HOME/.env && -r $HOME/.env ]]; then
  source $HOME/.env
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Cache brew shellenv for faster startup
if [[ ! -f ~/.brew_shellenv_cache ]] || [[ ~/.brew_shellenv_cache -ot /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv > ~/.brew_shellenv_cache
fi
if [[ -f ~/.brew_shellenv_cache && -O ~/.brew_shellenv_cache ]]; then
  eval "$(cat ~/.brew_shellenv_cache)"
fi

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Completion paths (must be before oh-my-zsh compinit)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
[[ -d "$HOME/.docker/completions" ]] && fpath=("$HOME/.docker/completions" $fpath)
fpath+=("/opt/homebrew/share/zsh/site-functions")

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/paths
source $HOME/dotfiles/aliases

[[ -f "$HOME/.credentials" ]] && source "$HOME/.credentials"

# NVM (lazy loaded for faster startup)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  function nvm() {
    unset -f nvm node npm npx
    \. "$NVM_DIR/nvm.sh"
    autoload -U +X bashcompinit && bashcompinit
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
  }
  function node() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; node "$@"; }
  function npm() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; npm "$@"; }
  function npx() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; npx "$@"; }
fi

# Pure prompt
autoload -U promptinit; promptinit
prompt pure
