#!/bin/bash
set -euo pipefail

sudo usermod -aG audio "$USER"
sudo cp audio.conf /etc/security/limits.d

echo "fs.inotify.max_user_watches = 524288" | sudo tee /etc/sysctl.conf

$INSTALL_CMD qjackctl
# See: https://geekosdaw.tuxfamily.org/en/ in case yabridge is not found
$INSTALL_CMD yabridge yabridgectl wine
