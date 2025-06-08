#!/usr/bin/env bash

ln -s ~/Repositories/homedir/etc/ ~/etc
ln -s ~/Repositories/homedir/bin/ ~/bin
ln -s ~/Repositories/homedir/lib/ ~/lib
ln -s ~/Repositories/homedir/.bashrc ~/.bashrc
ln -s ~/Repositories/homedir/.bash_profile  ~/.bash_profile
ln -s ~/Repositories/homedir/.inputrc ~/.inputrc
ln -s ~/Repositories/homedir/.screenrc ~/.screenrc
ln -s ~/Repositories/homedir/.gitignore ~/.gitignore
ln -s ~/Repositories/homedir/.gitconfig ~/.gitconfig
ln -s ~/Repositories/homedir/.vimrc ~/.vimrc
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/tmp
mkdir -p ~/var
