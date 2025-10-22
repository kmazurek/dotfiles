export PATH=$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

# In case of failed glob match, pass the bad match onto the command (e.g. fixes git HEAD^)
setopt NO_NOMATCH
# Enable switching directories without `cd`
setopt autocd

# Set default editor
export VISUAL=hx
export EDITOR=hx

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

# Load custom submodules
if [ -d ~/.zsh ]; then
    for f in $(find -L ~/.zsh -maxdepth 1 ! -name '.*' -type f); do
        source $f
    done
fi

# Should be loaded as late as possible
source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set up fzf
if $(which fzf &>/dev/null); then
    source $PLUGINS/fzf/shell/completion.zsh
    source $PLUGINS/fzf/shell/key-bindings.zsh
fi

# Load zmv (zsh batch renamer)
autoload zmv

# Hook up direnv
if $(which direnv &>/dev/null); then
    eval "$(direnv hook zsh)"
fi

