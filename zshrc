# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

export XDG_CONFIG_HOME="$HOME/.config"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Disable oh-my-zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

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
  zsh-prompt-benchmark
  zsh-autosuggestions
  zsh-syntax-highlighting # must be the last
)

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

_fzf_complete_git() {
  if [[ $@ == 'git checkout -b'* ]]; then
    ME=""
    GIT_CHECKOUT="git checkout -b "
    STATUS_QUERY="status NOT IN (Done, Dismissed, Released, 'In Progress', 'Ready for release')"

    ARGS="$(echo $@ | sed 's/git checkout -b //g')"

    read SCOPE CODE <<< $(echo "$ARGS" | awk -F/ '{print $1,$2}')

    if [[ $ARGS == "" ]]; then
      ME="-a$(jira me)"
      PROJECT_QUERY="project IS NOT EMPTY"
    elif [[ $CODE == "" ]]; then
      PROJECT_QUERY="project IN ($SCOPE)" # Allow to use `FF` only without feature/
    else
      GIT_CHECKOUT="git checkout -b $SCOPE/"
      PROJECT_QUERY="project IN ($CODE)"
    fi

    local tasks
    tasks=$(jira issue list --plain --no-headers --columns key,summary $ME -q "$STATUS_QUERY AND $PROJECT_QUERY")
      _fzf_complete --ansi --reverse --multi --prompt="fzf> " -- "$GIT_CHECKOUT" < <(
        echo $tasks | sed 's/[[:space:]]/-/g' | tr -dc '[:alnum:]-\n'
      )
  fi
}
