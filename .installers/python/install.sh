#!/bin/bash
set -euo pipefail

if [[ "$OSNAME" == "MacOS"* ]]; then
    brew install pyenv
    pyenv install 3.10.4
    pyenv install 2.7.18
    pyenv global 3.10.4 2.7.18
fi

pip install black mypy virtualenvwrapper
