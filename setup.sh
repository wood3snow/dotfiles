#!/bin/sh

DOT_FILES=(
  .gemrc
  .gitconfig
  .gitignore_global
  .lesshst
  .minttyrc
  .vim
  .vimrc
  .zsh
  .zshenv
)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    if [ -L $HOME/$file ]; then
      echo "既にシンボリックリンクが存在します: $file"
    elif [ -d $HOME/$file ]; then
      echo "既にディレクトリが存在します: $file"
    else
      echo "既にファイルが存在します: $file"
    fi
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done

# Create ~/.lesshst
[ ! -f ~/.lesshst ] && touch ~/.lesshst && echo "~/.lesshst を作成しました"

# Install neobundle for vim
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins ->  vim -c ':NeoBundleInstall'"
