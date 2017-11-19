#!/usr/bin/env bash

set -euf -o pipefail

is_atom_installed() {
  type atom >/dev/null 2>&1
}

install_atom() {
  local name="Atom"
  if ! is_atom_installed; then
    echo -e "\033[1;32mInstalling $name...\033[0m"
    brew cask install atom
  else
    echo -e "\033[1;32m$name already installed\033[0m"
  fi

  echo -e "\033[1;32mInstalling $name sync-settings package...\033[0m"
  apm install sync-settings

  echo -e "\033[1;32mFinished installing $name\033[0m"
  echo ""
}

install_atom
