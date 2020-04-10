#!/bin/bash
set -euo pipefail

curl -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage > ~/.local/bin/nvim
chmod +x ~/.local/bin/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

coc_extensions="coc-explorer coc-json coc-lists coc-python coc-rls coc-go"
nvim +"PlugInstall --sync" +"CocInstall -sync $coc_extensions" +qa

# Packages required by black Python formatter
pip install neovim
sudo apt install python3-venv
