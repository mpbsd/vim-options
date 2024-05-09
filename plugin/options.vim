" options.vim: options for my vimrc
" Maintainer:  @mpbsd
" Version:     0.1

" s:categories {{{
let s:categories = {
      \  'booleans': {
      \    'autoindent': v:true,
      \    'cursorcolumn': v:true,
      \    'cursorline': v:true,
      \    'expandtab': v:true,
      \    'hidden': v:true,
      \    'ignorecase': v:true,
      \    'lazyredraw': v:true,
      \    'magic': v:true,
      \    'modeline': v:true,
      \    'nojoinspaces': v:false,
      \    'showmode': v:true,
      \    'number': v:true,
      \    'relativenumber': v:true,
      \    'secure': v:true,
      \    'smartcase': v:true,
      \    'smartindent': v:true,
      \    'splitbelow': v:true,
      \    'splitright': v:true,
      \    'undofile': v:true,
      \  },
      \  'values': {
      \    'background': 'dark',
      \    'colorcolumn': 80,
      \    'dict': '~/.vim/spell/words.dict',
      \    'encoding': 'utf-8',
      \    'fillchars': 'vert:\|,fold:.,foldsep:\|',
      \    'numberwidth': 6,
      \    'shiftwidth': 2,
      \    'spelllang': 'en_us,pt_br,de_de',
      \    'spellsuggest': 'fast,15',
      \    't_Co': 256,
      \    'tabstop': 2,
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

function VimSetOptionsFromCategory(ctg_name, ctg_objs) abort
  if a:ctg_name ==# 'booleans'
    for [lhs, rhs] in items(a:ctg_objs)
      execute printf("set %s", (rhs == v:true) ? lhs : ('no' . lhs))
    endfor
  elseif a:ctg_name ==# 'values'
    for [lhs, rhs] in items(a:ctg_objs)
      execute printf("set %s=%s", lhs, rhs)
    endfor
  elseif a:ctg_name ==# 'colorschemes'
    let l:choice = rand(srand()) % len(a:ctg_objs)
    execute printf("colorscheme %s", a:ctg_objs[l:choice])
  elseif a:ctg_name ==# 'guioptions'
    if has("gui_running")
      for [lhs, rhs] in items(a:ctg_objs['flags'])
        execute printf("set guioptions %s=%s", rhs, lhs)
      endfor
      for [lhs, rhs] in items(a:ctg_objs['options'])
        execute printf("set %s=%s", lhs, rhs)
      endfor
    endif
  endif
endfunction

function VimSetOptionsFromAllCategories(categories) abort
  for [ctg_name, ctg_objs] in items(a:categories)
    call VimSetOptionsFromCategory(ctg_name, ctg_objs)
  endfor
endfunction

call VimSetOptionsFromAllCategories(s:categories)

" vim: set fileencoding=utf-8: "
