#!/bin/bash

SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

bash "$SRC_DIR/zsh/install.sh"

# Install the profile scripts
ln -s "$SRC_DIR/profile.sh" "$XDG_CONFIG_HOME/profile.sh"

if [[ -f "$SRC_DIR/profile.custom.sh" ]]; then
  ln -s "$SRC_DIR/profile.custom.sh" "$XDG_CONFIG_HOME/profile.custom.sh"
fi

