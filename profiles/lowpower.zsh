# Low power profile.
# Currently, all snippets are enabled.

@zconfig-snippet "tweaks"
@zconfig-snippet "history"
@zconfig-snippet "keybindings"

# Local customizations
@zconfig-snippet --optional "paths.local"

@zconfig-snippet "aliases"
@zconfig-snippet "alias-pretty"
@zconfig-snippet "ssh"
@zconfig-snippet "tmux"

# zsh theme
if type "starship" &>/dev/null; then
	@zconfig-snippet "themes/starship"
else
	@zconfig-snippet "themes/spaceship"
fi

@zconfig-snippet "syntax-highlight"
@zconfig-snippet "completion"


