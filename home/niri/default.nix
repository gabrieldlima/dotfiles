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
    ];

    file = {
      ".config/niri" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/niri";
      };
    };
  };
}
