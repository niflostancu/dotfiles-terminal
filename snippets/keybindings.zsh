# Key bindings
#

# defaults
ZCFG_VI_MODE=${ZCFG_VI_MODE:-1}
ZCFG_INSTALL_FZF=${ZCFG_INSTALL_FZF:-1}

# VI mode?
if [[ "$ZCFG_VI_MODE" == "1" ]]; then
  zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
fi

# 10ms for key sequences
KEYTIMEOUT=1

# Fuzzy Finder (needs to be installed via package manager)
HAS_FZF=0
if [[ "$ZCFG_INSTALL_FZF" == "1" ]]; then
  zplugin ice from"gh-r" as"program"
  zplugin load junegunn/fzf-bin
  zplugin ice pick"shell/key-bindings.zsh"
  zplugin light junegunn/fzf
  HAS_FZF=1
elif [[ -s "/usr/share/fzf/key-bindings.zsh" ]]; then
  zplugin load "/usr/share/fzf/key-bindings.zsh"
  zplugin load "/usr/share/fzf/completion.zsh"
  HAS_FZF=1
fi
if [[ "$HAS_FZF" == "1" ]]; then
  # use fzf for Ctrl+R
  bindkey '^R' fzf-history-widget
fi

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Ctrl+Left/Right to go through words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

