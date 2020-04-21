# ZSH environment script
# Loaded each time the zsh shell is used

# resolve symlinks to self, go back one directory
ZSH_CONFIG_DIR="${${(%):-%N}:A:h:h}"

# Load config script
source "$ZSH_CONFIG_DIR/lib/env.zsh"

