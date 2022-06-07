"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" plugins
call plug#begin('~/.config/nvim/plugin_dir')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'tanvirtin/monokai.nvim'
"Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()


" set colorscheme before initializing LSP
let g:gruvbox_contrast_dark="hard"
set termguicolors           " needed for 24-bit colorschemes
colorscheme monokai         " colorscheme (nord | gruvbox | monokai)
syntax on
set t_ut=					" correct color for tmux

" clipboard
set clipboard+=unnamedplus

" nvim tree g: commands must be before setup is called in init.lua
highlight NvimTreeFolderName guifg=normal
highlight NvimTreeOpenedFolderName guifg=normal
highlight NvimTreeEmptyFolderName guifg=normal
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = {
            \ 'git': 1,
            \ 'folders': 1,
            \ 'files': 1,
            \ 'folder_arrows': 1
            \ }  

let g:nvim_tree_icons = {
        \ 'git': {
            \ 'untracked': "",
            \ 'unstaged': "",
            \ 'staged': "﫟",
            \ 'unmerged': "",
            \ 'renamed': "凜",
            \ 'deleted': "ﮁ",
            \ 'ignored': ""
            \ }
        \ }

" source luafile
luafile ~/.config/nvim/lua/init.lua

" neovim tree
nnoremap <C-n> :NvimTreeToggle<CR>

" disable svelte indenting on <script> and <style> tags
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0

" general config 
set history=1000			" store :cmdline history
set number					" line numbers
set relativenumber			" relative line numbers

set splitright              " always split to the right

set shiftwidth=4			" when indenting with '->', use 4 spaces width
set tabstop=4				" Set tab to 4 spaces
set softtabstop=4
set expandtab				" use spaces instead of tabs
set smarttab
set hlsearch                " highlight all search matches

" Visual Settings
set cursorline              " highlight current line
set scrolloff=3             " start scrolling 3 lines before edge of viewport
set sidescrolloff=3         " same as scrolloff but for columns

" Status Line
set laststatus=2            " always show status line

set stl=%n\:%F%r%m\ %y%=%-10(%l\/%L%)%c%V

" Command Line Settings
if has('showcmd')           " don't show extra info at end of command line
    set noshowcmd
endif

" Normal Mappings
nnoremap Y y$

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap K <nop>	

map <silent> <Up>       <C-W>+
map <silent> <Down>     <C-W>-
map <silent> <Left>     <C-w><
map <silent> <Right>    <C-w>>

" shift line up/down line using ALT
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

"============================= Visual Mappings ================================
" move between windows
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l

" shift selected block up/down line using ALT
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"============================ Command Mappings ================================
" move to begenning or end of command line
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" '<tab>' / '<S-tab>' to move between matches without leaving incremental search.

"============================ Leader Mappings =================================
let mapleader = " "			" set leader to <space>

" open fzf fuzzy file search in vim
" use window to prevent auto-shifting file lines up
nnoremap <silent> <C-p> :call fzf#run(fzf#wrap())<CR>
" =============================================================================
" fzf fuzzy search
" =============================================================================
" default fzf key bindings for use in vim
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let g:fzf_preview_window = []

" set fzf colors to match the color scheme
let g:fzf_colors =
\ { 'fg':       ['fg', 'Normal'],
  \ 'bg':       ['bg', 'Normal'],
  \ 'hl':       ['fg', 'Comment'],
  \ 'fg+':      ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':      ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':      ['fg', 'Statement'],
  \ 'info':     ['fg', 'PreProc'],
  \ 'border':   ['fg', 'Ignore'],
  \ 'prompt':   ['fg', 'Conditional'],
  \ 'pointer':  ['fg', 'Exception'],
  \ 'marker':   ['fg', 'Keyword'],
  \ 'spinner':  ['fg', 'Label'],
  \ 'header':   ['fg', 'Comment'] }
