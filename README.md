# .dotfiles

### Install
st
dwm

### symlink files
ln -s .dotfiles/zsh/.fzf.zsh ~.fzf.zsh
ln -s .dotfiles/zsh/.zsh ~.zsh
ln -s .dotfiles/tmux/.tmux.conf ~.tmux.conf'
ln -s .dotfiles/Xorg/.xinitrc
ln -s .dotfiles/Xorg/.Xresources

cd .config/nvim/
ln -s ../../.dotfiles/nvim/init.vim
ln -s ../../.dotfiles/nvim/plugin_dir/
ln -s ../../../.dotfiles/nvim/lua/init.lua
