#!/bin/bash
set -euo pipefail

# up
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
chmod +x ~/.config/up/up.sh

sudo apt install fzf peco
