" ------------------------------------------------------------
" マウス関連:
" ------------------------------------------------------------
" マウスが可能ならば利用する
if has('mouse')
  set mouse=a
  if has('mouse_sgr') || v:version > 703 || v:version == 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif


"  " 右クリックでペースト
"  nnoremap <RightMouse> "+p
"  xnoremap <RightMouse> "+p
"  inoremap <RightMouse> <C-r><C-o>+
"  cnoremap <RightMouse> <C-r>+
endif