#!/bin/bash
set -euo pipefail

wget -P ~/.local/bin/ https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x ~/.local/bin/diff-so-fancy
