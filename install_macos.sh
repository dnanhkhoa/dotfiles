#!/bin/bash

# Enable strict error handling
set -Eeuxo pipefail

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Disable analytics
    brew analytics off
fi

# Update Homebrew
brew update

# Install packages
brew bundle --file=/dev/stdin <<EOF
brew "stow"

cask "cleanshot"
cask "font-jetbrains-mono"
cask "free-download-manager"
cask "google-chrome"
cask "logi-options+"
cask "obsidian"
cask "orbstack"
cask "proxyman"
cask "raycast"
cask "screen-studio"
cask "ssh-config-editor"
cask "tableplus"
cask "visual-studio-code"
cask "vlc"
cask "wezterm"
EOF

# Cleanup old packages
brew cleanup --prune=all

# Symlink dotfiles to $HOME
stow -Rvt "$HOME" macos
