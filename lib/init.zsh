# Entrypoint for ZConfig - personal ZSH configuration framework
# Source it in zshrc to enable its features.
#

ZCONFIG_DATA_ID=${ZCONFIG_DATA_ID:-zconfig}
[[ "$ZCONFIG_TEST" != "1" ]] || ZCONFIG_DATA_ID="zconfig_test"

[[ -n "$ZSH_CONFIG_DIR" ]] || ZSH_CONFIG_DIR="${0:a:h:h}"
[[ -n "$ZSH_CACHE_DIR" ]] || ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/$ZCONFIG_DATA_ID"
[[ -n "$ZSH_DATA_DIR" ]] || ZSH_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/$ZCONFIG_DATA_ID"

source "$ZSH_CONFIG_DIR/lib/zsh/utils.zsh"
source "$ZSH_CONFIG_DIR/lib/zsh/plugin.zsh"
source "$ZSH_CONFIG_DIR/lib/zsh/profile.zsh"

# init the plugin manager
zconfig::plugin.init || return 1

# load the profile and snippets
zconfig::load-profile || return 1

# load the completions defined by the snippets / plugins
zconfig::plugin.load_completions || return 1

