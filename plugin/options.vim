" options.vim: options for my vimrc
" Maintainer:  @mpbsd
" Version:     0.1

" s:options {{{
let s:options = {
      \  'boolean': {
      \    'number': v:true,
      \    'relativenumber': v:true,
      \    'cursorline': v:true,
      \    'cursorcolumn': v:true,
      \    'expandtab': v:true,
      \    'autoindent': v:true,
      \    'smartindent': v:true,
      \    'linebreak': v:true,
      \    'nojoinspaces': v:true,
      \    'splitright': v:true,
      \    'splitbelow': v:true,
      \    'magic': v:true,
      \    'ignorecase': v:true,
      \    'smartcase': v:true,
      \    'hidden': v:true,
      \    'undofile': v:true,
      \    'lazyredraw': v:true,
      \    'secure': v:true,
      \    'noshowmode': v:true,
      \    'list': v:true,
      \    'modeline': v:true,
      \  },
      \  'guioptions': {
      \    'flags': [
      \      'T': '-',
      \      'b': '-',
      \      'd': '+',
      \      'l': '-',
      \      'm': '-',
      \      'r': '-',
      \    ],
      \    'options': [
      \      'guifont': "Hack\\ Nerd\\ Font\\ Mono\\ 14",
      \      'guiheadroom': 0,
      \    ],
      \  },
      \  'term': {
      \    't_Co': 256,
      \    'background': 'dark',
      \    'colorcolumn': 80,
      \    'encoding': 'utf-8',
      \    'fillchars': 'vert:\|,fold:.,foldsep:\|',
      \    'listchars': 'trail:.,tab:<->,extends:>,precedes:<,nbsp:-',
      \    'numberwidth': 6,
      \    'tabstop': 2,
      \    'shiftwidth': 2,
      \    'spelllang': 'en_us,pt_br,de_de',
      \    'spellsuggest': 'fast,15',
      \    'dict': '~/.vim/spell/words.dict',
      \  },
      \}
" }}}

function VimSetAnOption(ctg, lhs, rhs) abort
  if a:ctg ==# 'boolean'
    execute printf("set %s", (a:rhs == v:true) ? a:lhs : ('no' . a:lhs))
  elseif a:ctg ==# 'guioptions'
    if has("gui_running")
      for flag in s:options[a:ctg]['flags']
        execute printf("set guioptions %s=%s", a:rhs, a:lhs)
      endfor
      for opt in s:options[a:ctg]['options']
        execute printf("set %s = %s", a:lhs, a:rhs)
      endfor
    endif
  else
    execute printf("set %s=%s", a:lhs, a:rhs)
  endif
endfunction

function VimSetOptions(options) abort
  for ctg in keys(a:options)
    for [lhs, rhs] in items(a:options[ctg])
      call VimSetAnOption(ctg, lhs, rhs)
    endfor
  endfor
endfunction

function VimSetColorscheme() abort
  let l:colorscheme = [
        \  'habamax',
        \  'lunaperche',
        \  'slate',
        \]
  let l:choice = rand(srand()) % len(l:colorscheme)
  execute printf("colorscheme %s", l:colorscheme[l:choice])
endfunction

call VimSetOptions(s:options)
call VimSetColorscheme()

" vim: set fileencoding=utf-8: "
