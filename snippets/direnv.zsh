# Per-directory environments using direnv
#

# silence please!
export DIRENV_LOG_FORMAT=

if @quiet command -v direnv; then
    eval "$(direnv hook zsh)"
fi

