#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $SCRIPT_DIR/.config $HOME/.config 
ln -s $SCRIPT_DIR/.local $HOME/.local

pip3 install neovim
nvim :PlugInstall
