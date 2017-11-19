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

  dockutil --remove all

  dockutil --add /Applications/System\ Preferences.app
  dockutil --add /Applications/App\ Store.app

  dockutil --add /Applications/1Password.app
  dockutil --add /Applications/Spotify.app
  dockutil --add /Applications/Google\ Chrome.app

  dockutil --add /Applications/Atom.app
  dockutil --add /Applications/Sourcetree.app
  dockutil --add /Applications/iTerm.app

  dockutil --add /Applications/Mail.app
  dockutil --add /Applications/Contacts.app
  dockutil --add /Applications/Calendar.app
  dockutil --add /Applications/Wunderlist.app
  dockutil --add /Applications/Slack.app
  dockutil --add /Applications/Messages.app

  dockutil --add '~/Applications' --view grid --display folder
  dockutil --add '~/Downloads' --view grid --display folder
  dockutil --add '~/Workspace' --view grid --display folder
  echo -e "\033[1;32mFinished setting dock items.\033[0m"
  echo ""
}

set_dock_items
