{
  pkgs,
  ...
}: {
  imports = [
    ./awesome
    ./bat.nix
    ./eza.nix
    ./flameshot.nix
    ./git.nix
    ./picom.nix
    ./qutebrowser
    ./starship.nix
    ./steam.nix
  ];

  home.packages = with pkgs; [
    _1password-gui
    atuin
    duf
    fd
    file
    fish
    gimp
    gnome.gnome-themes-extra
    gnumake
    jq
    mangohud
    neovim
    nixd
    obsidian
    pavucontrol
    qutebrowser
    ripgrep
    sxiv
    tldr
    unzip
    virtiofsd
    wezterm
    wget
    xsel
    xwallpaper
  ];
  home.file.".config/wezterm/wezterm.lua".source = ./wezterm/wezterm.lua;
}
