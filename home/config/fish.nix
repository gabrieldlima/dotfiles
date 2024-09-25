# NOTE: https://fishshell.com/docs/current/index.html
{
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    # Shell script code called during interactive fish shell initialisation.
    interactiveShellInit = ''
      #########################################################################
      # Disable greeting message
      set -g fish_greeting

      #########################################################################
      # Theme
      # name: 'Catppuccin Mocha'
      # url: 'https://github.com/catppuccin/fish'
      set fish_color_normal cdd6f4
      set fish_color_command 89b4fa
      set fish_color_param f2cdcd
      set fish_color_keyword f38ba8
      set fish_color_quote a6e3a1
      set fish_color_redirection f5c2e7
      set fish_color_end fab387
      set fish_color_comment 7f849c
      set fish_color_error f38ba8
      set fish_color_gray 6c7086
      set fish_color_selection --background=313244
      set fish_color_search_match --background=313244
      set fish_color_option a6e3a1
      set fish_color_operator f5c2e7
      set fish_color_escape eba0ac
      set fish_color_autosuggestion 6c7086
      set fish_color_cancel f38ba8
      set fish_color_cwd f9e2af
      set fish_color_user 94e2d5
      set fish_color_host 89b4fa
      set fish_color_host_remote a6e3a1
      set fish_color_status f38ba8
      set fish_pager_color_progress 6c7086
      set fish_pager_color_prefix f5c2e7
      set fish_pager_color_completion cdd6f4
      set fish_pager_color_description 6c7086

      #########################################################################
      # Shell prompt
      starship init fish | source

      #########################################################################
      # Atuin (better shell history)
      atuin init fish | source
    '';

    # An attribute set that maps aliases (the top level attribute names in this
    # option) to command strings or directly to build outputs.
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
      emacs = "nvim";

      # Colors
      ip   = "ip -color";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
      tree = "tree -C";

      # Misc
      t     = "tldr";
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
