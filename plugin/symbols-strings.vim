function! SymboliseStrings(type)
  let boundaries = GetBoundaries(a:type)
  silent exec boundaries['line_begin'].','.boundaries['line_end'].'s/"\(\w\+\)"/:\1/g'
endfunction

function! StringifySymbols(type)
  let boundaries = GetBoundaries(a:type)
  silent exec boundaries['line_begin'].','.boundaries['line_end'].'s/:\(\w\+\)/"\1"/g'
endfunction

function! GetBoundaries(type)
  return { 'line_begin': line("'["), 'line_end': line("']")}
endfunction

nnoremap <silent> <Leader>l :set opfunc=SymboliseStrings<CR>g@
nnoremap <silent> <Leader>g :set opfunc=StringifySymbols<CR>g@
