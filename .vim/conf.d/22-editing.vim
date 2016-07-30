" ------------------------------------------------------------
" 編集関連:
" ------------------------------------------------------------
" タブ文字をスペース文字に変更
set expandtab


" 画面上の見た目のタブのスペース文字数
set tabstop=2


" 実際に挿入されるタブのスペース文字数
" NOTE: 0: tabstopと同じ値になる
set softtabstop=0


" オートインデントによって挿入されるインデント幅
set shiftwidth=2


" 改行時のインデントをそろえる
"set autoindent


" 高度なインデントを行う
set smartindent


" insertモード時に、backspaceキーでどこでも削除可能にする
set backspace=start,eol,indent


" モードラインを有効
set modeline


" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus


" 対応するカッコを強調表示
set showmatch


" <>もカッコと同様に強調表示
set matchpairs+=<:>


" バッファが保存されていない場合でも、他のバッファを表示可能にする
set hidden


" CTRL-aとCTRL-x使用時の数の増減で、8進数を使用しない
set nrformats=hex
