#!/usr/bin/env bash

set -euf -o pipefail

is_dockutil_installed() {
  type dockutil >/dev/null 2>&1
}

set_dock_items() {
  echo -e "\033[1;32mSetting dock items...\033[0m"

  if ! is_dockutil_installed; then
    echo -e "\033[1;32mInstalling dockutils...\033[0m"
    brew install dockutil
  fi

  # dockutil --remove all
  dockutil --remove Launchpad --no-restart
  dockutil --remove Messages --no-restart
  dockutil --remove Notes --no-restart
  dockutil --remove Mail --no-restart
  dockutil --remove Contacts --no-restart
  dockutil --remove Maps --no-restart
  dockutil --remove FaceTime --no-restart
  dockutil --remove Photo\ Booth --no-restart
  dockutil --remove iTunes --no-restart
  dockutil --remove iBooks --no-restart

  # dockutil --add /Applications/System\ Preferences.app
  # dockutil --add /Applications/App\ Store.app

  dockutil --add /Applications/Google\ Chrome.app

  dockutil --add /Applications/Atom.app
  dockutil --add /Applications/iTerm.app

  dockutil --add /Applications/Calendar.app
  dockutil --add /Applications/Slack.app
  dockutil --add /Applications/Spotify.app

  dockutil --add /Applications --view grid --display folder --sort name
  dockutil --add '~/Downloads' --view grid --display folder --sort name

  echo -e "\033[1;32mFinished setting dock items.\033[0m"
  echo ""
}

set_dock_items
