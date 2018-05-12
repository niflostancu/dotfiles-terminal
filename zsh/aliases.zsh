# Aliases & commands

function ssr() {
    ssh $@ -t "
    REMOTERC=\"\$HOME/.$USER.bashrc\"
    find \"\$REMOTERC\" -mmin +120 -quit 2>/dev/null || wget --quiet -N "$BASHRC_PUBLIC_URL" -O \"\$REMOTERC\";
    bash --rcfile \"\$REMOTERC\""
}

alias vi='nvim'
alias vim='nvim'
alias tkill='tmux kill-session'
alias x="xdg-open"
alias kk="k -h"
alias ll="k -h"
alias ka="k -ha"
alias la="k -ha"
alias ls="/bin/ls --color=auto -h"

alias ip="ip -c"
alias grep="grep --color=auto"

alias ssx="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
alias scpx="scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# cd navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias g="git"
alias gst="git status"

alias h="history"
alias j="jobs"

