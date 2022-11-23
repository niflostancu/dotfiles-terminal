# Python environment tools
#

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

zi ice \
  submods='pyenv/pyenv-virtualenv -> plugins/pyenv-virtualenv' \
  atinit'
  export PYENV_ROOT="$PWD";
  [ -f zpyenv.zsh ] || { 
    ./libexec/pyenv init -;
    ./libexec/pyenv virtualenv-init -;
    echo "rehash"
  } >zpyenv.zsh' \
  as'program' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zi_load pyenv/pyenv

