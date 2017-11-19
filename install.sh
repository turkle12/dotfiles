#!/usr/bin/env bash

set -euf -o pipefail

function doIt() {
  ./brew/install.sh
  ./bash/install.sh
  ./git/install.sh
  ./atom/install.sh
  ./dev-tools/install.sh
  ./apps/install.sh

  # Install files
  echo -e "\033[1;32mInstalling dotfiles...\033[0m";
  echo "";
  rsync --exclude ".git" \
        --exclude "apps" \
        --exclude "atom" \
        --exclude "bash" \
        --exclude "brew" \
        --exclude "configure" \
        --exclude "dev-tools" \
        --exclude "git" \
        --exclude ".DS_Store" \
        --exclude "install.sh" \
        --exclude "LICENSE.md" \
        --exclude "README.md" \
        -avh --no-perms . ~;

  echo -e "\033[1;32mConfiguring OS...\033[0m";
  echo "";
  ./configure/software-update.sh
  ./configure/filevault.sh
  ./configure/defaults.sh
  ./configure/umask.sh
  ./configure/dock.sh
  # ./configure/login-items.sh

  source ~/.bash_profile;
}

echo -e "\033[1;31mWARNING: This script will attempt to install Brew, various apps and overwrite existing files in your home directory. \033[0m";
read -p "Are you sure you want to continue? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  doIt;
fi;

unset doIt;
