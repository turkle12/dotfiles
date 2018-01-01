#!/usr/bin/env bash

set -euf -o pipefail

install_apps() {
  local name="Bash"

  echo -e "\033[1;32mInstalling other apps...\033[0m"
  # Appcleaner - Good for tiding up after removing an app
  brew cask install appcleaner

  # Boxcryptor - Cloud file encryption
  # NOTE: Need to use --force if already installed...
  brew cask install boxcryptor --force

  # Fliqlo clock screensaver
  brew cask install fliqlo

  # Google Stuff
  brew cask install google-chrome google-backup-and-sync

  # Paragon - for NTFS read/write, requires account
  brew cask install paragon-ntfs

  # Spotify
  brew cask install spotify spotify-notifications

  # WhatsApp
  brew cask install whatsapp

  echo -e "\033[1;32mFinished installing other apps\033[0m"
  echo ""
}

install_apps
