" options.vim: options for my vimrc
" Maintainer:  @mpbsd
" Version:     0.2

" s:categories {{{
let s:categories = {
      \  'booleans': {
      \    'autoindent': v:true,
      \    'autoread': v:true,
      \    'compatible': v:false,
      \    'cursorcolumn': v:true,
      \    'cursorline': v:true,
      \    'expandtab': v:true,
      \    'fsync': v:false,
      \    'hidden': v:true,
      \    'hlsearch': v:true,
      \    'ignorecase': v:true,
      \    'incsearch': v:true,
      \    'joinspaces': v:false,
      \    'langremap': v:false,
      \    'lazyredraw': v:true,
      \    'magic': v:true,
      \    'number': v:true,
      \    'relativenumber': v:true,
      \    'ruler': v:true,
      \    'secure': v:true,
      \    'showcmd': v:true,
      \    'showmode': v:true,
      \    'smartcase': v:true,
      \    'smartindent': v:true,
      \    'smarttab': v:true,
      \    'splitbelow': v:true,
      \    'splitright': v:true,
      \    'startofline': v:false,
      \    'ttyfast': v:true,
      \    'undofile': v:true,
      \    'wildmenu': v:true,
      \  },
      \  'values': {
      \    'background': 'dark',
      \    'backspace': 'indent,eol,start',
      \    'belloff': 'all',
      \    'colorcolumn': 80,
      \    'comments': 'fb:-,fb:*,n:>',
      \    'commentstring': '',
      \    'complete': '.,w,b,u,t',
      \    'define': '',
      \    'dict': '~/.vim/spell/words.dict',
      \    'display': 'lastline',
      \    'encoding': 'utf-8',
      \    'filetype': 'on',
      \    'fillchars': 'vert:\|,fold:.,foldsep:\|',
      \    'formatoptions': 'tcqj',
      \    'history': 10000,
      \    'include': '',
      \    'laststatus': 2,
      \    'listchars': 'tab:<->,trail:-,nbsp:+',
      \    'mouse': 'nvi',
      \    'mousemodel': 'popup_setpos',
      \    'nrformats': 'bin,hex',
      \    'numberwidth': 6,
      \    'path': '.,,',
      \    'sessionoptions': join(
      \      [
      \        'blank',
      \        'buffers',
      \        'curdir',
      \        'folds',
      \        'help',
      \        'tabpages',
      \        'winsize',
      \        'terminal'
      \      ], ','),
      \    'shiftwidth': 2,
      \    'shortmess': 'ltTotOCF',
      \    'sidescroll': 1,
      \    'spelllang': 'en_us,pt_br,de_de',
      \    'spellsuggest': 'fast,15',
      \    'switchbuf': 'uselast',
      \    'syntax': 'on',
      \    't_Co': 256,
      \    'tabpagemax': 50,
      \    'tabstop': 2,
      \    'tags': './tags;,tags',
      \    'ttimeoutlen': 50,
      \    'viewoptions': 'folds,cursor,curdir,unix,slash',
      \    'viminfo': "\\\!,'100,<50,s10,h",
      \    'wildoptions': 'pum,tagfile',
      \  },
      \  'colorschemes': [
      \    'habamax',
      \    'lunaperche',
      \    'pablo',
      \    'slate',
      \  ],
      \  'guioptions': {
      \    'flags': {
      \      'T': '-',
      \      'b': '-',
      \      'd': '+',
      \      'l': '-',
      \      'm': '-',
      \      'r': '-',
      \    },
      \    'options': {
      \      'guifont': 'Hack\ Nerd\ Font\ Mono\ 14',
      \      'guiheadroom': 0,
      \    },
      \  },
      \}
" }}}

function! s:VimSetOptionsFromCategory(ctg_name, ctg_opts) abort
  if a:ctg_name ==# 'booleans'
    for [lhs, rhs] in items(a:ctg_opts)
      execute printf("set %s", (rhs == v:true) ? lhs : ('no' . lhs))
    endfor
  elseif a:ctg_name ==# 'values'
    for [lhs, rhs] in items(a:ctg_opts)
      execute printf("set %s=%s", lhs, rhs)
    endfor
  elseif a:ctg_name ==# 'colorschemes'
    let l:choice = rand(srand()) % len(a:ctg_opts)
    execute printf("colorscheme %s", a:ctg_opts[l:choice])
  elseif a:ctg_name ==# 'guioptions'
    if has("gui_running")
      for [lhs, rhs] in items(a:ctg_opts['flags'])
        execute printf("set guioptions %s=%s", rhs, lhs)
      endfor
      for [lhs, rhs] in items(a:ctg_opts['options'])
        execute printf("set %s=%s", lhs, rhs)
      endfor
    endif
  endif
endfunction

function! s:VimSetOptionsFromAllCategories(categories) abort
  for [ctg_name, ctg_opts] in items(a:categories)
    call s:VimSetOptionsFromCategory(ctg_name, ctg_opts)
  endfor
endfunction

call s:VimSetOptionsFromAllCategories(s:categories)
