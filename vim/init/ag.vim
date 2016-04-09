" Find current word in command mode
function! AckGrep()
  let command = "ag ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

function! AckVisual()
  normal gv"xy
  let command = "ag ".@x
  cexpr system(command)
  cw
endfunction
