export PATH=$HOME/.local/bin:$PATH

# default editor
export VISUAL=vim
export EDITOR=vim

PLUGINS=~/.zsh/plugins
source $PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS/bd/bd.zsh
fpath+=$PLUGINS/zsh-completions
fpath+=$PLUGINS/pure

autoload -U promptinit; promptinit
prompt pure

autoload -U compinit; compinit

# load custom submodules
if [ -d ~/.zsh ]; then
    for f in $(find -L ~/.zsh -maxdepth 1 ! -name '.*' -type f); do
        source $f
    done
fi

# should be loaded as late as possible
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
