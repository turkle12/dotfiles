#!/usr/bin/env bash

set -euf -o pipefail

set_umask() {
  # https://support.apple.com/en-gb/HT201684
  echo -e "\033[1;32mSetting umask...\033[0m"
  sudo launchctl config user umask 077
  echo -e "\033[1;32mFinished setting umask.\033[0m"
  echo ""
}

set_umask
