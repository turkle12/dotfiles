#!/usr/bin/env bash

set -euf -o pipefail

function set_login_item() {
  local apps="/Applications"
  local path="$1"
  local hidden="$2"

  if [ -d "$apps/$path" ];
  then
osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$apps/$path\", hidden:$hidden}";
  fi
}

# set_login_item "Slack.app" "true"
