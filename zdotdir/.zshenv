# ZSH environment script
# Loaded each time the zsh shell is used

# Load the user profile script (if not already loaded)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ -f "$XDG_CONFIG_HOME/profile.sh" ]]; then
	source "$XDG_CONFIG_HOME/profile.sh"
fi

# For debian-based systems, disable automatic compinit
skip_global_compinit=1

