#!/bin/bash
set -euo pipefail

sudo usermod -aG audio "$USER"
sudo cp audio.conf /etc/security/limits.d

# https://wiki.linuxaudio.org/wiki/system_configuration#quality_of_service_interface
sudo cp 99-cpu-dma-latency.rules /etc/udev/rules.d
sudo udevadm control --reload-rules
sudo udevadm trigger

sudo cp sysctl.conf /etc/sysctl.conf

$INSTALL_CMD qjackctl
# See: https://geekosdaw.tuxfamily.org/en/ in case yabridge is not found
$INSTALL_CMD yabridge yabridgectl wine
