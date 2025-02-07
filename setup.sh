#!/bin/bash
set -e

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share/nvim/site/autoload
mkdir -p $HOME/.local/share/nvim/undo

#install nodejs and npm (for mason-lspconfig)
NODE_VERSION=v22.13.1
wget "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz"
tar xf node-${NODE_VERSION}-linux-x64.tar.xz --strip-components=1 -C ~/.local/
rm node-${NODE_VERSION}-linux-x64.tar.xz

#install unzip (for mason-lspconfig)
sudo apt-get install -y unzip

# install ag
sudo apt-get install -y silversearcher-ag

# install universal-ctags
sudo apt-get install -y gcc make pkg-config autoconf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev libxml2-dev
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure  --prefix=$HOME/.local
make
make install
cd ..
rm -rf ctags

# install nvim
wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz
tar xf nvim-linux-x86_64.tar.gz -C ~/.local --strip-components=1
rm nvim-linux-x86_64.tar.gz

cp -R nvim $HOME/.config/
pushd $HOME/.local/share/nvim/site/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
popd

nvim --headless +PlugInstall +qa
nvim --headless +"LspInstall rust_analyzer" +qa
nvim --headless +"LspInstall pyright" +qa
nvim --headless +"LspInstall clangd" +qa
