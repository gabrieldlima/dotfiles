{
  pkgs,
  ...
}: {
  imports = [
    # ./alacritty.nix
    # ./hyprland.nix

    ./awesome
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./flameshot.nix
    ./git.nix
    ./qutebrowser.nix
    ./starship.nix
    ./stylix.nix
    ./wezterm
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
    mangohud
    neovim
    nixd
    obsidian
    pavucontrol
    ripgrep
    tldr
    unzip
    virtiofsd
    wget
  ];
}
