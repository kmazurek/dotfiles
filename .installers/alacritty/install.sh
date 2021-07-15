#!/bin/bash
set -euo pipefail

case "$DISTRO" in
    *Ubuntu*)
        sudo add-apt-repository ppa:mmstick76/alacritty
        $INSTALL_CMD alacritty
        ;;
    *)
        $INSTALL_CMD alacritty
        ;;
esac
