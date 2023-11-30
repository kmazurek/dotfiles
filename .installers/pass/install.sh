#!/bin/bash
set -euo pipefail

case "$OSNAME" in
    *openSUSE*)
        $INSTALL_CMD password-store pinentry-gtk2
        ;;
    *)
        $INSTALL_CMD pass
        ;;
esac

$INSTALL_CMD fzf

key="0x53507E32EE45F70D"
gpg --recv-key $key
# used to set ultimate trust for the imported key
gpg --edit-key $key
