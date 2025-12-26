# Plugin manager utilities
#

ZAP_GIT_URL=https://github.com/zap-zsh/zap.git
ZAP_BRANCH="release-v1"

# Custom zi config
ZAP_INSTALL_DIR="$ZSH_CACHE_DIR/zap"

zconfig::plugin.init() {
  # check / install zi
  if [ ! -f "${ZAP_INSTALL_DIR}/zap.zsh" ]; then
    command git clone --branch="$ZAP_BRANCH" "$ZAP_GIT_URL" "${ZAP_INSTALL_DIR}"
  fi
  source "${ZAP_INSTALL_DIR}/zap.zsh"
}

zconfig::plugin.load_completions() {
  autoload -Uz compinit && \
    compinit -C -d "$ZSH_CACHE_DIR/zcompdump"
}

