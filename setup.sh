#!/bin/bash

# Setup symlinks
[ -h ~/.vimrc ] || ( echo "Setting up ~/.vimrc"; ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc )
[ -h ~/.vim ] || ( echo "Setting up ~/.vim"; ln -sf ~/dotfiles/vim/.vim ~/.vim )
[ -h ~/.zshrc ] || ( echo "Setting up ~/.zshrc"; ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc )
[ -h ~/.oh-my-zsh ] || ( echo "Setting up ~/.oh-my-zsh"; ln -sf ~/dotfiles/zsh ~/.oh-my-zsh )

# Install Vim Bundles
if [ -z "$(ls ~/dotfiles/vim/.vim/bundle)" ]
then
  echo "Setting up Vim Bundles"
  ~/dotfiles/vim/.vim/update_bundles
else
  echo "Bundles already installed"
fi
