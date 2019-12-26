This folder can be readily used as `ZDOTDIR`, containing `.zshenv` and `.zshrc`
files with the required routines for loading *zconfig*.

Also useful for testing new configuration scripts:
```sh
ZDOTDIR=$(pwd)/zdotdir ZCONFIG_PROFILE=workstation ZCONFIG_TEST=1 zsh -d
```

