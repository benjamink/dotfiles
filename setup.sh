#!/bin/bash

[ -h ~/.vimrc ] || ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
[ -h ~/.vim ] || ln -sf ~/dotfiles/vim/.vim ~/.vim
[ -h ~/.zshrc ] || ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
[ -h ~/.oh-my-zsh ] || ln -sf ~/dotfiles/zsh ~/.oh-my-zsh

if [ "$(ls ~/dotfiles/vim/.vim/bundle)" = "" ]
then
  ~/dotfiles/vim/.vim/update_bundles
fi
