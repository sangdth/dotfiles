# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Trying to disable the permission prompt
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh" # Using ~/ will cause permission issues.
export TERM="xterm-256color"
export FZF_BASE="/usr/local/opt/fzf"
# export FZF_COMPLETION_TRIGGER='``'
# export FZF_DEFAULT_OPTS="--reverse"
# Solarized Dark color scheme for fzf
# export FZF_DEFAULT_OPTS="
#    --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
#    --color info:136,prompt:136,pointer:230,marker:230,spinner:136"
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.dotfiles/.agignore -g ""'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
# Customize Prompt elements
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" > "

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="/"
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=":"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs load ram background_jobs)
# POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="green"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="magenta"
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND="magenta"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="cyan"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND="clear"
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND="magenta"

POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9k_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"

# Customize VCS
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="red"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=4
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=20
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"

# Customize status
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

# Customize ram
POWERLEVEL9K_RAM_BACKGROUND="clear"
POWERLEVEL9K_RAM_FOREGROUND="blue"

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="clear"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="clear"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Always reply Yes and automatically upgrade.
export DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    common-aliases
    docker
    fzf
    git
    git-flow
    golang
    osx
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# The oh-my-zsh might print out the update question
source $ZSH/oh-my-zsh.sh
source "${HOME}/.paths"
source "${HOME}/.dotfiles/.aliases"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# source ./completions/.fnm

eval "$(fnm env)"

# Add completion for gh cli
eval "$(gh completion -s zsh)"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
export GIT_TERMINAL_PROMPT=1

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###-tns-completion-start-###
if [ -f ~/.tnsrc ]; then
    source ~/.tnsrc
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

eval "$(rbenv init -)"
