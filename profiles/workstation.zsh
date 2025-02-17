# Developer workstation profile.
# All plugins and modules are enabled.

@zconfig-snippet "tweaks"
@zconfig-snippet "history"
@zconfig-snippet "keybindings"

# Local customizations
@zconfig-snippet --optional "paths.local"

ZCFG_VIM_AS_MAN="nvim '+Man!'"
@zconfig-snippet "aliases"
@zconfig-snippet "alias-pretty"

@zconfig-snippet "ssh"
@zconfig-snippet "tmux"
@zconfig-snippet "direnv"
@zconfig-snippet "python"
@zconfig-snippet "tools"

# zsh theme
@zconfig-snippet "themes/spaceship"

@zconfig-snippet "syntax-highlight"
@zconfig-snippet "completion"

