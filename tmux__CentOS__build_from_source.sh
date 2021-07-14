# Steps to build and install tmux from source.

# Takes < 25 seconds on EC2 env [even on a low-end config instance].



VERSION=2.7

sudo yum -y remove tmux

sudo yum -y install wget tar libevent-devel ncurses-devel

wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz

tar xzf tmux-${VERSION}.tar.gz

rm -f tmux-${VERSION}.tar.gz

cd tmux-${VERSION}

./configure

sudo make install

cd -

sudo rm -rf /usr/local/src/tmux-*

sudo mv tmux-${VERSION} /usr/local/src



## Logout and login to the shell again and run.

## tmux -V
