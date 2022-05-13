export RIPGREP_CONFIG_PATH=~/.rgrc

# Disables XON/XOFF flow control (C-s hanging terminal)
stty -ixon

export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Set max history size
export HISTSIZE=10000
# Save history after logout
export SAVEHIST=10000
# Set history file explicitly
export HISTFILE=~/.zsh_history
# Append to history file
setopt INC_APPEND_HISTORY
# Do not save a command when there's a duplicate in history
setopt HIST_IGNORE_DUPS
# Add timestamp for each history entry
setopt EXTENDED_HISTORY   
