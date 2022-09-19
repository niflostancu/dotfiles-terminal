# Per-directory environments using direnv
#

# silence please!
export DIRENV_LOG_FORMAT=

zi ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' src"zhook.zsh"
zi light direnv/direnv

