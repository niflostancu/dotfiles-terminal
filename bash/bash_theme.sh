# Defines the bash prompt theme
# From: https://github.com/mitsuhiko/dotfiles

__DEFAULT_COLOR="[00m"
__GRAY_COLOR="[37m"
__PINK_COLOR="[35m"
__GREEN_COLOR="[32m"
__ORANGE_COLOR="[33m"
__BLUE_COLOR="[34m"
__CYAN_COLOR="[36m"
__RED_COLOR="[31m"
__BOLD=$(tput bold)
__NORMAL=$(tput sgr0)

if [ `id -u` == '0' ]; then
  __USER_COLOR=$__RED_COLOR
else
  __USER_COLOR=$__ORANGE_COLOR
fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  __HOST_COLOR=$__PINK_COLOR
else
  __HOST_COLOR=$__BLUE_COLOR
fi

mitsuhikos_lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37m \033[31mx'
    echo -n $code
    echo -n $'\033[37m'
  fi
}

mitsuhikos_backgroundjobs() {
  jobs|python -c 'if 1:
    import sys
    items = ["\033[36m%s\033[37m" % x.split()[2]
             for x in sys.stdin.read().splitlines()]
    if items:
      if len(items) > 2:
        string = "%s, and %s" % (", ".join(items[:-1]), items[-1])
      else:
        string = ", ".join(items)
      print("\033[37m running %s" % string)
  '
}

mitsuhikos_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    if [[ $VIRTUAL_ENV == *.virtualenvs/* ]]; then
      ENV_NAME=`basename "${VIRTUAL_ENV}"`
    else
      folder=`dirname "${VIRTUAL_ENV}"`
      ENV_NAME=`basename "$folder"`
    fi
    echo -n $' \033[37mworkon \033[31m'
    echo -n $ENV_NAME
    echo -n $'\033[00m'
    # Shell title
    echo -n $'\033]0;venv:'
    echo -n $ENV_NAME
    echo -n $'\007'
  fi

  # Also setup our readline properly constantly since
  # stuff tends to overwrite this.
  stty werase undef
  bind '"\C-w": unix-filename-rubout'
}

export __BASEPROMPT='\e]0;\007\n${__BOLD}\e${__USER_COLOR}\u\
\e${__GRAY_COLOR}@\e${__HOST_COLOR}\h \
\e${__GRAY_COLOR}in \e${__CYAN_COLOR}\w\
`mitsuhikos_lastcommandfailed`\
`mitsuhikos_backgroundjobs`\
`mitsuhikos_virtualenv`\
\e${__DEFAULT_COLOR}${__NORMAL}'

export PS1="\[\033[G\]${__BASEPROMPT}
$ "

# Automatically trim long paths in the prompt (requires Bash 4.x)
# PROMPT_DIRTRIM=2

