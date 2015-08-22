" ------------------------------------------------------------
" 初期化関連(変数や関数の定義など):
" ------------------------------------------------------------
" vim-tinyやvim-smallなどの場合、本設定ファイルをスキップ
if !1 | finish | endif


" vi互換モードにしない
set nocompatible


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


" Windowsの場合でもファイル名の展開にスラッシュを使用
if IsWindows()
  set shellslash
endif


" autocmdの初期化
augroup MyAutoCmd
  autocmd!
augroup END


" ------------------------------------------------------------
" 各vimrcファイルの読込み:
" ------------------------------------------------------------
" neobundle設定
if filereadable(expand('~/.vim/conf.d/.vimrc.neobundle'))
  source ~/.vim/conf.d/.vimrc.neobundle
endif


" 基本設定
if filereadable(expand('~/.vim/conf.d/.vimrc.basic'))
  source ~/.vim/conf.d/.vimrc.basic
endif





" ローカル＆テスト用の設定
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
