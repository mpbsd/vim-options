" options.vim: options for my vimrc
" Maintainer:  @mpbsd
" Version:     0.2

set nocompatible
set backspace=indent,eol,start

filetype plugin indent on
syntax enable

set autoindent
set autoread
set cursorcolumn
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set magic
set nofsync
set nojoinspaces
set nolangremap
set nostartofline
set number
set relativenumber
set ruler
set secure
set showcmd
set showmode
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set ttyfast
set undofile
set wildmenu

set background=dark
set belloff=all
set colorcolumn=80
set comments=fb:-,fb:*,n:>
set commentstring=
set complete=.,w,b,u,t
set define=
set dict=~/.vim/spell/words.dict
set display=lastline
set encoding=utf-8
set fillchars=vert:\|,fold:.,foldsep:\|
set formatoptions=tcqj
set history=10000
set include=''
set laststatus=2
set listchars=tab:<->,trail:-,nbsp:+
set mouse=nvi
set mousemodel=popup_setpos
set nrformats=bin,hex
set numberwidth=6
set path=.,,
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set shiftwidth=2
set shortmess=ltTotOCF
set sidescroll=1
set spelllang=en_us,pt_br,de_de
set spellsuggest=fast,15
set switchbuf=uselast
set t_Co=256
set tabpagemax=50
set tabstop=2
set tags=./tags;,tags
set ttimeout
set ttimeoutlen=50
set viewoptions=folds,cursor,curdir,unix,slash
set viminfo=!,'100,<50,s10,h
set wildoptions=pum,tagfile

function! s:VimChooseColorschemeForMe() abort
  let l:options = [
        \  'habamax',
        \  'lunaperche',
        \  'murphy',
        \  'pablo',
        \  'slate',
        \]
  let l:choice = rand(srand()) % len(l:options)
  execute printf("colorscheme %s", l:options[l:choice])
endfunction

call s:VimChooseColorschemeForMe()

if has("gui_running")
  set guioptions-=T
  set guioptions-=b
  set guioptions+=d
  set guioptions-=l
  set guioptions-=m
  set guioptions-=r
  set guifont='Hack\ Nerd\ Font\ Mono\ 14'
  set guiheadroom=0
endif

runtime macros/matchit.vim
runtime ftplugin/man.vim
