docker_clear() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}

docker_connect() {
    docker exec -it "$1" /bin/bash
}

extract() {
    if [ -f $1 ] ; then
        case $1 in
	    *.tar.xz)          tar xf $1	;;
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *.7z)             7z e $1          ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

portslay() {
    # Kills process bound to the port given as argument
    kill -9 `lsof -i tcp:$1 | tail -1 | awk '{ print $2;}'`
}

yubikey_switch_key() {
    gpg-connect-agent "scd serialno" "learn --force" /bye
    echo UPDATESTARTUPTTY | gpg-connect-agent
}

# Trying to change Python virtual env if .venv file is present

# Support for bash
PROMPT_COMMAND='prompt'
# Support for zsh
precmd() { eval "$PROMPT_COMMAND" }

function prompt() {
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e .venv && workon `cat .venv`
    fi
}


