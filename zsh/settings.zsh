# Generic ZSH settings
# NOTE: this file is loaded before any plugin!

mkdir -p "$ZSH_DATA_DIR"

# History configuration
HISTFILE="$ZSH_DATA_DIR/history"
HISTSIZE=100000
SAVEHIST=100000
HIST_STAMPS="dd.mm.yyyy"
HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

setopt inc_append_history
setopt extended_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# misc ZSH options
setopt auto_cd
setopt interactivecomments
setopt extended_glob

