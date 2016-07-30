" ------------------------------------------------------------
" dein関連:
" ------------------------------------------------------------
" バージョンが704未満の場合は無効
if v:version < 704
  finish
endif


let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'


" dein本体のインストール
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif


" runtimepathに追加
if has('vim_starting')
  if &runtimepath !~ expand(s:dein_repo_dir .",". &runtimepath)
    execute 'set runtimepath^=' . expand(s:dein_repo_dir)
  endif
endif


" 設定開始
""""if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let s:toml      = expand('~/.vim/plugins/dein.toml')
  let s:toml_lazy = expand('~/.vim/plugins/dein_lazy.toml')

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  " 設定終了
  call dein#end()
""""  call dein#save_state()
""""endif


" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif