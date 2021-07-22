#!/bin/bash
set -eu

# video codecs
sudo zypper in ffmpeg-4
sudo zypper in opi
opi codecs

# flatpak
sudo zypper in flatpak

# xinput
sudo zypper in xinput xev
