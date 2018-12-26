#!/bin/bash

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# ZSH
bash "$SRC_DIR/zsh/install.sh"
[[ "$SHELL" != "/usr/bin/zsh" ]] && chsh /usr/bin/zsh

# Tmux
bash "$SRC_DIR/tmux/install.sh"

# Git config
if [[ ! -f "$XDG_CONFIG_HOME/git" ]]; then
  ln -s "$SRC_DIR/git" "$XDG_CONFIG_HOME/git"
fi

# Install the profile scripts
ln -s "$SRC_DIR/profile.sh" "$XDG_CONFIG_HOME/profile.sh"

if [[ -f "$SRC_DIR/profile.custom.sh" ]]; then
  ln -s "$SRC_DIR/profile.custom.sh" "$XDG_CONFIG_HOME/profile.custom.sh"
fi

