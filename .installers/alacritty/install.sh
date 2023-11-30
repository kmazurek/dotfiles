#!/bin/bash
set -euo pipefail

case "$OSNAME" in
    *Ubuntu*)
        sudo add-apt-repository ppa:mmstick76/alacritty
        $INSTALL_CMD alacritty
        ;;
    *)
        $INSTALL_CMD alacritty
        ;;
esac
