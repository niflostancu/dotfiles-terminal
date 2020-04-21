#!/bin/sh
# Environment Profile
# To be loaded by both the shell and X programs

# Standard programs
# =================
export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Explicit XDG paths
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Common PATHs 
PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH

# Set GPG TTY
export GPG_TTY=$(tty)

# Load local profile overrides
[ ! -f "$XDG_CONFIG_HOME/profile.local.sh" ] || source "$XDG_CONFIG_HOME/profile.local.sh"

# Don't forget to setup the zconfig profile you want to use inside
# `profile.local.sh` or `.zshenv`:
#ZCONFIG_PROFILE=workstation

PROFILE_LOADED=1
export PROFILE_LOADED

