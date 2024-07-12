{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./config
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";

    pointerCursor = {
      name = "catppuccin-mocha-light-cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
      size = 16;
      gtk.enable = true;
      # x11 = {
      #  enable = true;
      #  defaultCursor = "left_ptr";
      # };
    };
  };

  gtk = {
    enable = true;
    catppuccin.icon.enable = true;
    catppuccin.icon.accent = "blue";
    catppuccin.icon.flavor = "mocha";
  };

  xdg = {
    # NOTE: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
    enable = true;

    # $XDG_CACHE_HOME: Absolute path to directory holding application caches
    cacheHome = "${config.home.homeDirectory}/.cache";

    # $XDG_CONFIG_HOME: Absolute path to directory holding application configurations
    configHome = "${config.home.homeDirectory}/.config";

    # $XDG_DATA_HOME: Absolute path to directory holding application data
    dataHome = "${config.home.homeDirectory}/.local/share";

    # $XDG_STATE_HOME: Absolute path to directory holding application states
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs.createDirectories = true;

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = [ "sxiv.desktop" ];
        "image/jpg" = [ "sxiv.desktop" ];
      };
    };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
