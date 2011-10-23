let s:symbolise_finder = '"\(\w\+\)"'
let s:symbolise_replace = ':\1'

let s:stringify_finder = ':\(\w\+\)'
let s:stringify_replace = '"\1"'

function! SymboliseStrings(type)
  call LoadContentToReplace(a:type)
  echom @@
  let &paste=1
  let l:new_content = substitute(@@, s:symbolise_finder, s:symbolise_replace, 'ge')
  exec "normal! a" . l:new_content . "\<Esc>"
  let &paste=0
endfunction

function! StringifySymbols(type)
  call LoadContentToReplace(a:type)
  let &paste=1
  let l:new_content = substitute(@@, s:stringify_finder, s:stringify_replace, 'ge')
  exec "normal! a" . l:new_content . "\<Esc>"
  let &paste=0
endfunction

function! GetBoundaries(type)
  return { 'line_begin': line("'["), 'line_end': line("']")}
endfunction

function! LoadContentToReplace(type)
  if a:type == "line"
    silent exe "normal! '[V']d"
  elseif a:type == "char"
    silent exe "normal! `[v`]d"
  endif
endfunction

nnoremap <silent> <Leader>l :set opfunc=SymboliseStrings<CR>g@
nnoremap <silent> <Leader>g :set opfunc=StringifySymbols<CR>g@
