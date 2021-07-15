#!/bin/bash
set -euo pipefail

$INSTALL_CMD neovim python3-neovim

# plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# plugins from plug.vim
nvim +"PlugInstall --sync" +qa
# coc extensions
#coc_extensions="coc-explorer coc-json coc-lists coc-python coc-rls coc-go"
#nvim +"CocInstall -sync $coc_extensions" +qa
