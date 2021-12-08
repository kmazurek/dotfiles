#!/bin/bash
set -euo pipefail

$INSTALL_CMD pipewire pipewire-alsa pipewire-pulseaudio pipewire-libjack-0_3
systemctl --user enable --now pipewire-media-session.service

# Provide mock pulseaudio binary for programs which rely on checking it (e.g. FMOD Studio)
mkdir -p ~/.local/bin
ln -s /bin/true ~/.local/bin/pulseaudio
