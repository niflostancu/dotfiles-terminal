# ZSH configuration rc file

# resolve symlinks to self, go back one directory
ZSH_CONFIG_DIR="${${(%):-%N}:A:h:h}"

# Load config script
source "$ZSH_CONFIG_DIR/lib/init.zsh"

