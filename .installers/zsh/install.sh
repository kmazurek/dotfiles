#!/bin/bash
set -euo pipefail

# pull plugin submodules
git submodule update --init --recursive

if ! [[ "$OSNAME" == "MacOS"* ]]; then
    $INSTALL_CMD zsh
fi

chsh -s $(which zsh)
