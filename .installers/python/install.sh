#!/bin/bash
set -euo pipefail

<<<<<<< HEAD
case "$DISTRO" in
    *openSUSE*)
        opi virtualenvwrapper
        ;;
    *)
        $INSTALL_CMD virtualenvwrapper
        ;;
esac

if [[ "$OSNAME" == "MacOS"* ]]; then
    brew install pyenv pyenv-virtualenvwrapper
    pyenv install 3.10.4
    pyenv install 2.7.18
    pyenv global 3.10.4 2.7.18
    eval "$(pyenv init -)"
fi

pip install black mypy virtualenvwrapper
