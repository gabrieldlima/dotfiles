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
    ./git.nix
    ./qutebrowser.nix
    ./rofi.nix
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
