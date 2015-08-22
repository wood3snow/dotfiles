######################################################################
### zshenv for zsh
###
### zsh起動時などに設定ファイルが読み込まれる順番
### 1: /etc/zshenv
### 2: $ZDOTDIR/.zshenv
### 3: /etc/zprofile         もしログインシェルなら
### 4: $ZDOTDIR/.zprofile    もしログインシェルなら
### 5: /etc/zshrc            もし対話的シェルなら
### 6: $ZDOTDIR/.zshrc       もし対話的シェルなら
### 7: /etc/zlogin           もしログインシェルなら
### 8: $ZDOTDIR/.zlogin      もしログインシェルなら
###
### # ログアウト時に設定ファイルが読み込まれる順番
### 1: ~/.zlogout
### 2: /etc/zlogout
######################################################################


# ----------------------------------------------------------------------
# ZDOTDIR:
# ----------------------------------------------------------------------
# NOTE: .zshrcなどの設定ファイルの保存先変更
if [[ -z "$ZDOTDIR" ]]; then
  export ZDOTDIR=$HOME/.zsh
fi