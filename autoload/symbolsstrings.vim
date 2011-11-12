let s:symbolise_finder = '[''"]\(\w\+\)[''"]'
let s:symbolise_replace = ':\1'

let s:stringify_finder = ':\(\w\+\)'
let s:stringify_replace = '"\1"'

function! symbolsstrings#SymboliseStrings(type)
  call s:MemoriseStart()

  call s:LoadContentToReplace(a:type)
  let l:paste_command = s:GetPasteCommand(a:type)
  let @@ = substitute(@@, s:symbolise_finder, s:symbolise_replace, 'ge')

  exec "normal! " . l:paste_command
  call s:ReturnToStart()
endfunction

function! symbolsstrings#StringifySymbols(type)
  call s:MemoriseStart()

  call s:LoadContentToReplace(a:type)
  let l:paste_command = s:GetPasteCommand(a:type)
  let @@ = substitute(@@, s:stringify_finder, s:stringify_replace, 'ge')

  exec "normal! " . l:paste_command
  call s:ReturnToStart()
endfunction

function! symbolsstrings#SymboliseStringsThisLine()
  .s/['"]\(\w\+\)['"]/:\1/g
endfunction

function! symbolsstrings#StringifySymbolsThisLine()
  .s/:\(\w\+\)/"\1"/g
endfunction

function! s:LoadContentToReplace(type)
  if a:type == "line"
    silent exe "normal! '[V']d"
  elseif a:type == "char"
    silent exe "normal! `[v`]c"
  endif
endfunction

function! s:GetPasteCommand(type)
  if a:type == "line"
    return "P"
  elseif a:type == "char"
    return "p"
  endif
endfunction

function! s:MemoriseStart()
  let s:cursor_coords = getpos('.')
  let s:contents_of_register = @@
endfunction

function! s:ReturnToStart()
  let @@ = s:contents_of_register
  let l:results = setpos('.', s:cursor_coords)
endfunction


