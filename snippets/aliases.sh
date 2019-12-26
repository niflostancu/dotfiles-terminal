# Several aliases.
# This module is also compatible with bash
#

# Available configuration variables (and their default values):
# - ALIAS_NVIM=1 - whether to alias neovim as vim (if installed)

# x to open file in XDG registered program
function x() {
  nohup xdg-open "$@" &>/dev/null
}

# Tmux commands
alias tkill='tmux kill-session'

# Git
alias g="git"
alias gst="git status"

# Shell
alias h="history"
alias j="jobs"

# CD navigation
alias ..="cd .."
alias -- -="cd -"

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ "$ALIAS_NVIM" == "1" ]] && @quiet command -v nvim; then
  alias vi='nvim'
  alias vim='nvim'
  # Use nvim as man pager
  export MANPAGER="nvim -c 'set ft=man' -"
fi

# LS customization
alias kk="k -h"
alias ka="k -ha"
if [[ -n "$ZCONFIG_LS_K" ]]; then
  alias ll="k -h"
  alias la="k -ha"
else
  alias ll="ls -lh"
  alias la="ls -lha"
fi
alias ls="/bin/ls --color=auto -h"

# Colored less and grep
export LESS='-g -i -M -R -S -w -z-4'
export GREP_COLOR='38;5;202'
alias grep="grep --color=auto"

# Colored & human friendly system commands
alias ip="ip -c"
alias df="df -h"
alias free="free -h"

# Set the Less input preprocessor.
if @quiet command -v lesspipe.sh; then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
  export LESS_ADVANCED_PREPROCESSOR=1
fi

