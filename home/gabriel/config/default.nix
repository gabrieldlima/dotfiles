{
  pkgs,
  ...
}: {
  imports = [
    # ./alacritty.nix
    # ./awesome
    # ./flameshot.nix
    # ./hyprland

    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./git.nix
    ./qutebrowser
    ./starship.nix
    ./wezterm
    ./yazi
  ];

  home.packages = with pkgs; [
    _1password-gui
    atuin
    brave
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
    steam
    tldr
    unzip
    virtiofsd
    wget
  ];
}
