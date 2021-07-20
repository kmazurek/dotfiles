function bd_wrapper() {
    if [ $# -eq 0 ]; then
        bd 1
    else
        bd "$@"
    fi
}

alias bd=bd_wrapper
alias up=bd_wrapper
