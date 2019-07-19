#!/bin/bash

WORKING_DIR=$(mktemp -d)
STOWSH_REPO="Https://raw.githubusercontent.com/williamsmj/stowsh/master/stowsh"

# Get stowsh, add it to path
wget -P "$WORKING_DIR" "$STOWSH_REPO"
stowsh_path="$WORKING_DIR/stowsh"
chmod +x "$stowsh_path"

# Get root level dirs that don't start with a dot
pkgs="$(find . -maxdepth 1 ! -name '.*' -type d | sed "s|./||")"

# Install packages
for pkg in $pkgs
do
    read -p "Link $pkg? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        "$stowsh_path" -v -s "$pkg" -t "$HOME"
    fi
done

rm -r "$WORKING_DIR"
