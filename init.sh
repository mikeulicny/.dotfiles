#!/bin/sh

cd ~

mkdir -p ~/.config/nvim/lua

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
