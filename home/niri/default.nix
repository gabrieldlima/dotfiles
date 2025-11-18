{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../waybar
  ];

  home = {
    packages = [
      pkgs.niri
      pkgs.swww
      pkgs.xwayland-satellite
    ];

    file = {
      ".config/niri" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/niri";
      };
    };
  };
}
