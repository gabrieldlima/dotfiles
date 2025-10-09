{
  config,
  ...
}: {
  home.file = {
    ".config/niri" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/niri";
    };
  };
}
