function! SymboliseStrings()
  .s/"\(\w\+\)"/:\1/g
endfunction

function! StringifySymbols()
  .s/:\(\w\+\)/"\1"/g
endfunction

nmap <silent> ;l :call SymboliseStrings()<CR>
nmap <silent> ;g :call StringifySymbols()<CR>
