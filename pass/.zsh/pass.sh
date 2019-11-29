PASSWORD_STORE_ENABLE_EXTENSIONS=true

pass_wrapper() {
    if [ $# -eq 0 ]; then
        pass fzf
    else
        pass "$@"
    fi
}

alias pass=pass_wrapper
