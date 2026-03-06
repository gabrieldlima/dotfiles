{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../fuzzel
    ../waybar
  ];

  home = {
    packages = [
      pkgs.niri
      pkgs.swww
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
