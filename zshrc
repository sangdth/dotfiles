# You may need to manually set your language environment
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="/opt/homebrew/bin/fzf"
export FZF_PREVIEW_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type file"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type directory"

# For compilers to find llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export RIPGREP_CONFIG_PATH="${HOME}/.config/ripgrep/config"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
export GIT_TERMINAL_PROMPT=1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export VISUAL='lvim'
  export EDITOR='lvim'
fi


eval "$(/opt/homebrew/bin/brew shellenv)"

# Disable oh-my-zsh theme
ZSH_THEME=""

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
# MODE_INDICATOR="%F{white}+%f"
# INSERT_MODE_INDICATOR="%F{green}+%f"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting # must be the last
)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/paths
source $HOME/dotfiles/aliases
source $HOME/dotfiles/fzf/fzf-git.sh
source $HOME/.cargo/env

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

[[ -s "/Users/sangdth/.gvm/scripts/gvm" ]] && source "/Users/sangdth/.gvm/scripts/gvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(twilio autocomplete:script zsh)"
