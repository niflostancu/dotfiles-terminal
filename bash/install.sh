#!/bin/bash
# Bash dotfiles installation script

BASHCONFDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ -f "$HOME/.bashrc" ]]; then
  echo "Zsh configuration files already exist on '$HOME'!"
  ls -la "$HOME/.bash"*
  read -p "Are you sure you want to replace it? " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

echo "Installing bash config to '$HOME'"

FILES=(bash_profile bashrc)
for f in "${FILES[@]}"; do
  rm -f "$HOME/.$f"
  ln -s "$BASHCONFDIR/$f" "$HOME/.$f"
done

echo "Done!"

