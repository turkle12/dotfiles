#!/usr/bin/env bash

set -euf -o pipefail

is_node_installed() {
  type node >/dev/null 2>&1
}

is_nvm_installed() {
  type nvm >/dev/null 2>&1
}

is_pg_installed() {
  type pg_ctl >/dev/null 2>&1
}

is_rvm_installed() {
  type rvm >/dev/null 2>&1
}

install_dev_tools() {
  echo -e "\033[1;32mInstalling dev tools...\033[0m"

  if ! is_node_installed; then
    echo -e "\033[1;32mInstalling Node...\033[0m"
    brew install node
  fi

  if ! is_nvm_installed; then
    # TODO: Figure out why this always runs
    echo -e "\033[1;32mInstalling NVM...\033[0m"
    brew install nvm
  fi

  if ! is_pg_installed; then
    echo -e "\033[1;32mInstalling Postgres...\033[0m"
    brew install postgres
    brew services start postgresql
  fi

  if ! is_rvm_installed; then
    echo -e "\033[1;32mInstalling RVM...\033[0m"
    curl -L https://get.rvm.io | bash -s stable
  fi

  # Ngrok
  brew cask install ngrok

  # VirtualBox
  brew cask install virtualbox

  echo -e "\033[1;32mFinished installing dev tools\033[0m"
  echo ""
}

install_dev_tools
