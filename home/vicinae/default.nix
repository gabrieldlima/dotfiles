{
  config,
  ...
}: {
  home = {
    file = {
      "${config.home.homeDirectory}/.local/share/vicinae/themes" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/vicinae/themes";
      };
    };
  };

  programs.vicinae = {
    enable = true;
    settings = {
      close_on_focus_loss = false;
      consider_preedit = false;
      pop_to_root_on_close = false;
      favicon_service = "twenty";
      search_files_in_root = false;
      keybinding = "emacs";
      escape_key_behavior = "close_window";
      font = {
        normal = {
          size = 11;
          family = "Iosevka";
        };
      };
      theme = {
        light = {
          name = "gruvbox-dark-hard";
          icon_theme = "Papirus-Dark";
        };
        dark = {
          name = "gruvbox-dark-hard";
          icon_theme = "Papirus-Dark";
        };
      };
      launcher_window = {
        opacity = 1.0;
        client_side_decorations = {
          enabled = false;
        };
      };
    };
  };
}
