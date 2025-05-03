# ╔══════════════════════════════════════════════════════════════════════════════════════════════════════╗
# ║██╗  ██╗ ██████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ ║
# ║██║  ██║██╔═══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗║
# ║███████║██║   ██║██╔████╔██║█████╗█████╗██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝║
# ║██╔══██║██║   ██║██║╚██╔╝██║██╔══╝╚════╝██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗║
# ║██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║║
# ║╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝║
# ╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝

{
  pkgs,
  ...
}: {
  imports = [
    ./alacritty
    ./hyprland
    ./bash
    ./bat
    ./dunst
    ./eza
    ./fish
    ./ghostty
    ./git
    ./kitty
    ./mangohud
    ./qutebrowser
    ./redshift
    ./rofi
    ./starship
    ./stylix
    ./wezterm
    ./xdg
    ./yazi
    ./zathura
  ];

  home = {
    username = "gabriel";
    homeDirectory = "/home/gabriel";

    packages = [
      pkgs._1password-gui
      pkgs.atuin
      pkgs.brave
      pkgs.clang-tools
      pkgs.discord
      pkgs.duf
      pkgs.emacs-gtk
      pkgs.fd
      pkgs.file
      pkgs.gamescope
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

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      # Shell
      BROWSER = "qutebrowser";
      EDITOR = "emacs";
      TERMINAL = "ghostty";
      TERM = "xterm-256color";
      HISTFILE = "$XDG_DATA_HOME/history";
      HISTSIZE = 10000;
      SAVEHIST = 10000;

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
