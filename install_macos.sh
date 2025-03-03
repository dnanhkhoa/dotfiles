#!/bin/bash

# Enable strict error handling
set -Eeuxo pipefail

# Check if Homebrew is installed
command -v brew &>/dev/null ||
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
    # Disable analytics
    brew analytics off

# Update Homebrew
brew update

# Install packages
brew bundle --no-lock --file=/dev/stdin <<EOF
EOF

# Cleanup old packages
brew cleanup --prune=all

# Symlink dotfiles to $HOME
stow -Rvt $HOME macos
