#!/bin/sh
# Environment variables
# To be loaded by both the shell and X (try to keep a shell-agnostic syntax)

# Standard programs
# =================
export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Common PATHs 
PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
test -f "$XDG_CONFIG_HOME/profile.custom.sh" && . "$XDG_CONFIG_HOME/profile.custom.sh"

export PATH

TMUXP_CONFIG_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/tmux/tmuxp/
export TMUXP_CONFIG_DIR

PROFILE_LOADED=1
export PROFILE_LOADED

