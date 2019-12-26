# Plugin manager utilities
#

ZPLUGIN_GIT_URL=https://github.com/zdharma/zplugin.git
ZPLUGIN_DIR="${ZSH_CACHE_DIR}/bin"

# Custom zplugin paths
declare -A ZPLGM
ZPLGM[BIN_DIR]="$ZPLUGIN_DIR"
ZPLGM[HOME_DIR]="$ZSH_CACHE_DIR"

zconfig::plugin.init() {
  # check / install zplugin
  if [ ! -f "$ZPLUGIN_DIR/zplugin.zsh" ]; then
    mkdir -p "$(dirname "$ZPLUGIN_DIR")"
    git clone "$ZPLUGIN_GIT_URL" "$ZPLUGIN_DIR"
  fi
  source "$ZPLUGIN_DIR/zplugin.zsh"
}

zconfig::plugin.load_completions() {
  autoload -Uz compinit && \
    compinit -C -d "$ZSH_CACHE_DIR/zcompdump"
  zplugin cdreplay -q
}

