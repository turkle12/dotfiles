#!/usr/bin/env bash

set -euf -o pipefail

install_git() {
  local name="Git tools"

  echo -e "\033[1;32mInstalling $name...\033[0m"

  brew install git git-flow-avh bash-git-prompt
  brew cask install sourcetree

  echo -e "\033[1;32mFinished installing $name\033[0m"
  echo ""

  echo -e "\033[1;32mSetting Git creds...\033[0m"

  read -p "What do you want to set as your global Git name? "
  git config --global user.name $REPLY

  read -p "What do you want to set as your global Git email? "
  git config --global user.email $REPLY

  echo -e "\033[1;32mFinished setting Git creds\033[0m"
  echo ""

  if [ ! -d ~/.git/git-flow-hooks ]; then
    echo -e "\033[1;32mGrabbing Git Flow Hooks...\033[0m"
    git clone git@github.com:jaspernbrouwer/git-flow-hooks.git ~/.git
    echo -e "\033[1;32mFinished configuring Git Flow Hooks\033[0m"
    echo ""
  fi
}

install_git
