# install our usual packages
sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

sudo pacman -S cmake github-cli gcc

# Of course, we need tmux configured right.
wget http://media.pragprog.com/titles/bhtmux/code/workflows/tmux.conf
mv tmux.conf ~/.tmux.conf

# TODO: maybe we need rust installed again?
