# TMUX-shell integration

# Autoload tmux
TMUX_AUTOSTART=${TMUX_AUTOSTART:-1}
TMUX_AUTOSTART_SESSION=${TMUX_AUTOSTART_SESSION:-tmp}

TMUX_INTEGRATION_PLUGIN="$XDG_CONFIG_HOME/tmux/tmux-integration.plugin.sh"
if [[ -f "$TMUX_INTEGRATION_PLUGIN" ]]; then
  source "$TMUX_INTEGRATION_PLUGIN"
fi

