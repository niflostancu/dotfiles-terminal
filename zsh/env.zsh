# Environment variables

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

# Paths
#
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# The list of directories that cd searches.
cdpath=(
  $cdpath
  "Documents/Projects"
)

# Development tools
#

# Golang
export GOPATH=${HOME}/.local/go:${HOME}/Documents/Go

# Set GPG TTY
export GPG_TTY=$(tty)

# Set the path
path=(
  ${HOME}/bin
  ${GOPATH}/bin
  ${HOME}/.nodejs/bin
  ${HOME}/.cache/nodejs/bin
  ${HOME}/.composer/vendor/bin
  /usr/local/{bin,sbin}
  $path
)

export PATH

