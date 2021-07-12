# CentOS
# To run appimages
sudo yum --enablerepo=epel -y install fuse-sshfs # for CentOS 

sudo yum -y install ncurses-devel 
# ZSH
# https://github.com/Powerlevel9k/powerlevel9k/issues/1355
sudo yum update -y
sudo yum install -y ncurses-devel git make gcc autoconf man yodl
git clone -b zsh-5.7.1 https://github.com/zsh-users/zsh.git /tmp/zsh
cd /tmp/zsh
./Util/preconfig
./configure
sudo make -j 20 install
cd $HOME/personal/dotfiles
rm -rf /tmp/zsh

# install nvim
wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/personal

# install prompt
npm install -g spaceship-prompt
rm $HOME/.zshrc
ln -s $HOME/personal/dotfiles/.zshrc $HOME/

# git colors
git config --global color.diff auto
git config --global color.status auto
