#!/bin/bash
set -euo pipefail

INSTALLERS_PATH=".installers"
STOWSH_PATH="$INSTALLERS_PATH/stowsh"

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

set_os_name() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if ! [ -f /etc/os-release ]; then
            echo "Cannot determine Linux distro: /etc/os-release doesn't exist"
	    exit 1
        fi

        source /etc/os-release
        export OSNAME=$NAME
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        export OSNAME="MacOS"
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

set_install_cmd() {
    case "$OSNAME" in
        *openSUSE*)
	    export INSTALL_CMD="sudo zypper in -y"
	    ;;
        *Ubuntu*)
	    export INSTALL_CMD="sudo apt install -y"
	    ;;
        *MacOS*)
	    export INSTALL_CMD="brew install"
	    ;;
	*)
	    echo "Unrecognized OS: $OSNAME"
	    exit 1
	    ;;
     esac
}

main() {
    set_os_name
    set_install_cmd
    # If any arguments were passed in, use them as the list of packages to install
    if [ $# -eq 0 ]; then
        # Get root level dirs that don't start with a dot
        pkgs="$(find . -maxdepth 1 ! -name '.*' -type d | sed "s|./||")"
    else
        pkgs="$@"
    fi

    # Install packages
    for pkg in $pkgs; do
        install_package $pkg
        link_package $pkg
    done
}

main "$@"
