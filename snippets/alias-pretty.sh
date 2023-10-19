# Colored / human friendly aliases for the standard Unix tools and more.
# This snippet is also compatible with bash.
#

# Colored ls
alias ls="/bin/ls --color=auto -h"

# Colored less and grep
export LESS='-g -i -M -R -S -w -z-4'
export GREP_COLORS='mt=38;5;202'
alias grep="grep --color=auto"

# Colored & human friendly system commands
alias ip="ip -c"
alias df="df -h"
alias free="free -h"

# If installed, use lesspipe for less syntax coloring
if @quiet command -v lesspipe.sh; then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
  export LESS_ADVANCED_PREPROCESSOR=1
fi

