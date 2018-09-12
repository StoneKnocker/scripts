# Young's scripts

This repository contains some files shared by Young Lu.

## Contents

* .vimrc -- vim script.

## vimrc usage
* Download scripts first.  
git clone https://github.com/progyoung/scripts
* Copy .vimrc file to your home directory.
cp scripts/.vimrc ~/.vimrc
* Then add plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* Type :PlugInstall in vim at last.

**NOTE**: You have to install youcompleteme separately.
