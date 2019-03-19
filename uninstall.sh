#!/bin/bash

# Get root level dirs that don't start with a dot
pkgs="$(find . -maxdepth 1 ! -name '.*' -type d | sed "s|./||")"

# Uninstall packages
for pkg in $pkgs
do
    read -p "Unlink $pkg? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        stowsh -D -v -s "$pkg" -t "$HOME"
    fi
done
