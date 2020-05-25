#!/bin/bash

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.local/share/nvim/site/autoload
mkdir -p $HOME/.local/share/nvim/undo

cp init.vim $HOME/.config/nvim/
cp coc-settings.json $HOME/.config/nvim/
pushd $HOME/.local/share/nvim/site/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
popd

pip3 install neovim
pip3 install --user pynvim
nvim --headless +PlugInstall +qa
nvim --headless +"CocInstall coc-rust-analyzer" +qa
