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

test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sangdang/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/sangdang/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sangdang/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/sangdang/google-cloud-sdk/completion.zsh.inc';
fi

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
VI_MODE_SET_CURSOR=false
# MODE_INDICATOR="%F{white}+%f"
# INSERT_MODE_INDICATOR="%F{green}+%f"

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

plugins=(
  docker
  docker-compose
  fd
  fzf
  git
  zsh-interactive-cd
  zsh-autosuggestions
  zsh-syntax-highlighting # must be the last
)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/paths
source $HOME/dotfiles/aliases
source $HOME/dotfiles/fzf/fzf-git.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source ${HOME}/.iterm2_shell_integration.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export VISUAL='lvim'
  export EDITOR='lvim'
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export RIPGREP_CONFIG_PATH="~/.config/ripgrep/config"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
export GIT_TERMINAL_PROMPT=1

###-tns-completion-start-###
if [ -f ~/.tnsrc ]; then
    source ~/.tnsrc
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
  . '~/Downloads/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
  . '~/Downloads/google-cloud-sdk/completion.zsh.inc';
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[[ -s "/Users/sangdth/.gvm/scripts/gvm" ]] && source "/Users/sangdth/.gvm/scripts/gvm"

source "$HOME/.cargo/env"

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"

# remove_special_chars='s/[^a-zA-Z0-9]/ /g'
# remove_multiple_spaces='s/ \{2,\}/ /g'
#
# _fzf_complete_git() {
#   git rev-parse HEAD > /dev/null 2>&1 || return
#
#   ARGS="$@"
#   local code
#   local tasks
#   local branches
#
#   code=$(echo "$@" | sed -e "${remove_multiple_spaces}" | sed 's/^git checkout -b//' | awk '{print $1}')
#   tasks=$(jira i --project "$code")
#   branches=$(git branch -a | grep -v HEAD)
#
#   if [[ $ARGS == 'git checkout -b'* ]]; then
#     _fzf_complete --ansi --reverse --multi --prompt='Jira > ' -- 'git checkout -b ' < <(
#         echo $tasks
#     )
#   fi
# }
#
# _fzf_complete_git_post() {
#   ruby -ne 'i = $_.strip.split(/\s{2,}/); puts "#{i[0]} #{i[2]}"' | \
#     # Remove special characters
#     sed -e "${remove_special_chars}" | \
#     # Remove multiple spaces
#     sed -e "${remove_multiple_spaces}" | \
#     # Replace space with dash
#     sed 's/ /-/g' | \
#     # Print out
#     awk '{print $1}'
# }

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
