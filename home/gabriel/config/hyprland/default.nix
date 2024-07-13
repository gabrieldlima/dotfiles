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
}: {
  imports = [
    ./binds.nix
  ];

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
        "col.active_border" = "$blue";
        "col.inactive_border" = "$base";
        "col.nogroup_border_active" = "$blue";
        "col.nogroup_border" = "$base";
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
        "col.shadow" = "$base";
        "col.shadow_inactive" = "$base";
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
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];
        animation = [
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "workspaces,1,2,easeoutback,slide"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
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
        "col.border_active" = "$red";
        "col.border_inactive" = "$base";
        "col.border_locked_active" = "$red";
        "col.border_locked_inactive" = "$base";

        groupbar = {
          enabled = true;
          font_family = "FiraCode Nerd Font Bold";
          font_size = 10;
          gradients = true;
          height = 15;
          priority = 3;
          render_titles = true;
          scrolling = true;
          text_color = "$text";
          "col.active" = "$red";
          "col.inactive" = "$base";
          "col.locked_active" = "$red";
          "col.locked_inactive" = "$base";
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
        background_color = "$base";
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
        new_on_top = true;
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

      # Theme: Catppuccin Mocha
      # ========================================================================
      "$rosewater" = "0xfff5e0dc";
      "$flamingo"  = "0xfff2cdcd";
      "$pink"      = "0xfff5c2e7";
      "$mauve"     = "0xffcba6f7";
      "$red"       = "0xfff38ba8";
      "$maroon"    = "0xffeba0ac";
      "$peach"     = "0xfffab387";
      "$yellow"    = "0xfff9e2af";
      "$green"     = "0xffa6e3a1";
      "$teal"      = "0xff94e2d5";
      "$sky"       = "0xff89dceb";
      "$sapphire"  = "0xff74c7ec";
      "$blue"      = "0xff89b4fa";
      "$lavender"  = "0xffb4befe";
      "$text"      = "0xffcdd6f4";
      "$subtext1"  = "0xffbac2de";
      "$subtext0"  = "0xffa6adc8";
      "$overlay2"  = "0xff9399b2";
      "$overlay1"  = "0xff7f849c";
      "$overlay0"  = "0xff6c7086";
      "$surface2"  = "0xff585b70";
      "$surface1"  = "0xff45475a";
      "$surface0"  = "0xff313244";
      "$base"      = "0xff010101";
      "$mantle"    = "0xff181825";
      "$crust"     = "0xff11111b";
    };
  };
}
