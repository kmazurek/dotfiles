#!/bin/bash
set -euo pipefail

WORKDIR=$(mktemp -d)

INSTALLERS_PATH=".installers"
STOWSH_PATH="$WORKDIR/stowsh"
STOWSH_REPO="https://raw.githubusercontent.com/williamsmj/stowsh/master/stowsh"

get_stowsh() {
    wget -P "$WORKDIR" "$STOWSH_REPO"
    chmod +x "$STOWSH_PATH"
}

ask() {
    # Based on: https://gist.github.com/davejamesmiller/1965569
    local reply

    while true; do
        echo -n "$1 [y/n] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

install_package() {
    script="$INSTALLERS_PATH/$1/install.sh"
    if [ -f "$script" ]; then
        if ask "Run installer for $1?"; then
            source $script
        fi
    fi
}

link_package() {
    if ask "Link $1?"; then
        echo "Linking $1 ..."
        "$STOWSH_PATH" -v -s "$1" -t "$HOME"
    fi
}

main() {
    # Download stowsh to a temporary directory
    get_stowsh

    # Get root level dirs that don't start with a dot
    pkgs="$(find . -maxdepth 1 ! -name '.*' -type d | sed "s|./||")"

    # Install packages
    for pkg in $pkgs; do
        link_package $pkg
        install_package $pkg
    done

    rm -r "$WORKDIR"
}

main
