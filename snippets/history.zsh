# ZSH history settings
#

[[ -d "$ZSH_DATA_DIR" ]] || mkdir -p "$ZSH_DATA_DIR"

# Store the history file inside the persisted data dir
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

# Prompt autosuggestions based on history
zplugin light zsh-users/zsh-autosuggestions

# Up-Down based history search
zplugin light zsh-users/zsh-history-substring-search

