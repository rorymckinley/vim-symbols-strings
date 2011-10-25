let s:symbolise_finder = '"\(\w\+\)"'
let s:symbolise_replace = ':\1'

let s:stringify_finder = ':\(\w\+\)'
let s:stringify_replace = '"\1"'

function! SymboliseStrings(type)
  let l:cursor_coords = getpos('.')
  call LoadContentToReplace(a:type)
  let l:paste_command = GetPasteCommand(a:type)
  let @@ = substitute(@@, s:symbolise_finder, s:symbolise_replace, 'ge')
  exec "normal! " . l:paste_command
endfunction

function! StringifySymbols(type)
  let l:cursor_coords = getpos('.')
  call LoadContentToReplace(a:type)
  let l:paste_command = GetPasteCommand(a:type)
  let @@ = substitute(@@, s:stringify_finder, s:stringify_replace, 'ge')
  exec "normal! " . l:paste_command
endfunction

function! GetBoundaries(type)
  return { 'line_begin': line("'["), 'line_end': line("']")}
endfunction

function! LoadContentToReplace(type)
  if a:type == "line"
    silent exe "normal! '[V']d"
  elseif a:type == "char"
    silent exe "normal! `[v`]c"
  endif
endfunction

function! GetPasteCommand(type)
  if a:type == "line"
    return "P"
  elseif a:type == "char"
    return "p"
  endif
endfunction

nnoremap <silent> <Leader>l :set opfunc=SymboliseStrings<CR>g@
nnoremap <silent> <Leader>g :set opfunc=StringifySymbols<CR>g@
