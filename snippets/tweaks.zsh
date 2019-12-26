# ZSH interactive tweaks
#

# enable comments and extended glob in the interactive shell
setopt interactivecomments
setopt extended_glob

# Enter dirs without cd, cd history saving (use `dirs -v` to see it)
setopt auto_cd autopushd pushdignoredups

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

