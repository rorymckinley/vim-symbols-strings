function! SymboliseStrings(beg,end)
  exec a:beg.','.a:end.'s/"\(\w\+\)"/:\1/g'
endfunction

function! StringifySymbols(beg,end)
  exec a:beg.','.a:end.'s/:\(\w\+\)/"\1"/g'
endfunction

function! ToggleStringsSymbols(type, ...)
  let beg = line("'[")
  let end = line("']")
  call  SymboliseStrings(beg,end)
endfunction

nnoremap <silent> <Leader>l :set opfunc=ToggleStringsSymbols<CR>g@
