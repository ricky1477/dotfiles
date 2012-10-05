" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable syntax highlighting
syntax on
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set smartindent
set autoindent
" Highlight searches
set hlsearch
highlight Search ctermbg=black ctermfg=yellow term=underline
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

if version > 703
  set number
endif

if version >= 703
  " Vundle Packages
  filetype off
  filetype plugin indent on
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  
  " let Vundle manage Vundle
  Bundle 'gmarik/vundle'
  
  " Numbers.vim
  Bundle "myusuf3/numbers.vim"
  highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
  nmap <C-N><C-N> :set invnumber<CR>
  
  " Command-T
  Bundle 'Command-T'
  
  " Surround
  Bundle 'surround.vim'
  
  " Syntastic: For js make sure you have jshint installed
  Bundle 'Syntastic'
  
  " SnipMate
  Bundle "honza/snipmate-snippets"
  Bundle "garbas/vim-snipmate"
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  " order matters, snippets_dir before filetype
  let g:snippets_dir = "~/.vim/bundle/snipmate-snippets/snippets/"
  highlight Pmenu ctermbg=238 gui=bold
  highlight PmenuSel ctermbg=yellow ctermfg=black
  filetype plugin on
  
  " Lokaltog/vim-powerline
  Bundle 'Lokaltog/vim-powerline'
  let g:Powerline_symbols = 'fancy'
  set laststatus=2
  
  " Brief help
  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  "
  " see :h vundle for more details or wiki for FAQ
  " NOTE: comments after Bundle command are not allowed..
endif
 noremap  <Up> ""
 noremap! <Up> <Esc>
 noremap  <Down> ""
 noremap! <Down> <Esc>
 noremap  <Left> ""
 noremap! <Left> <Esc>
 noremap  <Right> ""
 noremap! <Right> <Esc>

set number
