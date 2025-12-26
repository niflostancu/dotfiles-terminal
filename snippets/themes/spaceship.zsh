# Module for the spaceship prompt theme
# https://github.com/denysdovhan/spaceship-prompt
#

# customize after the theme is loaded
function .spaceship_theme_loaded() {
  # tuneup the theme a little
  SPACESHIP_PROMPT_ORDER=(
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
    # pyenv         # Pyenv section
    #dotnet        # .NET section
    #ember         # Ember.js section
    #kubecontext   # Kubectl context section
    exec_time     # Execution time
    exit_code     # Exit code section
    jobs          # Backgound jobs indicator
    time          # Time stamps section
    line_sep      # Line break
    vi_mode       # Vi-mode indicator
  )

  SPACESHIP_USER_SHOW=always
  SPACESHIP_USER_PREFIX=""
  SPACESHIP_USER_SUFFIX=""

  SPACESHIP_HOST_SHOW=always
  SPACESHIP_HOST_PREFIX="@"
  SPACESHIP_HOST_SUFFIX=" "

  SPACESHIP_TIME_SHOW=true
  SPACESHIP_TIME_PREFIX='('
  SPACESHIP_TIME_SUFFIX=') '

  SPACESHIP_PROMPT_ADD_NEWLINE=true
  SPACESHIP_PROMPT_SYMBOL=""
  SPACESHIP_DIR_TRUNC=0
  SPACESHIP_KUBECONTEXT_SHOW=false
  SPACESHIP_EXIT_CODE_SHOW=true
  SPACESHIP_EXIT_CODE_SUFFIX=" "
  SPACESHIP_VI_MODE_INSERT="➜"
  SPACESHIP_VI_MODE_NORMAL="●"
  SPACESHIP_VI_MODE_SUFFIX=" "
  SPACESHIP_VI_MODE_COLOR="yellow"
}

# Install Spaceship Prompt
plug "spaceship-prompt/spaceship-prompt"
plug "spaceship-prompt/spaceship-vi-mode"
.spaceship_theme_loaded

