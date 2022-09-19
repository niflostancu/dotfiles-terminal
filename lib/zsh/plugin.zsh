# Plugin manager utilities
#

ZI_GIT_URL=https://github.com/z-shell/zi.git

# Custom zi config
typeset -Ag ZI
export ZI[HOME_DIR]="$ZSH_CACHE_DIR"
export ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"

zconfig::plugin.init() {
  # check / install zi
  if [[ -f "$ZSH_CACHE_DIR/bin/zinit.zsh" ]]; then
    echo "Old zinit cache found. Please delete $ZSH_CACHE_DIR to continue!" >&2
    return 1
  fi
  if [ ! -f "${ZI[BIN_DIR]}/zi.zsh" ]; then
    command mkdir -p "${ZI[BIN_DIR]}"
    command git clone "$ZI_GIT_URL" "${ZI[BIN_DIR]}"
  fi
  source "${ZI[BIN_DIR]}/zi.zsh"
}

zconfig::plugin.load_completions() {
  autoload -Uz compinit && \
    compinit -C -d "$ZSH_CACHE_DIR/zcompdump"
  zi cdreplay -q
}

