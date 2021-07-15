# CentOS
sudo yum --enablerepo=epel -y install fuse-sshfs # to run appimages
sudo yum -y install ncurses-devel # fails to install further down for some reason
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
# centos with higher  gcc version for treesitter
sudo yum -y install centos-release-scl
sudo yum -y install devtoolset-7-gcc*
sudo rm -rf /usr/bin/gcc
sudo ln -s /opt/rh/devtoolset-7/root/usr/bin/gcc  /usr/bin/gcc
# hide lang warning
echo 'LANG=en_US.utf-8
LC_ALL=en_US.utf-8' | sudo tee -a /etc/environment  > /dev/null

# install nvim
wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/personal

# install prompt
rm $HOME/.zshrc # prevent conflicting with an existing file
npm install -g spaceship-prompt
rm $HOME/.zshrc # discard this, use mine
ln -s $HOME/personal/dotfiles/.zshrc $HOME/

# git colors
git config --global color.diff auto
git config --global color.status auto

# copy nvim config
mkdir $HOME/.config/nvim
ln -s $HOME/personal/dotfiles/init.vim $HOME/.config/nvim
ln -s $HOME/personal/dotfiles/lua $HOME/.config/nvim/

# vim-plugged (https://github.com/junegunn/vim-plug)
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# change shell
sudo chsh -s /usr/local/bin/zsh developer

# set git authorship
git config --global user.name "andrew"
git config --global user.email "andrew.closs2@ontario.ca"

# tmux config
./tmux__CentOS__build_from_source.sh
ln -s $HOME/personal/dotfiles/.tmux.conf $HOME
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
