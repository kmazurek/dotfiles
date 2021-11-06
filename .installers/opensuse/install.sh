#!/bin/bash
set -eu

# opi
sudo zypper in -y opi

# video codecs
opi codecs

# flatpak
sudo zypper in -y flatpak

# xinput
sudo zypper in -y xinput xev
