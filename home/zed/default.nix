{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = [
      pkgs.zed-editor
    ];

    file = {
      ".config/zed" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/zed";
      };
    };
  };
}
