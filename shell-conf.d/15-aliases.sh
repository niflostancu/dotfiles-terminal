#
# Aliases & commands (pagers, editors, ls etc.)
#

# x to open file in X program
alias x="xdg-open"

# Tmux commands
alias tkill='tmux kill-session'

# Auto bashrc propagation over SSH
# Inspired by https://superuser.com/questions/587870/auto-propagation-of-bash-settings-across-many-machines
function ssr() {
    ssh $@ -t "
    REMOTERC=\"\$HOME/.$USER.bashrc\"
    find \"\$REMOTERC\" -mmin +120 -quit 2>/dev/null || wget --quiet -N "$BASHRC_PUBLIC_URL" -O \"\$REMOTERC\";
    bash --rcfile \"\$REMOTERC\""
}

# SSH aliases
alias ssx="ssr -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
alias scpx="scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# Git
alias g="git"
alias gst="git status"

# Shell
alias h="history"
alias j="jobs"

# CD navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if command -v nvim >/dev/null 2>&1; then
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
if command -v lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
  export LESS_ADVANCED_PREPROCESSOR=1
fi

