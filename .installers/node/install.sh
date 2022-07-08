#!/bin/bash
set -euo pipefail

# Install node and npm for the current user using the n version manager
mkdir -p "~/.local/bin"
n_destination=$(realpath ~/.local/bin/n)
mkdir -p $n_destination
curl -L https://git.io/n-install | N_PREFIX=$n_destination bash -s -- -n
