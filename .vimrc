" vim-tinyやvim-smallなどの場合、本設定ファイルをスキップ
if !1 | finish | endif

" 各設定ファイルを読込み
set runtimepath+=~/.vim/
runtime! conf.d/*.vim
