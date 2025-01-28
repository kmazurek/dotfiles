#!/bin/bash
set -euo pipefail

if [[ "$OSNAME" == "MacOS"* ]]; then
    $INSTALL_CMD --cask wezterm
fi

$INSTALL_CMD wezterm
