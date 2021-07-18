export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

function pass_wrapper() {
    if [ $# -eq 0 ]; then
        pass fzf
    else
        pass "$@"
    fi
}

alias pass=pass_wrapper
