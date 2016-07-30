" 隠しファイルをデフォルトで表示させる
"let NERDTreeShowHidden = 1


" ブックマークを最初から表示
"let g:NERDTreeShowBookmarks=1


" ブックマークファイルの保存先
let g:NERDTreeBookmarksFile = expand('~/.vim/.NERDTreeBookmarks')


" ファイル名が指定されてvimが起動した場合は、表示しない
if !argc()
    autocmd MyAutoCmd VimEnter * NERDTree|normal gg3j
endif


" キーマッピング
nnoremap <silent>    ,f    :<C-u>NERDTreeToggle<CR>





" ごみ
"let g:NERDTreeDirArrows=0
"let g:NERDTreeMouseMode=0
autocmd MyAutoCmd StdinReadPre * let s:std_in=1
"if has('vim_starting') && file_name == ''
  "autocmd MyAutoCmd VimEnter * NERDTree
  "autocmd MyAutoCmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"endif
"autocmd MyAutoCmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

