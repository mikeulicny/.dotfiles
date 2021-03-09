# .dotfiles


### symlink files
ln -s .dotfiles/zsh/.fzf.zsh ~.fzf.zsh
ln -s .dotfiles/zsh/.zsh ~.zsh
ln -s .dotfiles/tmux/.tmux.conf ~.tmux.conf'

cd config/nvim/
ln -s ../../.dotfiles/nvim/init.vim
ln -s ../../.dotfiles/nvim/plugin_dir/