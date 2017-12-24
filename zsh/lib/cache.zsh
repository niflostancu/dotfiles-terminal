# ZSH config caching routines
# Inspired by https://github.com/Tuurlijk/dotfiles

# Function to determine the need of a zcompile. If the .zwc file
# does not exist, or the base file is newer, we need to compile.
# man zshbuiltins: zcompile
zconfig_compile() {
  if [[ -s "${1}" && ( ! -s "${1}.zwc" || "${1}" -nt "${1}".zwc) ]]; then
    zcompile ${1}
  fi
}

# Compinit with optimization
zconfig_compinit() {
  autoload -Uz compinit && \
    compinit -C -d "$ZSH_CACHE_DIR/zcompdump"
  zconfig_compile "$ZSH_CACHE_DIR/zcompdump"
}

# Scans and recompiles all scripts that have been changed since last time
zconfig_optimize() {
  # zcompile almost everything
  for file in "${ZGEN_DIR}"/**/*.zsh(-theme|); do
    zconfig_compile ${file}
  done
}

zconfig_cache_file() {
  local ZCACHE="$ZSH_CACHE_DIR/config.zsh"
  local file="$1"

  echo "#"             >> "$ZCACHE"
  echo "# ${file:t}:"  >> "$ZCACHE"
  echo "#"             >> "$ZCACHE"
  cat "$file"          >> "$ZCACHE"
}

# Load all custom settings from one cached file
zconfig_rebuild_cache() {
  mkdir -p "$ZSH_CACHE_DIR"
  local ZCACHE="$ZSH_CACHE_DIR/config.zsh"

  # reload files
  source "$ZSH_CONFIG_DIR/lib/utils.zsh"
  source "$ZSH_CONFIG_DIR/lib/zgen.zsh"
  source "$ZSH_CONFIG_DIR/lib/cache.zsh"
  
  e_header "Rebuilding config cache..."

  # rebuild zgen init script
  rm -f "$ZSH_CACHE_DIR/zcompdump"
  zconfig_zgen_rebuild
  echo 'zconfig_compinit' >> "$ZGEN_DIR/init.zsh"
  zconfig_optimize

  # Concatenate Config files
  local include_files=(
    "lib/utils.zsh"
    "lib/zgen.zsh"
    "lib/cache.zsh"
    $ZCONFIG_BEFORE
    "$ZGEN_DIR/init.zsh"
    $ZCONFIG_AFTER
  )

  echo "# This file is generated automatically, do not edit by hand!" > "$ZCACHE"
  echo "# Edit the files in ~/.config/zsh instead!" >> "$ZCACHE"

  for file in $include_files; do
    [[ "$file" != '/'* ]] && file="$ZSH_CONFIG_DIR/$file"
    if [[ -f "$file" ]]; then
      zconfig_cache_file "$file"
    fi
  done

  # Compile the generated file
  zcompile "$ZCACHE"
  e_success "All done!"
}

