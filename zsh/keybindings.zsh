# Personal key bindings

# 10ms for key sequences
KEYTIMEOUT=1

bindkey '^R' fzf-history-widget
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

