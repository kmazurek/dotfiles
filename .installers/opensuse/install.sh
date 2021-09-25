#!/bin/bash
set -eu

# opi
sudo zypper in opi

# video codecs
sudo zypper in ffmpeg-4
opi codecs

# flatpak
sudo zypper in flatpak

# xinput
sudo zypper in xinput xev

# pipewire
sudo zypper in pipewire pipewire-alsa pipewire-pulseaudio pipewire-libjack-0_3
