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

mas "OneDrive", id: 823766827
mas "Tailscale", id: 1475387142
mas "Telegram", id: 747648890
mas "Whisper Transcription", id: 1668083311
mas "Yubico Authenticator", id: 1497506650
EOF

# Cleanup old packages
brew cleanup --prune=all

# Symlink dotfiles to $HOME
stow -Rvt $HOME macos
