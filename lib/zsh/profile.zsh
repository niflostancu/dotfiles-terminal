# Routines for snippet and profiles management

ZCONFIG_PROFILES_PATH=(
  "${ZSH_CONFIG_DIR}/profiles.local"
  "${ZSH_CONFIG_DIR}/profiles"
)
[[ -z "$ZCONFIG_PROFILES_CUSTOM" ]] || \
  ZCONFIG_PROFILES_PATH=("$ZCONFIG_PROFILES_CUSTOM" ${ZCONFIG_PROFILES_PATH})

ZCONFIG_SNIPPETS_PATH=(
  "${ZSH_CONFIG_DIR}/snippets.local"
  "${ZSH_CONFIG_DIR}/snippets"
)
[[ -z "$ZCONFIG_SNIPPETS_CUSTOM" ]] || \
  ZCONFIG_SNIPPETS_PATH=("$ZCONFIG_SNIPPETS_CUSTOM" ${ZCONFIG_SNIPPETS_PATH})

# finds and loads the configured profile script
zconfig::load-profile() {
  if [[ -z "$ZCONFIG_PROFILE" ]]; then
    zconfig::utils.error "No zconfig profile set!" >&2
    return 1
  fi
  # find the profile script
  local profile_script=
  local dir=
  for dir in ${ZCONFIG_PROFILES_PATH}; do
    if [ -f "$dir/$ZCONFIG_PROFILE.zsh" ]; then
      profile_script="$dir/$ZCONFIG_PROFILE.zsh"
      break
    fi
  done
  if [[ -z "$profile_script" ]]; then
    zconfig::utils.error "Could not find profile script '$ZCONFIG_PROFILE.zsh'!" >&2
    echo "Searched dirs: " >&2
    printf '%s\n' $ZCONFIG_PROFILES_PATH >&2
    return 1
  fi
  source "$profile_script"
}

# searches and loads the specified zconfig snippet
@zconfig-snippet() {
  local optional=
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --optional)
        optional=1; ;;
      -*)
        zconfig::utils.error "Invalid option: $1!" >&2
        return 1 ;;
      *)
        break ;;
    esac
    shift
  done
  local snippet_script=
  local dir=
  local matched_files=

  for dir in ${ZCONFIG_SNIPPETS_PATH}; do
    matched_files=( "$dir/$1".{sh,zsh}(N) )
    if [ ${#matched_files[@]} -gt 0 ]; then
      snippet_script="${matched_files:0}"
      break
    fi
  done
  if [[ -z "$snippet_script" ]]; then
    if [[ "$optional" == "1" ]]; then
      return 0
    fi
    zconfig::utils.error "Could not find snippet '$1'!" >&2
    echo "Searched dirs: " >&2
    printf '%s\n' $ZCONFIG_SNIPPETS_PATH >&2
    return 1
  fi
  source "$snippet_script"
}

