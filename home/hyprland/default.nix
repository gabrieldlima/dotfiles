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
  config,
  ...
}: let
  # ====================================================================== #
  # COLORS                                                                 #
  # ====================================================================== #
  red        = "rgba(cc241dff)";
  blue       = "rgba(458588ff)";
  foreground = "rgba(f9f5d7ff)";
  background = "rgba(000000ff)";

  # ====================================================================== #
  # DEFAULT APPS                                                           #
  # ====================================================================== #
  browser  = "qutebrowser";
  launcher = "rofi -show drun";
  terminal = "alacritty";
  editor   = "alacritty -e yazi";

  # ====================================================================== #
  # MODKEYS                                                                #
  # ====================================================================== #
  modM = "SUPER";
  modS = "SUPER + SHIFT";
  modC = "SUPER + CONTROL";
  modA = "SUPER + ALT";
in {
  # ====================================================================== #
  # IMPORTS                                                                #
  # ====================================================================== #
  imports = [
   ../waybar
  ];

  # ====================================================================== #
  # WAYLAND-ONLY PACKAGES                                                  #
  # ====================================================================== #
  home.packages = [
    pkgs.hyprpicker
    pkgs.swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    extraConfig = ''
      env = ELECTRON_OZONE_PLATFORM_HINT,wayland
    '';

    settings = {
      # ====================================================================== #
      # MONITORS                                                               #
      # ====================================================================== #
      monitor = "DP-2,2560x1440@170,0x0,1";

      # ====================================================================== #
      # AUTOSTART                                                              #
      # ====================================================================== #
      exec-once = [
        "waybar"
        "swww-daemon"
      ];

      execr = [
        "swww img ${config.home.homeDirectory}/pictures/wallpapers/wallpaper.png"
      ];

      # ====================================================================== #
      # MASTER LAYOUT                                                          #
      # ====================================================================== #
      master = {
        mfact      = 0.5;
        new_status = "inherit";
        new_on_top = false;
        new_on_active = "after";
      };

      # ====================================================================== #
      # GENERAL                                                                #
      # ====================================================================== #
      general = {
        border_size                 = 2;
        gaps_in                     = 5;
        gaps_out                    = 10;
        "col.active_border"         = "${blue}";
        "col.inactive_border"       = "${background}";
        "col.nogroup_border"        = "${background}";
        "col.nogroup_border_active" = "${blue}";
        layout                      = "master";
      };

      # ====================================================================== #
      # DECORATION                                                             #
      # ====================================================================== #
      decoration = {
        rounding = 0;
        blur = {
          enabled = false;
        };
      };

      # ====================================================================== #
      # ANIMATIONS                                                             #
      # ====================================================================== #
      animations = {
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 0, 10, default"
          "border, 0, 5.39, easeOutQuint"
          "windows, 0, 4.79, easeOutQuint"
          "windowsIn, 0, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 0, 1.49, linear, popin 87%"
          "fadeIn, 0, 1.73, almostLinear"
          "fadeOut, 0, 1.46, almostLinear"
          "fade, 0, 3.03, quick"
          "layers, 0, 3.81, easeOutQuint"
          "layersIn, 0, 4, easeOutQuint, fade"
          "layersOut, 0, 1.5, linear, fade"
          "fadeLayersIn, 0, 1.79, almostLinear"
          "fadeLayersOut, 0, 1.39, almostLinear"
          "workspaces, 0, 1.94, almostLinear, fade"
          "workspacesIn, 0, 1.21, almostLinear, fade"
          "workspacesOut, 0, 1.94, almostLinear, fade"
        ];
      };

      # ====================================================================== #
      # INPUT                                                                  #
      # ====================================================================== #
      input = {
        # kb_options = "caps:ctrl_modifier";
        kb_options = "caps:swapescape";
      };

      # ====================================================================== #
      # MISC                                                                   #
      # ====================================================================== #
      misc = {
        font_family = "Iosevka";
        focus_on_activate = false;
      };

      # ====================================================================== #
      # WINDOW RULES                                                           #
      # ====================================================================== #
      windowrulev2 = [
        "workspace 2 silent, class:(org.qutebrowser.qutebrowser)"
        "workspace 2 silent, class:(brave-browser)"

        "workspace 3 silent, class:(obsidian)"

        "workspace 8 silent, class:(discord)"

        "workspace 9 silent, class:(steam)"
        "float, class:(steam)"

        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      # ====================================================================== #
      # WORKSPACES RULES                                                       #
      # ====================================================================== #
      workspace = [
        "9, gapsin:0, gapsout:0, shadow:false, rounding:false, decorate:false"
      ];

      # ====================================================================== #
      # BINDS (KEYBOARD)                                                       #
      # ====================================================================== #
      bind = [
        "${modM}, RETURN, exec, ${terminal}"
        "${modM}, P , exec, ${launcher}"
        "${modM}, B , exec, ${browser}"
        "${modM}, E , exec, ${editor}"

        "${modS}, Q, exit"
        "${modC}, R, exec, hyprctl reload"

        "${modS}, C, killactive"
        "${modM}, F, fullscreen, 0"
        "${modM}, M, fullscreen, 1"
        "${modM}, SPACE, togglefloating"
        "${modS}, SPACE, centerwindow, none"
        "${modM}, U, focusurgentorlast"
        "${modS}, COMMA, movetoworkspacesilent, special"
        "${modM}, COMMA, togglespecialworkspace"

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

        "${modS}, 1, movetoworkspacesilent, 1"
        "${modS}, 2, movetoworkspacesilent, 2"
        "${modS}, 3, movetoworkspacesilent, 3"
        "${modS}, 4, movetoworkspacesilent, 4"
        "${modS}, 5, movetoworkspacesilent, 5"
        "${modS}, 6, movetoworkspacesilent, 6"
        "${modS}, 7, movetoworkspacesilent, 7"
        "${modS}, 8, movetoworkspacesilent, 8"
        "${modS}, 9, movetoworkspacesilent, 9"

        "${modS}, RETURN, layoutmsg, swapwithmaster"
      ];

      binde = [
        "${modC}, h, resizeactive, -50 0"
        "${modC}, l, resizeactive, 50 0"
        "${modC}, k, resizeactive, 0 -50"
        "${modC}, j, resizeactive, 0 50"
      ];

      # ====================================================================== #
      # BINDS (MOUSE)                                                          #
      # ====================================================================== #
      bindm = [
        "${modM}, mouse:272, movewindow"
        "${modM}, mouse:273, resizewindow"
      ];
    };
  };
}
