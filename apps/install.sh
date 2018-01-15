#!/usr/bin/env bash

set -euf -o pipefail

install_apps() {
  local name="Bash"

  echo -e "\033[1;32mInstalling other apps...\033[0m"

  # Google Stuff
  # brew cask install google-chrome google-backup-and-sync

  # Spotify
  brew cask install spotify spotify-notifications

  # Firefox
  brew cask install firefox

  # Evernote
  brew cask install evernote

  # Slack
  # brew cask install slack


  echo -e "\033[1;32mFinished installing other apps\033[0m"
  echo ""
}

install_apps
