#!/bin/bash
set -eu

# opi
sudo zypper in -y opi

# video codecs
opi codecs

# package utils
sudo zypper in -y flatpak dpkg

# xinput
sudo zypper in -y xinput xev

# browserpass
sudo zypper in browserpass-native
