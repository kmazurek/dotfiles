export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

source ~/.local/bin/virtualenvwrapper.sh

function venv_chpwd_hook() {
    test -e .venv && workon $(cat .venv)
}

chpwd_functions+=(venv_chpwd_hook)
