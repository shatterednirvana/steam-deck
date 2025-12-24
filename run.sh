# install our usual packages
sudo steamos-readonly disable

# restore header files that steamos hides to save space
# TODO: actually i don't think we need this (I suspect the problem was that we
# didn't have the symlinks below setup right, but leave this in until we try
# this on the next run).
#sudo steamos-devmode enable

# install things that let us compile packages
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

sudo pacman -S make cmake github-cli gcc

# Of course, we need tmux configured right.
wget http://media.pragprog.com/titles/bhtmux/code/workflows/tmux.conf
mv tmux.conf ~/.tmux.conf

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Link installed headers to the standard location
# TODO: The directory inside of /usr/lib/modules changes. We should really make
# sure it exists before creating the symlink.
sudo pacman -S glibc
sudo pacman -S linux-neptune-headers
sudo ln -s /usr/lib/modules/5.13.0-valve37-1-neptune/build/include/uapi/linux /usr/include/linux
sudo ln -s /usr/lib/modules/5.13.0-valve37-1-neptune/build/include/uapi/asm-generic /usr/include/asm-generic
sudo ln -s /usr/lib/modules/5.13.0-valve37-1-neptune/build/include/uapi/sound /usr/include/sound
sudo ln -s /usr/lib/modules/5.13.0-valve37-1-neptune/build/include/uapi/video /usr/include/video
sudo ln -s /usr/lib/modules/5.13.0-valve37-1-neptune/build/arch/x86/include/generated/uapi/asm /usr/include/asm

# Other random stuff you needed to install to do OpenGL dev in Rust.
sudo pacman -S bzip2 libpng freeglut expat brotli graphite libsysprof-capture pcre2 harfbuzz 

# See https://github.com/jmparis/steam-deck-dev-installation/blob/main/steam-deck-dev-installation.sh
# if you run into problems again.
