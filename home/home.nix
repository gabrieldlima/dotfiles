# ╔══════════════════════════════════════════════════════════════════════════════════════════════════════╗
# ║██╗  ██╗ ██████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ ║
# ║██║  ██║██╔═══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗║
# ║███████║██║   ██║██╔████╔██║█████╗█████╗██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝║
# ║██╔══██║██║   ██║██║╚██╔╝██║██╔══╝╚════╝██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗║
# ║██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║║
# ║╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝║
# ╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝

{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty
    ./awesome
    ./bash
    ./bat
    ./dunst
    ./eza
    ./fish
    ./git
    ./kitty
    ./mangohud
    ./qutebrowser
    ./redshift
    ./rofi
    ./starship
    ./stylix
    ./wezterm
    ./yazi
    ./zathura
  ];

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";

    packages = [
      pkgs._1password-gui
      pkgs.atuin
      pkgs.clang-tools
      pkgs.duf
      pkgs.fd
      pkgs.file
      pkgs.gcc
      pkgs.gimp
      pkgs.gnumake
      pkgs.jq
      pkgs.neovim
      pkgs.nixd
      pkgs.obsidian
      pkgs.pavucontrol
      pkgs.ripgrep
      pkgs.steam
      pkgs.tldr
      pkgs.unzip
      pkgs.wget
      pkgs.zoxide
    ];

    sessionVariables = {
      # Shell
      BROWSER = "qutebrowser";
      EDITOR = "nvim";
      TERMINAL = "wezterm";
      TERM = "xterm-256color";
      HISTFILE = "$XDG_DATA_HOME/history";
      HISTSIZE = 10000;
      SAVEHIST = 10000;
      PATH = "$HOME/.local/bin/:$PATH";

      # # ~/ Clean-up
      CARGO_HOME = "$XDG_DATA_HOME/cargo";
      GNUPGHOME = "$XDG_DATA_HOME/gnupg";
      GOPATH = "$XDG_DATA_HOME/go";
      LESSHISTFILE = "-";
      NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
      PASSWORD_STORE_DIR = "$XDG_DATA_HOME/pass";
      RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
      STACK_ROOT = "$XDG_DATA_HOME/stack";
      XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
      XINITRC = "$XDG_CONFIG_HOME/x11/xinitrc";
      ZDOTDIR = "$HOME/.config/zsh";
    };
  };

  gtk = {
    enable = true;

    catppuccin = {
      icon = {
        enable = true;
        accent = "blue";
        flavor = "mocha";
      };
    };
  };

  qt = {
    style = {
      catppuccin = {
        enable = true;
        apply = true;
        flavor = "mocha";
        accent = "blue";
      };
    };
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

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
