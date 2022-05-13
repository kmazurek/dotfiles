export PATH=$HOME/.local/bin:$PATH

# in case of failed glob match, pass the bad match onto the command (e.g. fixes git HEAD^)
setopt NO_NOMATCH

# Set default editor
export VISUAL=vim
export EDITOR=vim

# Initialize plugins
PLUGINS=~/.zsh/plugins
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/bd/bd.zsh
fpath+=$PLUGINS/zsh-completions
fpath+=$PLUGINS/pure

# Set up pure prompt
autoload -U promptinit; promptinit
prompt pure
PURE_GIT_PULL=0

# Set up completion
autoload -U compinit; compinit

# load custom submodules
if [ -d ~/.zsh ]; then
    for f in $(find -L ~/.zsh -maxdepth 1 ! -name '.*' -type f); do
        source $f
    done
fi

# should be loaded as late as possible
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up fzf
if $(which fzf &>/dev/null); then
    source $PLUGINS/fzf/shell/completion.zsh
    source $PLUGINS/fzf/shell/key-bindings.zsh
fi
