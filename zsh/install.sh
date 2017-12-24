#!/bin/bash
# Zsh dotfiles installation script

CONFDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

if [[ -f "$ZDOTDIR/.zshrc" ]]; then
  echo "A zsh config is already installed at $ZDOTDIR/.zshrc."
  ls -l "$ZDOTDIR/.zshrc"
  read -p "Are you sure you want to replace it? " -n 1 -r
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
  echo
fi

echo "Installing zsh config to '$ZDOTDIR'"
mkdir -p "$ZDOTDIR"

FILES=(zshrc zlogin zprofile zshenv)
for f in "${FILES[@]}"; do
  rm -f "$ZDOTDIR/.$f"
  ln -s "$CONFDIR/$f" "$ZDOTDIR/.$f"
done

echo "Done!"

