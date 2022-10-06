# Python environment tools
#

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

zi ice atclone'{ 
    export PYENV_ROOT="$PWD"; ./libexec/pyenv init -;
    ./libexec/pyenv virtualenv-init -;
    echo "rehash"
  } > zpyenv.zsh' \
  submods='pyenv/pyenv-virtualenv -> plugins/pyenv-virtualenv' \
  atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" run-atpull \
  as'program' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zi_load pyenv/pyenv

