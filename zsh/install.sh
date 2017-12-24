#!/bin/bash
# Zsh dotfiles installation script

CONFDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

if [[ -f "$ZDOTDIR/.zshrc" ]]; then
  echo "Zsh configuration files already exist on '$ZDOTDIR'!"
  ls -la "$ZDOTDIR/.z"*
  read -p "Are you sure you want to replace it? " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

echo "Installing zsh config to '$ZDOTDIR'"
mkdir -p "$ZDOTDIR"

FILES=(zshrc zlogin zprofile zshenv)
for f in "${FILES[@]}"; do
  rm -f "$ZDOTDIR/.$f"
  ln -s "$CONFDIR/$f" "$ZDOTDIR/.$f"
done

echo "Done!"

