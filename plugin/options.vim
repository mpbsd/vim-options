" options.vim: options for my vimrc
" Maintainer:  @mpbsd
" Version:     0.2

" disable compatibility with Vi
set nocompatible

" how backspace works at start of line
set backspace=indent,eol,start

" when this option is set, the FileType autocommand event is triggered. All
" autocommands that match with the value of this option will be executed.
filetype plugin indent on

" syntax to be loaded for current buffer
syntax enable

" take indent for new line from previous line
set autoindent

" automatically read file when changed outside of Vim
set autoread

" 'dark' or 'light', used for highlight colors
set background=dark

" do not ring the bell for any reason
set belloff=all

" columns to highlight
set colorcolumn=80

" patterns that can start a comment line
set comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•

" template for comments; used for fold marker
set commentstring=

" specify how Insert mode completion works
set complete=.,w,b,u,t

" highlight the screen column of the cursor
set cursorcolumn

" highlight the screen line of the cursor
set cursorline

" pattern to be used to find a macro definition
set define=

" list of file names, separated by commas, that are used to lookup words for
" keyword completion commands i_CTRL-X_CTRL-K
set dict=~/.vim/spell/words.dict

" list of flags for how to display text
set display=lastline

" encoding used internally
set encoding=utf-8

" use spaces when <Tab> is inserted
set expandtab

" characters to use for displaying special items
set fillchars=vert:│,fold:·,foldsep:│

" how automatic formatting is to be done
set formatoptions=tcqj

" whether to invoke fsync() after file write
set nofsync

" don't unload buffer when it is abandoned
set hidden

" number of command-lines that are remembered
set history=10000

" highlight matches with last search pattern
set hlsearch

" ignore case in search patterns
set ignorecase

" pattern to be used to find an include file
set include=

" highlight match while typing search pattern
set incsearch

" two spaces after a period with a join command
set nojoinspaces

" don't apply langmap to mapped characters
set nolangremap

" tells when last window has status lines
set laststatus=2

" don't redraw while executing macros
set lazyredraw

" characters for displaying in list mode
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" changes special characters in search patterns
set magic

" enable the use of mouse clicks
set mouse=nvi

" changes meaning of mouse buttons
set mousemodel=popup_setpos

" number formats recognized for CTRL-A command
set nrformats=bin,hex

" print the line number in front of each line
set number

" number of columns used for the line number
set numberwidth=6

" list of directories searched with 'gf' et.al.
set path=.,,

" show relative line number in front of each line
set relativenumber

" minimum nr. of lines above and below cursor
set scrolloff=1

" secure mode for reading vimrc in current dir
set secure

" options for :mksession
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal

" number of spaces to use for (auto)indent step
set shiftwidth=2

" list of flags, reduce length of messages
set shortmess=ltToOCF

" show (partial) command in the last line of the screen
set showcmd

" if in insert, replace or visual mode, put a message on the last line
set noshowmode

" minimum number of columns to scroll horizontally
set sidescroll=1

" minimum number of columns to the left and right sides of the cursor
set sidescrolloff=2

" override the 'ignorecase' option if the search pattern contains upper case
" characters. Only used when the search pattern is typed and 'ignorecase'
" option is on.
set smartcase

" Do smart autoindenting when starting a new line.
set smartindent

" use shiftwidth when inserting <Tab>
set smarttab

" languages to do spell checking for
set spelllang=en_us,pt_br,de_de

" methods used to suggest spelling corrections
set spellsuggest=fast,15

" new window from split is below the current one
set splitbelow

" new window is put right of the current one
set splitright

" commands move cursor to first non-blank in line
set nostartofline

" sets behavior when switching to another buffer
set switchbuf=uselast

" number of colors
set t_Co=256

" maximum number of tab pages for -p and 'tab all'
set tabpagemax=50

" number of spaces that <Tab> in file counts for
set tabstop=2

" list of file names used by the tag command
set tags=./tags;,tags

" maximum width of text that is being inserted
set textwidth=80

" time out on mappings and key codes
set timeout

" time out on mappings
set ttimeout

" time out time for key codes in milliseconds
set ttimeoutlen=50

" indicates a fast terminal connection
set ttyfast

" save undo information in a file
set undofile

" specifies what to save for :mkview
set viewoptions=folds,cursor,curdir

" use viminfofile upon startup and exiting
set viminfo=!,'100,<50,s10,h

" use menu for command line completion
set wildmenu

" specifies how command line completion is done
set wildoptions=pum,tagfile

" use ":DiffOrig" to see the differences between the current buffer and the file
" it was loaded from.
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis

" read Ex commands from {file} in each directory given by runtimepath and/or
" packpath.
runtime macros/matchit.vim
runtime ftplugin/man.vim

function! s:VimChooseAColorschemeForMe(variant) abort
  let l:options = {
        \  'dark': [
        \    'habamax',
        \    'lunaperche',
        \    'slate',
        \  ],
        \  'light': [
        \    'morning',
        \    'shine',
        \    'zellner',
        \  ],
        \}
  if has_key(l:options, a:variant)
    let l:choice = rand(srand()) % len(l:options[a:variant])
    execute printf("set background=%s", a:variant)
    execute printf("colorscheme %s", l:options[a:variant][l:choice])
  else
    set background=dark
    colorscheme habamax
  endif
endfunction

call s:VimChooseAColorschemeForMe('dark')

if has("gui_running")
  set guioptions-=T
  set guioptions-=b
  set guioptions+=d
  set guioptions-=l
  set guioptions-=m
  set guioptions-=r
  set guifont=Hack\ Nerd\ Font\ Mono\ 14
  set guiheadroom=0
endif
