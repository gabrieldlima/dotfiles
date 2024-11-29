{
  pkgs,
  ...
}: {
  imports = [
    # ./alacritty.nix
    # ./hyprland
    # ./i3wm
    # ./kitty.nix

    ./awesome
    ./bash.nix
    ./bat.nix
    ./dunst.nix
    ./eza.nix
    ./fish.nix
    ./gaming.nix
    ./git.nix
    ./qutebrowser.nix
    ./redshift.nix
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
    zoxide

    # gui apps
    # -------------
    _1password-gui
    gimp
    obsidian
    pavucontrol
  ];
}
