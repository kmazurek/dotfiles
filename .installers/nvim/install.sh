#!/bin/bash
set -euo pipefail

$INSTALL_CMD neovim python3-neovim

# plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +"PlugInstall --sync" +qa

# coc.nvim 
curl -sL install-node.now.sh/lts | sudo bash
