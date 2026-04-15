if [[ -f $HOME/.env && -r $HOME/.env ]]; then
  source $HOME/.env
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="cursor"
export REACT_EDITOR="cursor"
export RIPGREP_CONFIG_PATH="$HOME/dotfiles/ripgrep/config"

# ZSH_THEME=""

# Cache brew shellenv for faster startup
if [[ ! -f ~/.brew_shellenv_cache ]] || [[ ~/.brew_shellenv_cache -ot /opt/homebrew/bin/brew ]]; then
  /opt/homebrew/bin/brew shellenv > ~/.brew_shellenv_cache
fi
if [[ -f ~/.brew_shellenv_cache && -O ~/.brew_shellenv_cache ]]; then
  source ~/.brew_shellenv_cache
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
source $HOME/dotfiles/fzf/fzf-git.sh
source $HOME/dotfiles/load-nvm

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(starship init zsh)"

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt

gtma() {
  local DO_COMMIT=false
  [[ "$1" == "-c" || "$1" == "--commit" ]] && DO_COMMIT=true

  local CHANGES=$(git diff HEAD; git ls-files --others --exclude-standard | xargs -I {} git diff --no-index /dev/null {})

  if [ -z "$CHANGES" ]; then
    echo "◯ No changes detected."
    return 0
  fi

  local OLD_MSG=$(git log -1 --format=%B 2>/dev/null)

  echo "🤖 Cursor is generating commit message..."

  local PROMPT="Based on the DIFF below, generate a full Git commit message.
  
  Format:
  - Header: <type>(scope): <description> (max 60 chars, imperative mood)
  - Blank line
  - Body: One or two paragraphs explaining the 'why' and 'what'. Wrap text at 72 chars.
  
  Constraints:
  - Types: feat, fix, docs, style, refactor, perf, test, chore.
  - Output ONLY the raw commit message text. No markdown blocks, no commentary.

  DIFF:
  $CHANGES"

  local MSG=$(agent -p "$PROMPT")
  if [ -z "$MSG" ]; then
    echo "❌ Generation failed."
    return 1
  fi

  if [ -n "$OLD_MSG" ]; then
    MSG="${MSG}\n\n${OLD_MSG}"
  fi

  echo "📝 $MSG"

  if $DO_COMMIT; then
    gt modify --all --commit --message "$MSG"
  else
    gt modify --all --message "$MSG"
  fi
}
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/sang/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# bun completions
[ -s "/Users/sang/.bun/_bun" ] && source "/Users/sang/.bun/_bun"

alias claude-mem='bun "/Users/sang/.claude/plugins/cache/thedotmack/claude-mem/12.1.1/scripts/worker-service.cjs"'
