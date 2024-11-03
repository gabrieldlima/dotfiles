{
  pkgs,
  ...
}: {
  imports = [
    # ./alacritty.nix
    # ./hyprland

    ./awesome
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./gaming.nix
    ./qutebrowser.nix
    ./rofi.nix
    ./starship.nix
    ./stylix.nix
    ./wezterm
    ./yazi
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    # dev tools
    # -------------
    clang-tools
    gcc
    gnumake
    nixd

    # cli apps
    # -------------
    atuin
    duf
    fd
    file
    jq
    neovim
    ripgrep
    tldr
    unzip
    wget

    # gui apps
    # -------------
    _1password-gui
    gimp
    obsidian
    pavucontrol
  ];
}
