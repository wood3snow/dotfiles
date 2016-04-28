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
  if [ ! -e $HOME/$file ]; then
    ls -s $HOME/{DOTS_DIR}/${file} $HOME/${file}
    echo "シンボリックリンクを貼りました: $HOME/${file}"
  fi
done


# gitの設定(unix共通設置)
file='.gitconfig_os'
if [ ! -e $HOME/${file} ]; then
  ln -s $HOME/${DOTS_DIR}/${file}_${UNIX} $HOME/${file}
  echo "シンボリックリンクを貼りました: $HOME/${file}"
fi


# Create ~/.lesshst
[ ! -f ~/.lesshst ] && touch ~/.lesshst && echo "~/.lesshst を作成しました"

# Install neobundle for vim
###[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"
