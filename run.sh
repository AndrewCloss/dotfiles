# nvim-lspconfig
npm install -g vls
npm install -g intelephense
npm install -g vscode-json-languageserver

# # ctags (for vista.vim)
# cd ~/personal
# git clone https://github.com/universal-ctags/ctags.git
# cd ctags
# ./autogen.sh
# ./configure
# make
# make install
# cd ../
# rm -rf ctags

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# https://github.com/Powerlevel9k/powerlevel9k/issues/1355
sudo yum update -y
sudo yum install -y git make ncurses-devel gcc autoconf man yodl
git clone -b zsh-5.7.1 https://github.com/zsh-users/zsh.git /tmp/zsh
cd /tmp/zsh
./Util/preconfig
./configure
sudo make -j 20 install

git config --global color.diff auto
git config --global color.status auto
