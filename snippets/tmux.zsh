# TMUX-shell integration

# Autoload tmux
TMUX_AUTOSTART=${TMUX_AUTOSTART:-1}
TMUX_AUTOSTART_SESSION=${TMUX_AUTOSTART_SESSION:-tmp}

TMUX_INTEGRATION_PLUGIN="$XDG_CONFIG_HOME/tmux/tmux-integration.plugin.sh"
if [[ -f "$TMUX_INTEGRATION_PLUGIN" ]]; then
  source "$TMUX_INTEGRATION_PLUGIN"
fi

if [[ -n "$TMUX_PANE" ]]; then
  _TMUX_SESS_WIN_PANE="$(tmux display-message -p '#S/#I/#P')"
  if [[ "$_TMUX_SESS_WIN_PANE" == "$TMUX_AUTOSTART_SESSION/1/1" ]]; then
    if type "fastfetch" > /dev/null; then
      echo
      fastfetch
    fi
  fi
fi

