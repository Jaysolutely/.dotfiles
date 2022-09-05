#! /bin/sh

wget -O ~/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzvf ~/nvim-linux64.tar.gz
cp -r ~/nvim-linux64 /usr/share/.
rm -rf ~/nvim-linux64
rm -f ~/nvim-linux64.tar.gz
