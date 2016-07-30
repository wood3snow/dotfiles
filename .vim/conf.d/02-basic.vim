" ------------------------------------------------------------
" ファイル関連:
" ------------------------------------------------------------
" backupファイルを作成しない
set nobackup


" swapファイルを作成しない
" NOTE: 保存する場合のディレクトリ指定: set directory=/tmp
set noswapfile


" viminfoファイルの保存先
set viminfo+=n~/.vim/.viminfo


" .un~ファイルを作成しない
set noundofile


" クリップボードを有効にする
if has('clipboard')
  set clipboard=unnamed,unnamedplus
endif