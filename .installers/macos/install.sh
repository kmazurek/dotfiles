#!/bin/bash
set -euo pipefail

# For git and stuff - install xcode cmd line tools: https://developer.apple.com/downloads/

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load homebrew in this shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install GNU find
brew install findutils
PATH=$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH

brew install openssl gpg-suite pinentry-mac

# Disable special characters pop-up when holding down a key
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Show full path in the Finder header
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder

# Sort directories first in Finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true; killall Finder
