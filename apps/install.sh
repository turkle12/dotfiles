#!/usr/bin/env bash

set -euf -o pipefail

install_apps() {
  local name="Bash"

  echo -e "\033[1;32mInstalling other apps...\033[0m"
  # Basic app
  brew cask install appcleaner

  # Google Stuff
  brew cask install google-chrome google-backup-and-sync

  # Spotify
  brew cask install spotify spotify-notifications

  # WhatsApp
  brew cask install whatsapp
  echo -e "\033[1;32mFinished installing other apps\033[0m"
  echo ""
}

install_apps
