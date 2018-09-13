#!/bin/bash

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.local/share/nvim/site/autoload

cp init.vim $HOME/.config/nvim/
pushd $HOME/.local/share/nvim/site/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
popd

pip3 install neovim
nvim +PlugInstall
