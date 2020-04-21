# Environment setup for zconfig
# Source it in zshenv for auto-loading the profile scripts + workarounds.
#

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
ZSH_CONFIG_DIR="${ZSH_CONFIG_DIR:-${0:a:h:h}}"

# Load the user profile script
if [[ -f "$XDG_CONFIG_HOME/profile.sh" ]]; then
  source "$XDG_CONFIG_HOME/profile.sh"
else
  # load the default profile
  source "$ZSH_CONFIG_DIR/profile.sh"
fi

# For debian-based systems, disable automatic compinit
skip_global_compinit=1

