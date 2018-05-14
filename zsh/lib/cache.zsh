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
  # zconfig_compile "$ZSH_CACHE_DIR/zcompdump"
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

# Script to rebuild the config cache
zconfig_rebuild_cache() {
  mkdir -p "$ZSH_CACHE_DIR"
  local ZCACHE="$ZSH_CACHE_DIR/config.zsh"

  # reload files
  source "$ZSH_CONFIG_DIR/lib/utils.zsh"
  source "$ZSH_CONFIG_DIR/lib/zgen.zsh"
  source "$ZSH_CONFIG_DIR/lib/cache.zsh"
  
  e_header "Rebuilding config cache..."

  # The directory containing the configuration files to compile
  local conf_dir="$(dirname "$ZSH_CONFIG_DIR")/shell-conf.d"
  local -a conf_files
  conf_files=()
  zconfig_plugin_files=()  # note: this is global, shared with lib/zgen.zsh
  # need to append the plugin loading code after config #5x
  # basically, the plugin loading code would be 60
  local plugins_entry_found=
  while IFS=  read -r -d $'\0' file; do
    if [[ "$file" =~ '/5[0-9][^/]+\.zsh$' ]]; then
      zconfig_plugin_files+=("$file")
      plugins_entry_found=1
      continue
    fi
    if [[ -n $plugins_entry_found ]]; then
      conf_files+=("$ZGEN_DIR/init.zsh")
      plugins_entry_found=
    fi
    conf_files+=("$file")
  done < <(find "$conf_dir" '(' -iname '*.zsh' -o -iname '*.sh' ')' -print0 | sort -n -z)

  if [[ -n $plugins_entry_found ]]; then
    conf_files+=("$ZGEN_DIR/init.zsh")
  fi

  # rebuild the zgen init script
  rm -f "$ZSH_CACHE_DIR/zcompdump"
  zconfig_zgen_rebuild
  echo 'zconfig_compinit' >> "$ZGEN_DIR/init.zsh"
  zconfig_optimize

  local -a files
  files=(
    "lib/utils.zsh"
    "lib/zgen.zsh"
    "lib/cache.zsh"
    $conf_files
  )

  echo "# This file is generated automatically, do not edit by hand!" > "$ZCACHE"
  echo "# Edit the files in $ZSH_CONFIG_DIR instead!" >> "$ZCACHE"

  for file in $files; do
    [[ "$file" != '/'* ]] && file="$ZSH_CONFIG_DIR/$file"
    if [[ -f "$file" ]]; then
      zconfig_cache_file "$file"
    fi
  done

  # Compile the generated file
  zcompile "$ZCACHE"
  e_success "All done!"
}

