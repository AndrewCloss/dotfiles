export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Created by newuser for 5.8
fpath=($fpath "/home/developer/.zfunctions")
autoload -U promptinit; promptinit
prompt spaceship

# SPACESHIP_CHAR_SYMBOL=☯
# SPACESHIP_CHAR_SYMBOL=♞
SPACESHIP_CHAR_SYMBOL=λ
SPACESHIP_CHAR_SUFFIX=" "
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

ZSH_CUSTOM=$HOME/.config/ohmyzsh/custom

# alias vim="~/nvim.appimage"
# alias nvim="~/nvim.appimage"
alias nvimconfig="nvim $MYVIMRC"
alias vimconfig="nvim $MYVIMRC"
# export TERM=xterm-256color
# fpath=($fpath "/home/developer/.zfunctions")

alias nvim='/usr/local/bin/nvim.appimage'
alias sudo='sudo '
alias vim='nvim'
alias pa='php artisan'
alias nvimconfig='nvim ~/personal/dotfiles/init.vim'

export VISUAL='/usr/local/bin/nvim.appimage'
export EDITOR="$VISUAL"
export GIT_EDITOR='/usr/local/bin/nvim.appimage'
# export VISUAL=vim
# export EDITOR="$VISUAL"
# export GIT_EDITOR=vim
nvm use 14.16.1
