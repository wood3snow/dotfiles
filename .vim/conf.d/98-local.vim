" ------------------------------------------------------------
" ホストごとの設定関連:
" ------------------------------------------------------------
" ローカル及びホストごとのテスト用の設定
if filereadable(expand('~/.vimrc.local'))
  source expand('~/.vimrc.local')
endif