{
  pkgs,
  ...
}: {
  imports = [
    ./flameshot.nix
    ./picom.nix
    ./xresources.nix
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
      # bindsym Mod4+Down focus down
      # bindsym Mod4+Left focus left
      # bindsym Mod4+Return exec --no-startup-id wezterm
      # bindsym Mod4+Right focus right
      # bindsym Mod4+Shift+. split v
      # bindsym Mod4+Shift+Down move down
      # bindsym Mod4+Shift+Left move left
      # bindsym Mod4+Shift+Right move right
      # bindsym Mod4+Shift+Up move up
      # bindsym Mod4+Shift+minus move scratchpad
      # bindsym Mod4+Up focus up
      # bindsym Mod4+a focus parent
      # bindsym Mod4+b exec --no-startup-id qutebrowser
      # bindsym Mod4+d exec /nix/store/sqmgxc3mi2fq656srxjfi541if63dxfz-dmenu-5.3/bin/dmenu_run
      # bindsym Mod4+minus scratchpad show
      # bindsym Mod4+p exec --no-startup-id rofi -show drun
      # bindsym Mod4+r mode resize
      # bindsym Mod4+space focus mode_toggle
      # bindsym Mod4+v split v

      # mode "resize" {
      #   bindsym Down resize grow height 10 px or 10 ppt
      #   bindsym Escape mode default
      #   bindsym Left resize shrink width 10 px or 10 ppt
      #   bindsym Return mode default
      #   bindsym Right resize grow width 10 px or 10 ppt
      #   bindsym Up resize shrink height 10 px or 10 ppt
      # }

      #   bar {
      #     font pango:monospace 8.000000
      #     mode dock
      #     hidden_state hide
      #     position bottom
      #     status_command /nix/store/a3ih241ld0jq7ycf3rl91y4xcww3fhcq-i3status-2.15/bin/i3status
      #     i3bar_command /nix/store/bgpl4fdpc4mpxnlx0mzaahs03z7zkpws-i3-4.24/bin/i3bar
      #     workspace_buttons yes
      #     strip_workspace_numbers no
      #     tray_output primary
      #     colors {
      #       background #000000
      #       statusline #ffffff
      #       separator #666666
      #       focused_workspace #4c7899 #285577 #ffffff
      #       active_workspace #333333 #5f676a #ffffff
      #       inactive_workspace #333333 #222222 #888888
      #       urgent_workspace #2f343a #900000 #ffffff
      #       binding_mode #2f343a #900000 #ffffff
      #     }
      #   }
      #

      # Reading colors from resources
      set_from_resource $background i3wm.background #000000
      set_from_resource $foreground i3wm.foreground #cdd6f4

      set_from_resource $red     i3wm.color1     #f38ba8
      set_from_resource $green   i3wm.color2     #a6e3a1
      set_from_resource $yellow  i3wm.color3     #f9e2af
      set_from_resource $blue    i3wm.color4     #89b4fa
      set_from_resource $magenta i3wm.color5     #f5c2e7
      set_from_resource $cyan    i3wm.color6     #94e2d5
    '';


    config = {
      startup = [
        { command = "picom"; notification = false; }
        { command = "xwallpaper --stretch /home/gabriel/Pictures/Wallpapers/wallpaper.jpg"; notification = false; }
        { command = "xrdb -load /home/gabriel/.Xresources"; notification = false; }
        { command = "setxkbmap -option caps:escape"; notification = false; }
      ];

      defaultWorkspace = "1";
      workspaceLayout = "default";
      workspaceAutoBackAndForth = false;

      fonts = {
        names = [ "Iosevka Slab" ];
        style = "Bold";
        size = 10.0;
      };

      window = {
        titlebar = true;
        border = 2;
        hideEdgeBorders = "smart";
      };

      floating = {
        titlebar = true;
        border = 2;
      };

      gaps = {
        smartBorders = "no_gaps";
        smartGaps = true;
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

      colors = {
        background = "$background";
        focused = {
          border      = "$blue";
          background  = "$blue";
          text        = "$background";
          indicator   = "$red";
          childBorder = "$blue";
        };
        focusedInactive = {
          border      = "$background";
          background  = "$background";
          text        = "$foreground";
          indicator   = "$red";
          childBorder = "$background";
        };
        unfocused = {
          border      = "$background";
          background  = "$background";
          text        = "$foreground";
          indicator   = "$red";
          childBorder = "$background";
        };
        urgent = {
          border      = "$blue";
          background  = "$blue";
          text        = "$foreground";
          indicator   = "$red";
          childBorder = "$green";
        };
        placeholder = {
          border      = "$blue";
          background  = "$blue";
          text        = "$foreground";
          indicator   = "$red";
          childBorder = "$green";
        };
      };

      modifier = "Mod4";

      keybindings = let
        # My default apps
        terminal    = "wezterm";
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

        # TODO: Found a good key for these
        "Mod4+Shift+i" = "split h";
        "Mod4+Shift+." = "split v";

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
    };
  };
}

