#!/bin/bash
set -euo pipefail

# pull plugin submodules
git submodule update --init --recursive

$INSTALL_CMD zsh
chsh -s $(which zsh)
