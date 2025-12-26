# Key bindings
#

# defaults
ZCFG_VI_MODE=${ZCFG_VI_MODE:-1}
ZCFG_INSTALL_FZF=${ZCFG_INSTALL_FZF:-1}

# 10ms for key sequences
KEYTIMEOUT=1

# Fuzzy Finder (needs to be installed via package manager)
plug 'zap-zsh/fzf'

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

function zsh_init_keybindings() {
  if zle -l fzf-history-widget &>/dev/null; then
    # use fzf for Ctrl+R
    bindkey '^R' fzf-history-widget
  fi

  bindkey "^[[A" up-line-or-beginning-search # Up
  bindkey "^[[B" down-line-or-beginning-search # Down

  # Ctrl+Left/Right to go through words
  bindkey "^[[1;5C" forward-word
  bindkey "^[[1;5D" backward-word

  bindkey "${terminfo[khome]}" beginning-of-line
  bindkey "${terminfo[kend]}" end-of-line
}

# VI mode?
if [[ "$ZCFG_VI_MODE" == "1" && -z "$NVIM" ]]; then
  zvm_after_init_commands+=(zsh_init_keybindings)
  plug "jeffreytse/zsh-vi-mode"
else
  zsh_init_keybindings
fi

