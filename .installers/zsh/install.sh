#!/bin/bash
set -euo pipefail

$INSTALL_CMD zsh
chsh -s $(which zsh)
