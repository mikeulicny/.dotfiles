#!/bin/sh

cd ~

# check and create directories
if [ ! -d "~/.config" ]
then
    mkdir .config/
fi
if [ ! -d "~/.config/nvim" ]
then
    mkdir .config/nvim
fi
if [ ! -d "~/.config/nvim/lua" ]
then
    mkdir .config/nvim/lua
fi

# link files to $HOME directories
ln -s .dotfiles/zsh/.fzf.zsh
ln -s .dotfiles/zsh/.zsh
ln -s .dotfiles/tmux/.tmux.conf
ln -s .dotfiles/Xorg/.xinitrc
ln -s .dotfiles/Xorg/.Xresources

# link files to nested directories
cd .config/nvim/
ln -s ../../.dotfiles/nvim/init.vim
ln -s ../../.dotfiles/nvim/plugin_dir/
cd lua
ln -s ../../../.dotfiles/nvim/lua/init.lua
