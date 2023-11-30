function ranger-cd {
	tempfile="$(mktemp -t tmp.XXXXXX)"
	$(which -a ranger | tail -n 1) --choosedir="$tempfile" "${@:-$(pwd)}"
	test -f "$tempfile" &&
		if [ "$(cat -- "$tempfile")" != "$(echo -n $(pwd))" ]; then
			cd -- "$(cat "$tempfile")"
		fi
	rm -f -- "$tempfile"
}

alias ranger=ranger-cd

# Add a `r` function to zsh that opens ranger either at the given directory or
# at the one zoxide suggests
function r {
	if [ "$1" != "" ]; then
		if [ -d "$1" ]; then
			ranger-cd "$1"
		else
			ranger-cd "$(zoxide query $1)"
		fi
	else
		ranger-cd
	fi
	return $?
}
