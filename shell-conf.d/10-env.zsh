#
# ZSH-specific environment variables.
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# The list of directories that cd searches.
cdpath=(
  $cdpath
)

# Note: don't use $path (it is zsh specific);
# it's better set up $PATH inside the profile config file.

# path = (
#   "${HOME}/bin"
#   /usr/local/bin
#   $path
# )

# Set GPG TTY
export GPG_TTY=$(tty)

# Remote bashrc gist (you can override it inside a 10-envx.local conf. file)
BASHRC_PUBLIC_URL=""

