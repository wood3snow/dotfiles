" ------------------------------------------------------------
" 初期化関連(変数や関数の定義など):
" ------------------------------------------------------------
" vi互換モードにしない
if &compatible
  set nocompatible
endif


" Platformをチェックするための関数を定義
let s:is_unix = has('unix') && !has('win32unix')
let s:is_mac = has('mac') || has('macunix') || has('gui_macvim') || (!executable('xdg-open') && system('uname') =~? '^darwin')
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')

function! IsUnix()
  return s:is_unix
endfunction

function! IsMac()
  return s:is_mac
endfunction

function! IsWindows()
  return s:is_windows
endfunction

function! IsCygwin()
  return s:is_cygwin
endfunction


" autocmdの初期化
augroup MyAutoCmd
""  autocmd!
augroup END


" ------------------------------------------------------------
" その他関連:
" ------------------------------------------------------------
" Windowsの場合でもファイル名の展開にスラッシュを使用
if IsWindows()
  set shellslash
endif