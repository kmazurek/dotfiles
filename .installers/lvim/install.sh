#!/bin/bash
set -euo pipefail

pip install neovim

bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
lvim +"PackerInstall" +qa
