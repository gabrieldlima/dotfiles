# ╔══════════════════════════════════════════════════════════════════════════════════════════════════════╗
# ║██╗  ██╗ ██████╗ ███╗   ███╗███████╗    ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗██████╗ ║
# ║██║  ██║██╔═══██╗████╗ ████║██╔════╝    ████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝ ██╔════╝██╔══██╗║
# ║███████║██║   ██║██╔████╔██║█████╗█████╗██╔████╔██║███████║██╔██╗ ██║███████║██║  ███╗█████╗  ██████╔╝║
# ║██╔══██║██║   ██║██║╚██╔╝██║██╔══╝╚════╝██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██╔══╝  ██╔══██╗║
# ║██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗    ██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝███████╗██║  ██║║
# ║╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝║
# ╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝

{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty
    ./bash
    ./bat
    ./dunst
    ./eza
    ./fish
    # ./ghostty
    ./git
    ./hyprland
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
      inputs.zen-browser.packages.x86_64-linux.default

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

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      # Shell
      BROWSER = "qutebrowser";
      EDITOR = "nvim";
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

  # gtk = {
  #   enable = true;
  #
  #   catppuccin = {
  #     icon = {
  #       enable = true;
  #       accent = "blue";
  #       flavor = "mocha";
  #     };
  #   };
  # };
  #
  # qt = {
  #   style = {
  #     catppuccin = {
  #       enable = true;
  #       apply = true;
  #       flavor = "mocha";
  #       accent = "blue";
  #     };
  #   };
  # };


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
