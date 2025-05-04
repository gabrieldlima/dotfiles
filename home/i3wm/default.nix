# ╔════════════════════════════════╗
# ║██╗██████╗ ██╗    ██╗███╗   ███╗║
# ║██║╚════██╗██║    ██║████╗ ████║║
# ║██║ █████╔╝██║ █╗ ██║██╔████╔██║║
# ║██║ ╚═══██╗██║███╗██║██║╚██╔╝██║║
# ║██║██████╔╝╚███╔███╔╝██║ ╚═╝ ██║║
# ║╚═╝╚═════╝  ╚══╝╚══╝ ╚═╝     ╚═╝║
# ╚════════════════════════════════╝

{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../flameshot
    ../i3status
    ../picom
    ../xresources
  ];

  home = {
    file.".config/x11/xinitrc".text = ''
      exec i3
    '';

    packages = with pkgs; [
      sxiv
      xsel
      xwallpaper
    ];
  };

  xsession.windowManager.i3 = {
    enable = true;

    extraConfig = ''
      # Reading colors from resources
      set_from_resource $background i3wm.background #000000
      set_from_resource $foreground i3wm.foreground #ebdbb2

      set_from_resource $red     i3wm.color1     #cc241d
      set_from_resource $green   i3wm.color2     #98971a
      set_from_resource $yellow  i3wm.color3     #d79921
      set_from_resource $blue    i3wm.color4     #458588
      set_from_resource $magenta i3wm.color5     #b16286
      set_from_resource $cyan    i3wm.color6     #689d6a
    '';

    config = {
      startup = [
        { command = "picom"; notification = false; }
        { command = "xwallpaper --stretch ${config.home.homeDirectory}/pictures/wallpapers/wallpaper.jpg"; notification = false; }
        { command = "xrdb -load ${config.home.homeDirectory}/.Xresources"; notification = false; }
        { command = "setxkbmap -option caps:escape"; notification = false; }
        { command = "dunst"; notification = false; }
      ];

      defaultWorkspace = "1";
      workspaceLayout = "default";
      workspaceAutoBackAndForth = false;

      fonts = {
        names = [ "JetBrains Mono" ];
        style = "Bold";
        size = 10.0;
      };

      window = {
        titlebar = false;
        border = 2;
        hideEdgeBorders = "none";

        commands = [
          {
            command = "floating enable";
            criteria = { class = "^steam$"; };
          }
          {
            command = "floating enable";
            criteria = { class = "^1Password$"; };
          }
          {
            command = "floating enable";
            criteria = { class = "^Sxiv$"; };
          }
          {
            command = "border pixel 2";
            criteria = { class = "com.mitchellh.ghostty"; };
          }
        ];
      };

      floating = {
        titlebar = true;
        border = 2;
      };

      gaps = {
        smartBorders = "off";
        smartGaps = false;
        inner = 10;
        left = 1;
        right = 1;
        top = 1;
        bottom = 1;
      };

      focus = {
        followMouse = true;
        wrapping = "yes";
        newWindow = "smart";
        mouseWarping = true;
      };

      assigns = {
        "2" = [{ class = "^qutebrowser$"; }];
        "3" = [{ class = "^obsidian$"; }];
        "8" = [{ class = "^Virt-manager$"; }];
        "9" = [{ class = "^steam$"; }];
      };

      colors = {
        background = "$background";
        focused = {
          border      = "$blue";
          background  = "$blue";
          text        = "$background";
          indicator   = "$blue";
          childBorder = "$blue";
        };
        focusedInactive = {
          border      = "$background";
          background  = "$background";
          text        = "$foreground";
          indicator   = "$background";
          childBorder = "$background";
        };
        unfocused = {
          border      = "$background";
          background  = "$background";
          text        = "$foreground";
          indicator   = "$blue";
          childBorder = "$background";
        };
        urgent = {
          border      = "$blue";
          background  = "$blue";
          text        = "$foreground";
          indicator   = "$blue";
          childBorder = "$red";
        };
        placeholder = {
          border      = "$blue";
          background  = "$blue";
          text        = "$foreground";
          indicator   = "$blue";
          childBorder = "$green";
        };
      };

      bars = let
        bar_cmd = "${config.home.homeDirectory}/.nix-profile/bin/i3status-rs";
        bar_cfg = "${config.home.homeDirectory}/.config/i3status-rust/config-default.toml";
      in [
        {
          position = "top";
          statusCommand = "${bar_cmd} ${bar_cfg}";

          fonts = {
            names = [ "JetBrains Mono" "FiraCode Nerd Font" ];
            style = "Bold";
            size = 10.0;
          };

          colors = {
            background = "$background";
            statusline = "$foreground";
            separator  = "$blue";

            focusedWorkspace = {
              background = "$blue";
              border = "$background";
              text = "$background";
            };
            activeWorkspace = {
              background = "$yellow";
              border = "$background";
              text = "$foreground";
            };
            urgentWorkspace = {
              background = "$red";
              border = "$background";
              text = "$background";
            };
            inactiveWorkspace = {
              background = "$background";
              border = "$background";
              text = "$foreground";
            };
          };
        }
      ];

      modifier = "Mod4";

      keybindings = let
        # My default apps
        terminal    = "ghostty";
        web_browser = "qutebrowser";
        launcher    = "rofi -show drun";

        # Define names for default workspaces for which we configure key bindings later on.
        # We use variables to avoid repeating the names in multiple places.
        ws1 = "1";
        ws2 = "2";
        ws3 = "3";
        ws4 = "4";
        ws5 = "5";
        ws6 = "6";
        ws7 = "7";
        ws8 = "8";
        ws9 = "9";
      in {
        "Mod4+Return" = "exec --no-startup-id ${terminal}";
        "Mod4+p"      = "exec --no-startup-id ${launcher}";
        "Mod4+b"      = "exec --no-startup-id ${web_browser}";

        "Mod4+Shift+q" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";
        "Mod4+Shift+r" = "restart";

        "Mod4+e" = "layout toggle split";
        "Mod4+s" = "layout stacking";
        "Mod4+w" = "layout tabbed";

        "Mod4+Shift+c"     = "kill";
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+Shift+f"     = "fullscreen toggle";

        "Mod4+r" = "mode resize";

        "Mod4+a"     = "focus parent";
        "Mod4+space" = "focus mode_toggle";

        "Mod4+comma"       = "scratchpad show";
        "Mod4+Shift+comma" = "move scratchpad";

        "Mod4+d"       = "split h";
        "Mod4+Shift+d" = "split v";

        # change focus
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";

        # move focused window
        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";

        # switch to workspace
        "Mod4+1" = "workspace number ${ws1}";
        "Mod4+2" = "workspace number ${ws2}";
        "Mod4+3" = "workspace number ${ws3}";
        "Mod4+4" = "workspace number ${ws4}";
        "Mod4+5" = "workspace number ${ws5}";
        "Mod4+6" = "workspace number ${ws6}";
        "Mod4+7" = "workspace number ${ws7}";
        "Mod4+8" = "workspace number ${ws8}";
        "Mod4+9" = "workspace number ${ws9}";

        # move focused container to workspace
        "Mod4+Shift+1" = "move container to workspace number ${ws1}";
        "Mod4+Shift+2" = "move container to workspace number ${ws2}";
        "Mod4+Shift+3" = "move container to workspace number ${ws3}";
        "Mod4+Shift+4" = "move container to workspace number ${ws4}";
        "Mod4+Shift+5" = "move container to workspace number ${ws5}";
        "Mod4+Shift+6" = "move container to workspace number ${ws6}";
        "Mod4+Shift+7" = "move container to workspace number ${ws7}";
        "Mod4+Shift+8" = "move container to workspace number ${ws8}";
        "Mod4+Shift+9" = "move container to workspace number ${ws9}";
      };

      modes = {
        resize = {
          Escape = "mode default";
          Return = "mode default";

          # vim-keys
          j = "resize grow height 10 px or 10 ppt";
          h = "resize shrink width 10 px or 10 ppt";
          l = "resize grow width 10 px or 10 ppt";
          k = "resize shrink height 10 px or 10 ppt";
        };
      };
    };
  };
}

