# Remote server profile
# Lightweight on plugins (though retaining the fancy appearance and usability)

@zconfig-snippet "tweaks"
@zconfig-snippet "history"
@zconfig-snippet "keybindings"

# Local customizations
@zconfig-snippet --optional "paths.local"

@zconfig-snippet "aliases"
@zconfig-snippet "alias-pretty"

# zsh theme
if type "starship" &>/dev/null; then
	@zconfig-snippet "themes/starship"
else
	@zconfig-snippet "themes/spaceship"
fi

@zconfig-snippet "syntax-highlight"
@zconfig-snippet "completion"

