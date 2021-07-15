#!/bin/bash
set -euo pipefail

case "$DISTRO" in
    *openSUSE*)
        $INSTALL_CMD password-store
        ;;
    *)
        $INSTALL_CMD pass
        ;;
esac
