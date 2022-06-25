#!/bin/bash
set -euo pipefail

case "$DISTRO" in
    *openSUSE*)
        $INSTALL_CMD password-store
        $INSTALL_CMD pinentry-gtk2
        ;;
    *)
        $INSTALL_CMD pass
        ;;
esac

$INSTALL_CMD fzf

key="0x53507E32EE45F70D"
gpg --keyserver pgp.mit.edu --recv-key $key
# used to set ultimate trust for the imported key
gpg --edit-key $key
