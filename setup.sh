#!/bin/sh

####################
##### 環境変数 #####
# ドットファイルの保存場所
DOTS_DIR='dotfiles'
####################


##### OSの判定
if [ "$(uname)" == 'Darwin' ]; then
  OS='mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

UNIX='unix'


##### ドットファイルの取得
if [ ! -d $HOME/${DOTS_DIR} ]; then
  cd $HOME
  git clone git@github.com:wood3snow/dotfiles.git ${DOTS_DIR}
fi


##### シンボリックリンクの作成
DOT_FILES=(
  .gemrc
  .gitconfig
  .gitignore_global
  .lesshst
  .minttyrc
  .tmux.conf
  .vim
  .vimrc
  .zsh
  .zshenv
)

for file in ${DOT_FILES[@]}
do
  if [ ! -e $HOME/${file} ]; then
    ln -s $HOME/${DOTS_DIR}/${file} $HOME/${file}
    echo "シンボリックリンクを貼りました: $HOME/${file}"
  fi
done


##### シンボリックリンクの作成(unix共通設定)
DOT_FILES=(
  .gitconfig_os
)
for file in ${DOT_FILES[@]}
do
  if [ ! -e $HOME/${file} ]; then
    ln -s $HOME/${DOTS_DIR}/${file}_${UNIX} $HOME/${file}
    echo "シンボリックリンクを貼りました: $HOME/${file}"
  fi
done


##### シンボリックリンクの作成(OSごとの設定)
DOT_FILES=(
#  .xxxx_os
)
for file in ${DOT_FILES[@]}
do
  if [ ! -e $HOME/${file} ]; then
    ln -s $HOME/${DOTS_DIR}/${file}_${OS} $HOME/${file}
    echo "シンボリックリンクを貼りました: $HOME/${file}"
  fi
done


# ~/.lesshst の作成
[ ! -f $HOME/.lesshst ] && touch $HOME/.lesshst && echo "$HOME/.lesshst を作成しました"
