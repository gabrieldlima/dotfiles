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
  # Theme: Catppuccin Mocha
  # ========================================================================
  rosewater = "0xfff5e0dc";
  flamingo  = "0xfff2cdcd";
  pink      = "0xfff5c2e7";
  mauve     = "0xffcba6f7";
  red       = "0xfff38ba8";
  maroon    = "0xffeba0ac";
  peach     = "0xfffab387";
  yellow    = "0xfff9e2af";
  green     = "0xffa6e3a1";
  teal      = "0xff94e2d5";
  sky       = "0xff89dceb";
  sapphire  = "0xff74c7ec";
  blue      = "0xff89b4fa";
  lavender  = "0xffb4befe";
  text      = "0xffcdd6f4";
  subtext1  = "0xffbac2de";
  subtext0  = "0xffa6adc8";
  overlay2  = "0xff9399b2";
  overlay1  = "0xff7f849c";
  overlay0  = "0xff6c7086";
  surface2  = "0xff585b70";
  surface1  = "0xff45475a";
  surface0  = "0xff313244";
  base      = "0xff010101";
  mantle    = "0xff181825";
  crust     = "0xff11111b";
in {
  home.packages = with pkgs; [
    hyprpicker
    rofi-wayland
    socat
    swww
    xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    settings = {
      # Monitors
      # ========================================================================
      monitor = "HDMI-A-2,1920x1080@60,0x0,1";

      # Autostart applications
      # ========================================================================
      exec-once = [
        "swww-daemon"
        "openrgb -d 0 -m off && openrgb -d 1 -m off"
      ];
      exec = [ ];

      # General
      # ========================================================================
      general = {
        border_size = 3;
        no_border_on_floating = false;
        gaps_in = 5;
        gaps_out = 10;
        gaps_workspaces = 0;
        "col.active_border" = "${blue}";
        "col.inactive_border" = "${base}";
        "col.nogroup_border_active" = "${blue}";
        "col.nogroup_border" = "${base}";
        layout = "master";
        no_focus_fallback = true;
        apply_sens_to_raw = false;
        resize_on_border = true;
        extend_border_grab_area = 0;
        hover_icon_on_border = true;
        allow_tearing = false;
        resize_corner = 0;
      };

      # Decoration
      # ========================================================================
      decoration = {
        rounding = 5;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 5;
        shadow_render_power = 3;
        shadow_ignore_window = true;
        "col.shadow" = "${base}";
        "col.shadow_inactive" = "${base}";
        shadow_offset = "0, 0";
        shadow_scale = 1.0;
        dim_inactive = false;
        dim_strength = 0.5;
        dim_special = 0.2;
        dim_around = 0.4;
        screen_shader = "";

        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          ignore_opacity = false;
          new_optimizations = true;
          xray = false;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0;
          special = false;
          popups = false;
          popups_ignorealpha = 0.2;
        };
      };

      # Animations
      # ========================================================================
      animations = {
        enabled = true;
        first_launch_animation = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Input
      # ========================================================================
      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
        numlock_by_default = false;
        repeat_rate = 25;
        repeat_delay = 600;
        sensitivity = 0;
        force_no_accel = false;
        left_handed = false;
        scroll_button = 0;
        scroll_button_lock = false;
        natural_scroll = false;
        follow_mouse = 1;
        mouse_refocus = true;
        float_switch_override_focus = 1;
      };

      # Gestures
      # ========================================================================
      gestures = {
        workspace_swipe = false;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 300;
        workspace_swipe_touch = false;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_direction_lock = true;
        workspace_swipe_direction_lock_threshold = 10;
        workspace_swipe_forever = false;
        workspace_swipe_use_r = false;
      };

      # Group
      # ========================================================================
      group = {
        insert_after_current = true;
        focus_removed_window = true;
        "col.border_active" = "${red}";
        "col.border_inactive" = "${base}";
        "col.border_locked_active" = "${red}";
        "col.border_locked_inactive" = "${base}";

        groupbar = {
          enabled = true;
          font_family = "FiraCode Nerd Font Bold";
          font_size = 10;
          gradients = true;
          height = 15;
          priority = 3;
          render_titles = true;
          scrolling = true;
          text_color = "${text}";
          "col.active" = "${red}";
          "col.inactive" = "${base}";
          "col.locked_active" = "${red}";
          "col.locked_inactive" = "${base}";
        };
      };

      # Misc
      # ========================================================================
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = false;
        force_default_wallpaper = -1;
        vfr = true;
        vrr = 0;
        mouse_move_enables_dpms = false;
        key_press_enables_dpms = false;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        disable_autoreload = false;
        enable_swallow = false;
        focus_on_activate = false;
        no_direct_scanout = true;
        mouse_move_focuses_monitor = true;
        render_ahead_of_time = false;
        render_ahead_safezone = 1;
        allow_session_lock_restore = false;
        background_color = "${base}";
        close_special_on_empty = true;
        new_window_takes_over_fullscreen = 0;
      };

      # XWayland
      # ========================================================================
      xwayland = {
        use_nearest_neighbor = true;
        force_zero_scaling = false;
      };

      # Master layout
      # ========================================================================
      master = {
        allow_small_split = false;
        special_scale_factor = 0.5;
        mfact = 0.5;
        new_status = "master";
        new_on_top = false;
        no_gaps_when_only = 0;
        orientation = "left";
        inherit_fullscreen = true;
        always_center_master = false;
        smart_resizing = true;
        drop_at_cursor = true;
      };

      # Windows rules
      # ========================================================================
      windowrulev2 = [
        "workspace 2,class:(org.qutebrowser.qutebrowser)"
        "workspace 3,class:(obsidian)"
        "workspace 9,class:(virt-manager)"
      ];

      # Variables
      # ========================================================================
      "$browser"     = "qutebrowser";
      "$launcher"    = "rofi -show drun";
      "$terminal"    = "alacritty";
      "$fileManager" = "alacritty -e yazi";

      "$mod"        = "SUPER";
      "$modShift"   = "SUPER + SHIFT";
      "$modControl" = "SUPER + CONTROL";
      "$modAlt"     = "SUPER + ALT";

      # Keybinds
      # ========================================================================
      binds = {
        pass_mouse_when_bound = false;
        scroll_event_delay = 300;
        workspace_back_and_forth = false;
        allow_workspace_cycles = false;
        workspace_center_on = 0;
        focus_preferred_method = 0;
        ignore_group_lock = false;
        movefocus_cycles_fullscreen = true;
        disable_keybind_grabbing = false;
      };

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, B, exec, $browser"
        "$mod, P, exec, $launcher"
        "$mod, E, exec, $fileManager"

        "$modShift, C, killactive"
        "$modShift, Q, exit"
        "$modControl, R, exec, hyprctl reload"
        "$modControl, X, exec, hyprctl kill"

        "$mod, F, fullscreen, 0"
        "$mod, M, fullscreen, 1"

        "$modShift, F, togglefloating"
        "$mod, SPACE, centerwindow"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$modShift, h, movewindow, l"
        "$modShift, l, movewindow, r"
        "$modShift, k, movewindow, u"
        "$modShift, j, movewindow, d"

        "$modControl, h, resizeactive, -50 0"
        "$modControl, l, resizeactive, 50 0"
        "$modControl, k, resizeactive, 0 -50"
        "$modControl, j, resizeactive, 0 50"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        "$modShift, 1, movetoworkspacesilent, 1"
        "$modShift, 2, movetoworkspacesilent, 2"
        "$modShift, 3, movetoworkspacesilent, 3"
        "$modShift, 4, movetoworkspacesilent, 4"
        "$modShift, 5, movetoworkspacesilent, 5"
        "$modShift, 6, movetoworkspacesilent, 6"
        "$modShift, 7, movetoworkspacesilent, 7"
        "$modShift, 8, movetoworkspacesilent, 8"
        "$modShift, 9, movetoworkspacesilent, 9"

        "$modShift, RETURN, layoutmsg, swapwithmaster"

        "$mod, mouse:276, workspace, +1"
        "$mod, mouse:275, workspace, -1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
