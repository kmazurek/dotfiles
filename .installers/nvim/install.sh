#!/bin/bash
set -euo pipefail

curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage > ~/.local/bin/nvim
chmod +x ~/.local/bin/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

coc_extensions="coc-go coc-json coc-rls"
nvim +"PlugInstall --sync" +"CocInstall -sync $coc_extensions" +qa
