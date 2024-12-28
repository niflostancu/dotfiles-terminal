# ZSH history settings
#

[[ -d "$ZSH_DATA_DIR" ]] || mkdir -p "$ZSH_DATA_DIR"

# Store the history file inside the persisted data dir
ZCONFIG_HISTORY_NAME=${ZCONFIG_HISTORY_NAME:-"history"}
ZCONFIG_HISTORY_MERGE=${ZCONFIG_HISTORY_MERGE:-"history.*"}
_HIST_LOCK_FILE="$ZSH_CACHE_DIR/histfile.lock"

HISTFILE="$ZSH_DATA_DIR/$ZCONFIG_HISTORY_NAME"
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

# merges multiple history files (eliminating duplicates)
function zconfig_hist_merge() {
	(
		setopt nullglob
		local own_histfile="$ZSH_DATA_DIR/$ZCONFIG_HISTORY_NAME"
		local merge_files=("$@")
		if [[ -z "$@" ]]; then
			merge_files=("$ZSH_DATA_DIR/"${~ZCONFIG_HISTORY_MERGE})
		fi
		merge_files+=("$own_histfile")
		for histf in "${merge_files[@]}"; do
			builtin fc -R -I "$histf"
		done
		builtin fc -W
		echo "History merged: ${merge_files[@]}!"
	)
}

if [[ -n "$ZCONFIG_HISTORY_MERGE" ]]; then
	[[ -f "$_HIST_LOCK_FILE" ]] || touch --date="yesterday" "$_HIST_LOCK_FILE"
	(
		flock -n 9 || exit 0
		own_histfile="$ZSH_DATA_DIR/$ZCONFIG_HISTORY_NAME"
		mins_ago=$(date -d 'now - 5 min' +%s)
		hist_time=$(date -r "$_HIST_LOCK_FILE" +%s)
		if (( hist_time >= mins_ago )); then
			exit 0
		fi
		touch "$_HIST_LOCK_FILE"
		# expand the files
		setopt nullglob
		merge_files=("$ZSH_DATA_DIR/"${~ZCONFIG_HISTORY_MERGE})
		proceed_merge=
		for histf in $merge_files; do
			if [[ "$histf" == "$own_histfile" ]]; then continue; fi
			if [[ -f "$histf" && "$histf" -nt "$own_histfile" ]]; then
				proceed_merge=1
				break
			fi
		done
		if [[ -n "$proceed_merge" ]]; then
			zconfig_hist_merge
		fi
	) 9<"$_HIST_LOCK_FILE"
fi

# Prompt autosuggestions based on history
zi_load zsh-users/zsh-autosuggestions

# Up-Down based history search
zi_load zsh-users/zsh-history-substring-search

