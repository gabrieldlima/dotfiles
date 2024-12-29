{
  pkgs,
  ...
}: {
  imports = [
    ./alacritty
    ./awesome
    ./bash
    ./bat
    ./dunst
    ./eza
    ./fish
    ./git
    ./kitty
    ./mangohud
    ./qutebrowser
    ./redshift
    ./rofi
    ./starship
    ./stylix
    ./wezterm
    ./yazi
    ./zathura
  ];

  home.packages = with pkgs; [
    _1password-gui
    atuin
    clang-tools
    duf
    fd
    file
    gcc
    gimp
    gnumake
    jq
    neovim
    nixd
    obsidian
    pavucontrol
    ripgrep
    tldr
    unzip
    wget
    zoxide
  ];
}
