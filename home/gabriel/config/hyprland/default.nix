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
      # Autostart applications
      # ========================================================================
      exec-once = [
        "swww-daemon"
        "openrgb -d 0 -m off && openrgb -d 1 -m off"
      ];

      # Monitors
      # ========================================================================
      monitor = "HDMI-A-2,1920x1080@60,0x0,1";

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
          xray = true;
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

      # Variables
      "$browser" = "qutebrowser";
      "$launcher" = "rofi -show drun";
      "$terminal" = "alacritty";

      # Set the modKey
      "$modKey" = "SUPER";

      bind = [
        "$modKey, RETURN, exec, $terminal"
        "$modKey, B,      exec, $browser"
        "$modKey, P,      exec, $launcher"

        # closes (not kills) the active window
        "$modKey SHIFT, C,     killactive"
        # exits the compositor with no questions asked.
        "$modKey SHIFT, Q,     exit"
        # toggles the focused window’s fullscreen state
        "$modKey,       F,     fullscreen"
        # toggles the current window’s floating state
        "$modKey,       SPACE, togglefloating"
        # center the active window note: floating only
        "$modKey SHIFT, SPACE, centerwindow"

        # toggles the current active window into a group
        "$modKey, g, togglegroup"

        # switches to the next window in a group
        "$modKey CONTROL, p, changegroupactive, b"
        "$modKey CONTROL, n, changegroupactive, f"

        # Move focus with $modKey + hjkl
        "$modKey, h, movefocus, l"
        "$modKey, l, movefocus, r"
        "$modKey, k, movefocus, u"
        "$modKey, j, movefocus, d"

        # Move windows with $modKey + SHIFT + hjkl
        "$modKey SHIFT, h, movewindow, l"
        "$modKey SHIFT, l, movewindow, r"
        "$modKey SHIFT, k, movewindow, u"
        "$modKey SHIFT, j, movewindow, d"

        # Resize windows with $modKey + ALT + hjkl
        "$modKey CONTROL, h, resizeactive, -50 0"
        "$modKey CONTROL, l, resizeactive, 50 0"
        "$modKey CONTROL, k, resizeactive, 0 -50"
        "$modKey CONTROL, j, resizeactive, 0 50"

        # swaps the current window with master. If the current window is the master, swaps it with the first child.
        "$modKey SHIFT, RETURN, layoutmsg, swapwithmaster"

        # Switch workspaces with modKey + [0-9]
        "$modKey, 1, workspace, 1"
        "$modKey, 2, workspace, 2"
        "$modKey, 3, workspace, 3"
        "$modKey, 4, workspace, 4"
        "$modKey, 5, workspace, 5"
        "$modKey, 6, workspace, 6"
        "$modKey, 7, workspace, 7"
        "$modKey, 8, workspace, 8"
        "$modKey, 9, workspace, 9"
        "$modKey, 0, workspace, 10"

        # Move active window to a workspace with modKey + SHIFT + [0-9]
        "$modKey SHIFT, 1, movetoworkspacesilent, 1"
        "$modKey SHIFT, 2, movetoworkspacesilent, 2"
        "$modKey SHIFT, 3, movetoworkspacesilent, 3"
        "$modKey SHIFT, 4, movetoworkspacesilent, 4"
        "$modKey SHIFT, 5, movetoworkspacesilent, 5"
        "$modKey SHIFT, 6, movetoworkspacesilent, 6"
        "$modKey SHIFT, 7, movetoworkspacesilent, 7"
        "$modKey SHIFT, 8, movetoworkspacesilent, 8"
        "$modKey SHIFT, 9, movetoworkspacesilent, 9"
        "$modKey SHIFT, 0, movetoworkspacesilent, 10"

        # Change focus to another window, bring it to the top
        "$modKey, Tab, cyclenext"
        "$modKey, Tab, bringactivetotop"
        "$modKey SHIFT, Tab, cyclenext, prev"
        "$modKey SHIFT, Tab, bringactivetotop"


        # Scroll through workspaces with $modKey + mouse sideup/sidedown
        "$modKey, mouse:276, workspace, +1"
        "$modKey, mouse:275, workspace, -1"

        # Scroll through existing workspaces with $modKey + scroll
        "$modKey, mouse_down, workspace, e+1"
        "$modKey, mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows with modKey + LMB/RMB and dragging
        "$modKey, mouse:272, movewindow"
        "$modKey, mouse:273, resizewindow"
      ];
    };
  };
}
