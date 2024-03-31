#!/usr/bin/env bash

function run {
  if ! [[ "$(pgrep -f "$1")" ]]; then
    "$@" &
  fi
}

run openrgb -d 0 -m off
run openrgb -d 1 -m off
run picom
run xrdb "$HOME/.Xresources"
run xwallpaper --stretch "$HOME/Pictures/Wallpapers/wallpaper.jpg"
