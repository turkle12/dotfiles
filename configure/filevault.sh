#!/usr/bin/env bash

set -euf -o pipefail

setup_filevault() {
  if ! fdesetup isactive >/dev/null; then
    currentuser="$(whoami)"
    echo -e "\033[1;32mFileVault fde is not enabled for current user ($currentuser). Enabling...\033[0m"
    sudo fdesetup enable -user "${currentuser}" -outputplist > ./FileVaultRecovery.plist
    echo -e "\033[1;32mFileVault fde is now enabled. Store your recovery key somewhere safe, then delete the plist.\033[0m"
  else
    echo -e "\033[1;32mFileVault fde is already enabled.\033[0m"
  fi
  echo ""
}

setup_filevault
