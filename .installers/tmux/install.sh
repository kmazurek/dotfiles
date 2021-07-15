#!/bin/bash
set -euo pipefail

$INSTALL_CMD tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
