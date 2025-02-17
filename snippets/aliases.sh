# Aliases / shorthands for common commands.
# This module is also compatible with bash
#
# Customization variables:
# - ALIAS_NVIM=1 - whether to alias neovim as vim (if installed)
# - ZCFG_VIM_AS_MAN: set to vim / nvim to enable using vim as man pager (requires
#   'man' filetype);
#

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
export EDITOR=${EDITOR:-'vim'}
export GIT_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export PAGER=${PAGER:-'less'}

if [[ "$ALIAS_NVIM" == "1" ]] && @quiet command -v nvim; then
  alias vi='nvim'
  alias vim='nvim'
  EDITOR=nvim
fi

# Use vim / nvim as man pager
if [[ -n "$ZCFG_VIM_AS_MAN" ]]; then
  if [[ "$ZCFG_VIM_AS_MAN" == "1" ]]; then ZCFG_VIM_AS_MAN="vim"; fi
  export MANPAGER="$ZCFG_VIM_AS_MAN +'set ft=man' -"
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

# mkdir + cd
function mcd() { mkdir -p "$@" && cd "$@" }

