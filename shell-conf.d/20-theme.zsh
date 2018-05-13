#
# Appearance customization
#

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

SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SUFFIX=" "
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

