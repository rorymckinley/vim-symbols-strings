if !exists('g:symbolise_strings_map_keys')
  let g:symbolise_strings_map_keys = 1
endif
if g:symbolise_strings_map_keys
  nnoremap <silent> <Leader>l :set opfunc=symbolsstrings#SymboliseStrings<CR>g@
  nnoremap <silent> <Leader>g :set opfunc=symbolsstrings#StringifySymbols<CR>g@
  nnoremap <silent> <Leader>gg :call symbolsstrings#StringifySymbolsThisLine()<CR>
  nnoremap <silent> <Leader>ll :call symbolsstrings#SymboliseStringsThisLine()<CR>
endif
