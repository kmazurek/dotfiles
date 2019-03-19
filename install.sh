#!/bin/bash

# Get stowsh, add it to path
wget -P ~/.local/bin https://raw.githubusercontent.com/williamsmj/stowsh/master/stowsh
chmod +x ~/.local/bin/stowsh

# Get root level dirs that don't start with a dot
pkgs="$(find . -maxdepth 1 ! -name '.*' -type d | sed "s|./||")"

# Install packages
for pkg in $pkgs
do
    read -p "Link $pkg? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        stowsh -v -s "$pkg" -t "$HOME"
    fi
done
