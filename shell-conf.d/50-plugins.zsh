#
# This file (or any within the 5x series) defines the plugins to be loaded.
#
# Anything after this gets executed after the plugins were loaded.
# Basically, the plugin loading script gets appended at #60
#


# prerequisites for Oh-My-Zsh based themes
zgen oh-my-zsh "lib/git.zsh"
zgen oh-my-zsh "lib/prompt_info_functions.zsh"
zgen oh-my-zsh "lib/theme-and-appearance.zsh"

# All hail VI
zgen oh-my-zsh "plugins/vi-mode"
# FISH-like command auto suggestions
zgen load zsh-users/zsh-autosuggestions
# Up-Down based history search
zgen load zsh-users/zsh-history-substring-search
# Enhanced ls script
zgen load supercrabtree/k

# Fuzzy Finder (needs to be installed via package manager)
if [[ -s "/usr/share/fzf/key-bindings.zsh" ]]; then
  zgen load /usr/share/fzf/key-bindings.zsh
  zgen load /usr/share/fzf/completion.zsh
fi

# Spaceship Theme (requires OMZ)
zgen load denysdovhan/spaceship-zsh-theme spaceship

# Fast command-line syntax highlighting
zgen load zdharma/fast-syntax-highlighting

