# Appearance customization

# Set up colored less and grep
export LESS='-g -i -M -R -S -w -z-4'
export GREP_COLOR='38;5;202'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi


# Spaceship theme options
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  #node          # Node.js section
  #ruby          # Ruby section
  #elixir        # Elixir section
  #xcode         # Xcode section
  #swift         # Swift section
  golang        # Go section
  #php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  #julia         # Julia section
  #docker        # Docker section
  #aws           # Amazon Web Services section
  venv          # virtualenv section
  #conda         # conda virtualenv section
  pyenv         # Pyenv section
  #dotnet        # .NET section
  #ember         # Ember.js section
  #kubecontext   # Kubectl context section
  exec_time     # Execution time
  exit_code     # Exit code section
  line_sep      # Line break
  jobs          # Backgound jobs indicator
  vi_mode       # Vi-mode indicator
)

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SYMBOL=""
SPACESHIP_DIR_TRUNC=0
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_VI_MODE_INSERT="➜"
SPACESHIP_VI_MODE_NORMAL="●"
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_VI_MODE_SUFFIX=" "
SPACESHIP_EXIT_CODE_SUFFIX=" "
SPACESHIP_VI_MODE_COLOR="yellow"

# Fast highlight customization
typeset -gA FAST_HIGHLIGHT_STYLES

# Aliases and functions
#FAST_HIGHLIGHT_STYLES[alias]='fg=068'
#FAST_HIGHLIGHT_STYLES[function]='fg=028'

# Commands and builtins
#FAST_HIGHLIGHT_STYLES[command]="fg=166"
#FAST_HIGHLIGHT_STYLES[hashed-command]="fg=blue"
#FAST_HIGHLIGHT_STYLES[builtin]="fg=202"

# Paths
#FAST_HIGHLIGHT_STYLES[path]='fg=244'

# Globbing
#FAST_HIGHLIGHT_STYLES[globbing]='fg=130,bold'

# Options and arguments
#FAST_HIGHLIGHT_STYLES[single-hyphen-option]='fg=124'
#FAST_HIGHLIGHT_STYLES[double-hyphen-option]='fg=124'

#FAST_HIGHLIGHT_STYLES[back-quoted-argument]="fg=065"
#FAST_HIGHLIGHT_STYLES[single-quoted-argument]="fg=065"
#FAST_HIGHLIGHT_STYLES[double-quoted-argument]="fg=065"
#FAST_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=065"
#FAST_HIGHLIGHT_STYLES[back-double-quoted-argument]="fg=065"

#FAST_HIGHLIGHT_STYLES[default]='none'
#FAST_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
#FAST_HIGHLIGHT_STYLES[reserved-word]='fg=green'
#FAST_HIGHLIGHT_STYLES[precommand]='none'
#FAST_HIGHLIGHT_STYLES[commandseparator]='fg=214'
#FAST_HIGHLIGHT_STYLES[history-expansion]='fg=blue'

#FAST_HIGHLIGHT_STYLES[comment]='fg=gray,bold'
#FAST_HIGHLIGHT_STYLES[assign]='none'

