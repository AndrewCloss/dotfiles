= Package Installations =

1. https://github.com/tmux/tmux
  - sudo apt install tmux
2. https://github.com/powerline/fonts
  - sudo apt-get install fonts-powerline
  - For the tmux statusline symbols
  - Provides more font selections for the terminal, recommend ProFont
  - May require a manual installation depending on OS

= Symbolic links =

1. vim config
  - ln -s init.vim ~/.config/nvim/init.vim
2. lint JS and Vue.js
  - ln -s .eslintrc.js project_dir
3. tmux config
  - ln -s .tmux.conf ~/

= Synchronize clipboard in WSL with win32yank.exe =

curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
sudo apt install unzip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

= Potential plugins =

https://github.com/prettier/vim-prettier
