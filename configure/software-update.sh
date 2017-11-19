#!/usr/bin/env bash

set -euf -o pipefail

install_software_updates() {
  echo -e "\033[1;32mInstalling macOS software updates...\033[0m"
  softwareupdate --install --all
  echo -e "\033[1;32mFinished macOS software updates\033[0m"
  echo ""
}

install_software_updates
