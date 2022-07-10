#!/bin/bash
set -euo pipefail

python3 -m pip install --user qmk

# OpenSUSE only
sudo zypper in avrdude dfu-programmer cross-arm-gcc12 cross-avr-gcc12 cross-arm-gcc7 cross-avr-gcc7 avr-libc
