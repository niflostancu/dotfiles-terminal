# Common zconfig routines.
#

# Load colors plugin
autoload colors; colors

# Colourfull messages
zconfig::utils.success() { echo ${fg[green]} "✔ $@" $reset_color; }
zconfig::utils.error()   { echo ${fg[red]} "✖ $@" $reset_color; }

# execute a command silently (stdout/err redirection)
function @quiet() {
  "$@" >/dev/null 2>&1
}

