#!/bin/sh

cd ~

# make .config directories
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/helix

# link files to $HOME directories
ln -s ~/.dotfiles/zsh/.fzf.zsh ~/.config/zsh/.fzf.zsh
ln -s ~/.dotfiles/zsh/.zshrc ~/.config/zsh/.zshrc
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.config/tmux/.tmux.conf

# link files to nested directories
cd .config/nvim/
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/.dotfiles/nvim/plugin_dir/ ~/.config/nvim/plugin_dir/
ln -s ~/.dotfiles/nvim/lua/init.lua ~/.config/nvim/lua/init.lua
ln -s ~/.dotfiles/helix/config.toml ~/.config/helix/config.toml