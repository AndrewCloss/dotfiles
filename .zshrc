# Created by newuser for 5.8
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  # user          # Username section
  dir           # Current directory section
  # host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  # exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  # exit_code     # Exit code section
  char          # Prompt character
)

function greet {
  local RED='\033[0;31m'
  local WHITE='\033[1;37m'

  echo -e "${WHITE}              人  工  知  能  や  ロ  ボ  ッ  ト  エ  学              "
  echo -e "${RED}####    ####       ###     ####      #### ####    #####      ###"
  echo -e "${RED}####    ####      #####    #####     #### ####   #####      #####"
  echo -e "${RED}####    ####     #######   ######    #### ####  ####       #######"
  echo -e "${RED}############    #### ####  #######   #### ########        #### ####"
  echo -e "${RED}############   ####   #### ########  #### #########      ####   ####"
  echo -e "${RED}####    ####  ####     ######## #### #### ##### #####   ####     ####"
  echo -e "${RED}####    #### ####       #######  ######## ####   ##### ####       ####"
  echo -e "${RED}####    ########         ######   ####### ####    ########         ####"
  echo -e "${WHITE}       R       O       B       O       T       I       C       S      "
  echo -e "\n"
}

greet

alias vim="nvim"
alias nvimconfig="nvim $MYVIMRC"
alias vimconfig="nvim $MYVIMRC"
