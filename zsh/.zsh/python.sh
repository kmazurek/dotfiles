# Try setting Python virtual env if .venv file is present
function venv_chpwd_hook() {
    test -e .venv && workon $(cat .venv)
}

chpwd_functions+=(venv_chpwd_hook)
