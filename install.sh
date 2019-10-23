#!/bin/bash

WORKING_DIR=$(mktemp -d)
STOWSH_PATH="$WORKING_DIR/stowsh"
STOWSH_REPO="Https://raw.githubusercontent.com/williamsmj/stowsh/master/stowsh"

get_stowsh() {
    wget -P "$WORKING_DIR" "$STOWSH_REPO"
    chmod +x "$STOWSH_PATH"
}

link_package() {
    read -p "Link $1? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        "$STOWSH_PATH" -v -s "$1" -t "$HOME"
    fi
}

main() {
    # Download stowsh to a temporary directory
    get_stowsh

    # Get root level dirs that don't start with a dot
    pkgs="$(find . -maxdepth 1 ! -name '.*' -type d | sed "s|./||")"

    # Install packages
    for pkg in $pkgs
    do
        link_package $pkg
    done

    rm -r "$WORKING_DIR"
}

main
