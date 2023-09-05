#!/bin/bash
set -euo pipefail

case "$DISTRO" in
    *openSUSE*)
        opi virtualenvwrapper
        ;;
    *)
        $INSTALL_CMD virtualenvwrapper
        ;;
esac

pip install black mypy
