{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../foot
    ../fuzzel
    ../waybar
  ];

  home = {
    packages = [
      pkgs.awww
      pkgs.niri
      pkgs.wl-clipboard-rs
      pkgs.xdg-desktop-portal-gtk
      pkgs.xwayland-satellite
    ];

    file = {
      ".config/niri" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/niri";
      };
    };
  };
}
