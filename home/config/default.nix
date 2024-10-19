{
  pkgs,
  ...
}: {
  imports = [
    # ./hyprland
    # ./wezterm

    ./alacritty.nix
    ./awesome
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./qutebrowser.nix
    ./rofi.nix
    ./starship.nix
    ./stylix.nix
    ./yazi
    ./zathura.nix
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
    nixd
    neovim
    obsidian
    pavucontrol
    ripgrep
    tldr
    unzip
    virtiofsd
    wget
  ];
}
