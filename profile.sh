#!/bin/sh
# Environment variables
# To be loaded by both the shell and X (try to keep a shell-agnostic syntax)

test -z "$PROFILE_LOADED" || return

# Standard programs
# =================
export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Common PATHs 
PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
test -f "$XDG_CONFIG_HOME/profile.local.sh" && . "$XDG_CONFIG_HOME/profile.local.sh"

export PATH

PROFILE_LOADED=1
export PROFILE_LOADED

