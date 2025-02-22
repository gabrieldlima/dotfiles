# ╔═══════════════════════════════════════════════════════════════════╗
# ║██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ ║
# ║██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗║
# ║███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║║
# ║██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║║
# ║██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝║
# ║╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ║
# ╚═══════════════════════════════════════════════════════════════════╝

{
  pkgs,
  ...
}: let
  red  = "rgba(f38ba8ff)";
  blue = "rgba(89b4faff)";
  text = "rgba(cdd6f4ff)";
  base = "rgba(000000ff)";
in {
  imports = [
    ../waybar
  ];

  home.packages = with pkgs; [
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # ====================================================================== #
      # MONITORS                                                               #
      # ====================================================================== #
      monitor = "HDMI-A-1,1920x1080@60,0x0,1";

      # ====================================================================== #
      # AUTOSTART                                                              #
      # ====================================================================== #
      exec-once = [
        "swww-daemon"
        "waybar"
      ];

      # ====================================================================== #
      # MASTER LAYOUT                                                          #
      # ====================================================================== #
      master = {
        mfact      = 0.5;
        new_status = "master";
        new_on_top = true;
      };

      # ====================================================================== #
      # GENERAL                                                                #
      # ====================================================================== #
      general = {
        border_size                 = 2;
        "col.active_border"         = "${blue}";
        "col.inactive_border"       = "${base}";
        "col.nogroup_border"        = "${base}";
        "col.nogroup_border_active" = "${blue}";
        layout                      = "master";
      };

      # ====================================================================== #
      # INPUT                                                                  #
      # ====================================================================== #
      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
      };

      # ====================================================================== #
      # WINDOW RULES                                                           #
      # ====================================================================== #
      windowrulev2 = [
        "workspace 2, class:(org.qutebrowser.qutebrowser)"

        "workspace 3, class:(obsidian)"

        "workspace 8, class:(discord)"

        "workspace 9, class:(steam)"
        "float, class:(steam)"
      ];

      # ====================================================================== #
      # WORKSPACES RULES                                                       #
      # ====================================================================== #
      workspace = [
        "9, gapsin:0, gapsout:0, bordersize:0, border:false, shadow:false, rounding:false, decorate:false"
      ];

      # ====================================================================== #
      # BINDS                                                                  #
      # ====================================================================== #
      bind = let
        browser  = "qutebrowser";
        launcher = "rofi -show drun";
        terminal = "ghostty";

        modM = "SUPER";
        modS = "SUPER + SHIFT";
        modC = "SUPER + CONTROL";
        modA = "SUPER + ALT";
      in [
        "${modM}, RETURN, exec, ${terminal}"
        "${modM}, R , exec, ${launcher}"
        "${modM}, B , exec, ${browser}"

        "${modS}, Q, exit"
        "${modC}, R, exec, hyprctl reload"

        "${modS}, C, killactive"
        "${modM}, F, fullscreen, 0"
        "${modM}, M, fullscreen, 1"
        "${modM}, SPACE, togglefloating"

        "${modM}, h, movefocus, l"
        "${modM}, l, movefocus, r"
        "${modM}, k, movefocus, u"
        "${modM}, j, movefocus, d"

        "${modS}, h, movewindow, l"
        "${modS}, l, movewindow, r"
        "${modS}, k, movewindow, u"
        "${modS}, j, movewindow, d"

        "${modM}, 1, workspace, 1"
        "${modM}, 2, workspace, 2"
        "${modM}, 3, workspace, 3"
        "${modM}, 4, workspace, 4"
        "${modM}, 5, workspace, 5"
        "${modM}, 6, workspace, 6"
        "${modM}, 7, workspace, 7"
        "${modM}, 8, workspace, 8"
        "${modM}, 9, workspace, 9"

        "${modS}, 1, movetoworkspace, 1"
        "${modS}, 2, movetoworkspace, 2"
        "${modS}, 3, movetoworkspace, 3"
        "${modS}, 4, movetoworkspace, 4"
        "${modS}, 5, movetoworkspace, 5"
        "${modS}, 6, movetoworkspace, 6"
        "${modS}, 7, movetoworkspace, 7"
        "${modS}, 8, movetoworkspace, 8"
        "${modS}, 9, movetoworkspace, 9"

        "${modS}, RETURN, layoutmsg, swapwithmaster"
      ];
    };

    extraConfig = ''
      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24


      #####################
      ### LOOK AND FEEL ###
      #####################
      decoration {
          rounding = 10
          rounding_power = 2

          # Change transparency of focused and unfocused windows
          active_opacity = 1.0
          inactive_opacity = 1.0

          shadow {
              enabled = true
              range = 4
              render_power = 3
              color = rgba(1a1a1aee)
          }

          blur {
              enabled = true
              size = 3
              passes = 1

              vibrancy = 0.1696
          }
      }

      animations {
          enabled = yes, please :)

          bezier = easeOutQuint,0.23,1,0.32,1
          bezier = easeInOutCubic,0.65,0.05,0.36,1
          bezier = linear,0,0,1,1
          bezier = almostLinear,0.5,0.5,0.75,1.0
          bezier = quick,0.15,0,0.1,1

          animation = global, 1, 10, default
          animation = border, 1, 5.39, easeOutQuint
          animation = windows, 1, 4.79, easeOutQuint
          animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
          animation = windowsOut, 1, 1.49, linear, popin 87%
          animation = fadeIn, 1, 1.73, almostLinear
          animation = fadeOut, 1, 1.46, almostLinear
          animation = fade, 1, 3.03, quick
          animation = layers, 1, 3.81, easeOutQuint
          animation = layersIn, 1, 4, easeOutQuint, fade
          animation = layersOut, 1, 1.5, linear, fade
          animation = fadeLayersIn, 1, 1.79, almostLinear
          animation = fadeLayersOut, 1, 1.39, almostLinear
          animation = workspaces, 1, 1.94, almostLinear, fade
          animation = workspacesIn, 1, 1.21, almostLinear, fade
          animation = workspacesOut, 1, 1.94, almostLinear, fade
      }

      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # You probably want this
      }

      misc {
          force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
      }

      gestures {
          workspace_swipe = false
      }

      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }

      # Example special workspace (scratchpad)
      bind = SUPER, S, togglespecialworkspace, magic
      bind = SUPER SHIFT, S, movetoworkspace, special:magic

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow
      #

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################
      # Example windowrule v1
      # windowrule = float, ^(kitty)$

      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      # Ignore maximize requests from apps. You'll probably like this.
      windowrulev2 = suppressevent maximize, class:.*

      # Fix some dragging issues with XWayland
      windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
    '';
  };
}
