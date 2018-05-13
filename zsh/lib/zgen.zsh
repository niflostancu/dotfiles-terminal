# Zgen configuration script

# The path to the installed plugins
ZGEN_DIR="$ZSH_CACHE_DIR/plugins"
# The path to zgen scripts
ZGEN_INSTALL_DIR="$ZSH_CACHE_DIR/zgen"

# Disable Zgen's compinit
ZGEN_AUTOLOAD_COMPINIT=0

zconfig_plugin_files=()

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

# called when the cache is compiled to add the zgen plugins
zconfig_zgen_rebuild() {
  zgen reset

  for file in ${(@)zconfig_plugin_files}; {
    source "$file"
  }

  zgen save
}

