export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
export VIRTUALENVWRAPPER_PYTHON=$(which python3)

pyenv virtualenvwrapper

function venv_chpwd_hook() {
    test -e .venv && workon $(cat .venv)
}

chpwd_functions+=(venv_chpwd_hook)
