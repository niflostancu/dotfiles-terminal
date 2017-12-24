# Zgen configuration script

# The path to the installed plugins
ZGEN_DIR="$ZSH_CACHE_DIR/plugins"
# The path to zgen scripts
ZGEN_INSTALL_DIR="$ZSH_CACHE_DIR/zgen"

# Disable Zgen's compinit
ZGEN_AUTOLOAD_COMPINIT=0

# Lazy-load zgen
if ! type "zgen" > /dev/null; then
  zgen() {
    if [[ ! -s "$ZGEN_INSTALL_DIR/zgen.zsh" ]]; then
      git clone --recursive "https://github.com/tarjoilija/zgen.git" "$ZGEN_INSTALL_DIR"
    fi
    source "$ZGEN_INSTALL_DIR/zgen.zsh"
    zgen "$@"
  }
fi

zconfig_zgen_rebuild() {
  zgen reset
  zconfig_plugins_include
  zgen save
}

ZCONFIG_LIB_LOADED=1

