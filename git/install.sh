#!/usr/bin/env bash

set -euf -o pipefail

install_git() {
  local name="Git tools"

  echo -e "\033[1;32mInstalling $name...\033[0m"

  brew install git git-flow-avh bash-git-prompt
  brew cask install sourcetree

  echo -e "\033[1;32mFinished installing $name\033[0m"
  echo ""

  echo -e "\033[1;32mConfiguring $name...\033[0m"

  git config gitflow.hotfix.finish.message "Hotfix %tag%"
  git config gitflow.release.finish.message "Release %tag%"

  echo -e "\033[1;32mFinished configuring $name\033[0m"
  echo ""
}

install_git
