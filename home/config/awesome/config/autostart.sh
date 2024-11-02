#!/usr/bin/env bash

function run {
  if ! [[ "$(pgrep -f "$1")" ]]; then
    "$@" &
  fi
}

run picom
run xrdb -load "$HOME/.Xresources"
run xwallpaper --stretch "$HOME/Pictures/Wallpapers/wallpaper.jpg"
run setxkbmap -option caps:escape
