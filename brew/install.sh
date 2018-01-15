#!/usr/bin/env bash

set -euf -o pipefail

is_brew_installed() {
  type brew >/dev/null 2>&1
}

install_brew() {
  local name="Brew"
  if ! is_brew_installed
  then
    echo -e "\033[1;32mInstalling $name...\033[0m"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo -e "\033[1;32m$name is already installed.\033[0m"
  fi

  echo -e "\033[1;32mUpdating $name...\033[0m"
  brew update && brew upgrade

  echo -e "\033[1;32mInstalling some $name basics...\033[0m"
  brew install cask coreutils dockutil findutils moreutils rsync

  echo -e "\033[1;32mFinished installing $name\033[0m"
}

install_brew
