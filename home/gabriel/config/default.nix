{
  pkgs,
  ...
}: {
  imports = [
    # ./awesome

    ./alacritty.nix
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./flameshot.nix
    ./git.nix
    ./hyprland
    ./qutebrowser
    ./starship.nix
    ./steam.nix
    ./wezterm
    ./yazi
  ];

  home.packages = with pkgs; [
    _1password-gui
    atuin
    duf
    fd
    file
    gcc
    gimp
    gnome-themes-extra
    gnumake
    jq
    mangohud
    neovim
    nixd
    obsidian
    pavucontrol
    qutebrowser
    ripgrep
    tldr
    unzip
    virtiofsd
    wget
  ];
}
