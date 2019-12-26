# Colored / human friendly output for the standard Unix tools and more.
# This snippet is also compatible with bash
#
# Customization variables:
# - ZCFG_VIM_AS_MAN: set to vim / nvim to enable using vim as man pager (requires
#   'man' filetype);
#

# Use vim / nvim as man pager
if [[ -n "$ZCFG_VIM_AS_MAN" ]]; then
  export MANPAGER="$ZCFG_VIM_AS_MAN -c 'set ft=man' -"
fi

# Human-friendly ls aliases
alias ll="ls -lh"
alias la="ls -lha"
alias ls="/bin/ls --color=auto -h"

# Colored less and grep
export LESS='-g -i -M -R -S -w -z-4'
export GREP_COLOR='38;5;202'
alias grep="grep --color=auto"

# System commands
alias ip="ip -c"
alias df="df -h"
alias free="free -h"

# If installed, use lesspipe for less syntax coloring
if @quiet command -v lesspipe.sh; then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
  export LESS_ADVANCED_PREPROCESSOR=1
fi

