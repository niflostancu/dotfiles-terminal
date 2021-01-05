# Per-directory environments using direnv
#

# silence please!
export DIRENV_LOG_FORMAT=

zplugin as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' pick"direnv" src"zhook.zsh" for \
  direnv/direnv

