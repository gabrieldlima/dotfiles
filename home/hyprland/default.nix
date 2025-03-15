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
  # ====================================================================== #
  # COLORS                                                                 #
  # ====================================================================== #
  red  = "rgba(f38ba8ff)";
  blue = "rgba(89b4faff)";
  text = "rgba(cdd6f4ff)";
  base = "rgba(000000ff)";

  # ====================================================================== #
  # DEFAULT APPS                                                           #
  # ====================================================================== #
  browser  = "qutebrowser";
  launcher = "rofi -show drun";
  terminal = "ghostty";

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
    # ../waybar
  ];

  # ====================================================================== #
  # WAYLAND-ONLY PACKAGES                                                  #
  # ====================================================================== #
  home.packages = [
    pkgs.swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # ====================================================================== #
      # MONITORS                                                               #
      # ====================================================================== #
      monitor="DP-2,2560x1440@170,0x0,1";

      # ====================================================================== #
      # AUTOSTART                                                              #
      # ====================================================================== #
      exec-once = [
        "swww-daemon"
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
        gaps_in                     = 5;
        gaps_out                    = 10;
        "col.active_border"         = "${blue}";
        "col.inactive_border"       = "${base}";
        "col.nogroup_border"        = "${base}";
        "col.nogroup_border_active" = "${blue}";
        layout                      = "master";
      };

      # ====================================================================== #
      # DECORATION                                                             #
      # ====================================================================== #
      decoration = {
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
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # ====================================================================== #
      # INPUT                                                                  #
      # ====================================================================== #
      input = {
        kb_options = "caps:swapescape";
      };

      # ====================================================================== #
      # MISC                                                                   #
      # ====================================================================== #
      misc = {
        font_family = "JetBrains Mono";
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
