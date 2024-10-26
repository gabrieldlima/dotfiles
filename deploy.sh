#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
TMP_DIR="/tmp"


# /* ======================================================================== *\
awesome() {
  echo "Creating symbolic link for AwesomeWM..."
  ln -sf "$DOTFILES_DIR/home/config/awesome" "$HOME/.config/awesome"
}


# /* ======================================================================== *\
home() {
  echo "Executing home-manager switch..."
  home-manager switch --flake .#gabriel@aorus
}

aorus() {
  echo "Executing nixos-rebuild switch..."
  sudo nixos-rebuild switch --flake .#aorus
}


# /* ======================================================================== *\
font() {
  FONTS_DIR="$HOME/.local/share/fonts"

  mkdir -p "$TMP_DIR" "$FONTS_DIR"

  # NOTE: https://github.com/be5invis/Iosevka
  echo "Downloading Iosevka fonts to $TMP_DIR..."
  curl -s 'https://api.github.com/repos/be5invis/Iosevka/releases/latest' | \
    jq -r ".assets[] | .browser_download_url" | \
    grep -E 'PkgTTC-Iosevka(Etoile|Slab)' | \
    while read -r url; do
      file_name=$(basename "$url")
      curl -L --fail --progress-bar --show-error -o "$TMP_DIR/$file_name" "$url"
    done

  echo "Extracting fonts to $FONTS_DIR..."
  find "$TMP_DIR" -name "*.zip" -exec unzip -q -o {} -d "$FONTS_DIR/Iosevka" \; 2>/dev/null

  echo "Updating font cache..."
  fc-cache -f

  echo "Done"
}


# /* ======================================================================== *\
help() {
  echo "Usage: $0 {home|aorus|awesome|font}"
}


# /* ======================================================================== *\
case "$1" in
  aorus)   aorus ;;
  awesome) awesome ;;
  font)    font ;;
  home)    home ;;
  *)       help ;;
esac

