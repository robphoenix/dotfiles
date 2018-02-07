let g:focuscolour = 0

function! ToggleFocusColor()
  if (g:focuscolour)
    colorscheme nofrils-dark
    let g:focuscolour = 0
  else
    colorscheme nofrils-light
    let g:focuscolour = 1
  endif
endfunc

"Set F8 to toggle
nmap <silent> <F8> :call ToggleFocusColor()<CR>
