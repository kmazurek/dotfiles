# Load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Load pyenv
eval "$(pyenv init -)"

# Homebrew OpenSSL
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
