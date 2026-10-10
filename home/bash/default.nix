# ╔════════════════════════════════╗
# ║██████╗  █████╗ ███████╗██╗  ██╗║
# ║██╔══██╗██╔══██╗██╔════╝██║  ██║║
# ║██████╔╝███████║███████╗███████║║
# ║██╔══██╗██╔══██║╚════██║██╔══██║║
# ║██████╔╝██║  ██║███████║██║  ██║║
# ║╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝║
# ╚════════════════════════════════╝

{
  config,
  ...
}: {
  programs.bash = {
    enable = true;

    historyControl = [ "ignoredups" ];
    historyFileSize = 100000;
    historySize = 10000;
    historyFile = "${config.home.homeDirectory}/.bash_history";

    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && [ "$XDG_VTNR" = 1 ] && exec startx
      [ "$(tty)" = "/dev/tty2" ] && exec gamescope -W 2560 -H 1440 -r 170 -e -- steam -tenfoot
    '';

    shellAliases = {
      # List commands
      ls  = "eza --group-directories-first --long";
      ll  = "eza --group-directories-first --long";
      la  = "eza --group-directories-first --long --all";
      lt  = "eza --group-directories-first --tree";
      llt = "eza --group-directories-first --long --tree";

      # Change dirs
      ".1" = "cd ..";
      ".2" = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      # Editors
      n     = "nvim";
      vi    = "nvim";
      vim   = "nvim";
      nano  = "nvim";
      code  = "nvim";
      emacs = "emacs";

      # Colors
      ip   = "ip -color";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
      tree = "tree -C";

      # Misc
      t     = "tldr";
      tk    = "cat $HOME/.config/tk | xsel -ib";
      df    = "duf --hide special";
      cat   = "bat";
      cp    = "cp -v";
      mv    = "mv -v";
      rm    = "rm -v";
      mkdir = "mkdir -p";
      rmdir = "rmdir -p";
    };
  };
}
