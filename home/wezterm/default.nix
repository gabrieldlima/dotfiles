{
  inputs,
  config,
  ...
}: {
  home = {
    packages = [
      inputs.wezterm-nightly.packages.x86_64-linux.default
    ];

    file = {
      ".config/wezterm" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/wezterm";
      };
    };
  };
}
