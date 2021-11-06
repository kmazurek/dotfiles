#!/bin/bash
set -euo pipefail

$INSTALL_CMD pipewire pipewire-alsa pipewire-pulseaudio pipewire-libjack-0_3
systemctl --user enable --now pipewire.{service,socket}
