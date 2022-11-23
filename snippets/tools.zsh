# File synchronization utilities

# Navi shell documentation browser
zi_program_ghr
zi_load denisidoro/navi

# Mutagen container sync tool
zi_program_ghr
zi_load mutagen-io/mutagen

# CLI hex viewer
zi_program_ghr mv'hexyl* hexyl' sbin'**/hexyl(.exe|) -> hexyl'
zi_load @sharkdp/hexyl

# jq
zi wait lucid for if"(( ! ${+commands[jq]} ))" as"null" \
	atclone"autoreconf -fi && ./configure --with-oniguruma=builtin && make \
	&& ln -sfv $PWD/jq.1 $ZI[MAN_DIR]/man1" sbin"jq" \
  stedolan/jq

