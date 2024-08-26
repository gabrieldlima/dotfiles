{
  pkgs,
  ...
}: {
  imports = [
    # ./hyprland

    ./alacritty.nix
    ./awesome
    ./bash.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./flameshot.nix
    ./git.nix
    ./qutebrowser
    ./starship.nix
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
