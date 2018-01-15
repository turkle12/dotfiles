#!/usr/bin/env bash

set -euf -o pipefail

update_bash() {
  echo -e "\033[1;32mUpdating Bash and installing iTerm2...\033[0m"
  brew install bash bash-completion@2
  brew cask install iterm2

  # Add the new shell to the list of acceptable shells
  # Switch to using brew-installed bash as default shell
  if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
    echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/bash;
  fi;

  # Change the shell for the user
  chsh -s /usr/local/bin/bash

  # Add iTerm shell integrations
  curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

  echo -e "\033[1;32mFinished updating Bash and installing iTerm2\033[0m"
  echo ""
}

update_bash
