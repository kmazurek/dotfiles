#!/bin/bash
set -euxo pipefail

# up
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

sudo apt install fzf peco

# pet
wget https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
dpkg -i pet_0.3.0_linux_amd64.deb
