function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    $(which -a ranger | tail -n 1) --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

alias ranger=ranger-cd
