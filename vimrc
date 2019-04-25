" Delete potential autocommands, that are active
"autocmd! 

"neovim specific settings"
if has('nvim')
    	":set termguicolors
	:set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
	au VimLeave * set guicursor=a:block-blinkon0
endif

" Settings for gvim can also be placed in the vimrc file using a has('gui_running') check

set nocompatible
set selectmode=mouse
set tabstop=8

" I want an intend of eight characters
set shiftwidth=8
set shiftround
set autoindent 

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" Increase command history size
set history=4000

" Commandline Completion with <Tab>
set wildmode=list:longest,full

" Show context around cursor
set scrolloff=10

" show usefull line numbers with distance for dd, yy, ...
set nu 
set relativenumber
" relativenumber = instead of showing you what line in the file a given line
" is at, it shows you how far from the current line a given line is at.  
" What i did here is set both of the options to be true which gives us what 
" Vim calls hybrid line numbers.  This shows the current line’s line number
" and the relative number for the rest.
" Source: https://hackr.pl/2017/01/11/some-of-my-favorite-vimrc-edits/

" keep the current line in the vertical center of the editor.
set so=999
" Source: https://hackr.pl/2017/01/11/some-of-my-favorite-vimrc-edits/

set colorcolumn=80

if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "set bomb
    set termencoding=utf-8
    set fileencodings=utf-8
else
  echoerr "Vim not compiled with multi-byte support!"
endif 

" disallow backspacing over everything in insert mode
set backspace=2
set autoindent		" always set autoindenting on

" Active file type recognition
filetype on
filetype indent on
filetype plugin on 
filetype plugin indent on    " enable loading indent file for filetype

" incremential search
set incsearch

" make search case insensitive unless it includes upper case letters
set ignorecase
set smartcase 

set bdir=$HOME/tmp
set dir=$HOME/tmp
set backupdir=$HOME/tmp
set nobackup
" https://dejavu-fonts.github.io/
set guifont=DejaVu\ Sans\ Mono\ 12

set diffopt=horizontal

set spelllang=de_de,en_us

"------------------------------------------------------------------------------
" http://vim.wikia.com/wiki/Reverse_letters
" Simply enable visual mode (v), highlight the characters you want inverted, and hit \is. 
vnoremap <silent> <Leader>is :<C-U>let old_reg_a=@a<CR>
 \:let old_reg=@"<CR>
 \gv"ay
 \:let @a=substitute(@a, '.\(.*\)\@=',
 \ '\=@a[strlen(submatch(1))]', 'g')<CR>
 \gvc<C-R>a<Esc>
 \:let @a=old_reg_a<CR>
 \:let @"=old_reg<CR>

" https://github.com/junegunn/fzf
" If installed using git
set rtp+=~/.fzf

" vim-plug
" https://github.com/junegunn/vim-plug
" :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'benekastah/neomake'
endif
Plug 'altercation/vim-colors-solarized'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'udalov/kotlin-vim'
" Initialize plugin system
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
" java shorthands
abbr sout System.out.println();<Left><Left>i

" habit breaking
" via https://github.com/wondratsch/linux_home/blob/master/.vimrc
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" colour scheme
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
colorscheme solarized

"https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

