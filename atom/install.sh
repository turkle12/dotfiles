#!/usr/bin/env bash

set -euf -o pipefail

is_atom_installed() {
  type atom >/dev/null 2>&1
}

is_duti_installed() {
  type duti >/dev/null 2>&1
}

set_file_associations() {
  echo -e "\033[1;32mSetting file associations...\033[0m"

  if ! is_duti_installed; then
    echo -e "\033[1;32mInstalling duti...\033[0m"
    brew install duti
  fi

  duti -s com.github.atom .css all
  duti -s com.github.atom .js all
  duti -s com.github.atom .md all
  duti -s com.github.atom .txt all

  echo -e "\033[1;32mFinished setting file associations.\033[0m"
  echo ""
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
set_file_associations
