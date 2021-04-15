"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" plugins
call plug#begin('~/.config/nvim/plugin_dir')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
" Plug 'jiangmiao/auto-pairs'

call plug#end()

luafile ~/.config/nvim/lua/init.lua

let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#handler_enabled = 1

" general config 
" autocomplete
set completeopt-=preview
set history=1000			" store :cmdline history
set number					" line numbers
set relativenumber			" relative line numbers

set splitbelow              " always split below
set splitright              " always split to the right

set shiftwidth=4			" when indenting with '->', use 4 spaces width
set tabstop=4				" Set tab to 4 spaces
set softtabstop=4
set expandtab				" use spaces instead of tabs
set smarttab
set hlsearch                " highlight all search matches

" Visual Settings
if has('termguicolors')
	" required inside tmux
	if &term =~# 'tmux-256color'
		let &t_8f="\e[38;2;%ld;%ld;%ldm"
		let &t_8b="\e[48;2;%ld;%ld;%ldm"
	endif
endif

colorscheme gruvbox			" colorscheme
set t_ut=					" correct color for tmux
set background=dark
syntax on				    " syntax highlighting
set cursorline              " highlight current line
set scrolloff=3             " start scrolling 3 lines before edge of viewport
set sidescrolloff=3         " same as scrolloff but for columns
"set colorcolumn=80          " show 80th column

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

" shift line up/down line 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

"============================= Visual Mappings ================================
" move between windows
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l

" shift selected block up/down line
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
nnoremap <silent> <leader>t :call fzf#run(fzf#wrap({'window': {'width': 1, 'height': 0.4, 'yoffset': 1}}))<CR>
" =============================================================================
" fzf fuzzy search
" =============================================================================
" default fzf key bindings for use in vim
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" fzf layout in neovim
"let g:fzf_layout = { 'down': '~40%' }

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
