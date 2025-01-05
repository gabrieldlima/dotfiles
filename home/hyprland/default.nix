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
    ./binds.nix
  ];

  home.packages = with pkgs; [
    hyprpicker
    socat
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    extraConfig = ''
      env = GDK_BACKEND,wayland,x11,*
      env = QT_QPA_PLATFORM,wayland;xcb
      env = SDL_VIDEODRIVER,wayland
      env = CLUTTER_BACKEND,wayland

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland

      # env = QT_AUTO_SCREEN_SCALE_FACTOR,1
      # env = QT_QPA_PLATFORM,wayland;xcb
      # env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
      # env = QT_QPA_PLATFORMTHEME,qt5ct
    '';

    settings = {
      # Monitors
      # ========================================================================
      monitor = "HDMI-A-1,1920x1080@60,0x0,1";

      # Autostart applications
      # ========================================================================
      exec-once = [
        "swww-daemon"
      ];
      exec = [ ];

      # General
      # ========================================================================
      general = {
        border_size = 2;
        no_border_on_floating = false;
        gaps_in = 5;
        gaps_out = 10;
        gaps_workspaces = 0;
        "col.active_border" = "${blue}";
        "col.inactive_border" = "${base}";
        "col.nogroup_border" = "${base}";
        "col.nogroup_border_active" = "${blue}";
        layout = "master";
        no_focus_fallback = true;
        resize_on_border = true;
        extend_border_grab_area = 0;
        hover_icon_on_border = true;
        allow_tearing = false;
        resize_corner = 0;

        snap = {
          enabled = false;
          window_gap = 10;
          monitor_gap = 10;
          border_overlap = false;
        };
      };

      # Decoration
      # ========================================================================
      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        dim_inactive = false;
        dim_strength = 0.5;
        dim_special = 0.2;
        dim_around = 0.4;
        screen_shader = "";

        blur = {
          enabled = false;
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
          input_methods = false;
          input_methods_ignorealpha = 0.2;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          sharp = false;
          ignore_window = true;
          color = "0xee1a1a1a";
          offset = "0, 0";
          scale = 1.0;
        };
      };

      # Animations
      # ========================================================================
      animations = {
        enabled = true;
        first_launch_animation = true;
        animation = [
          "windows, 1, 3, default"
          "windowsIn, 1, 3, default"
          "windowsOut, 1, 3, default"
          "windowsMove, 1, 3, default"

          "layers, 1, 3, default"
          "layersIn, 1, 3, default"
          "layersOut, 1, 3, default"

          "fade, 0"

          "border, 0"
          "borderangle, 0"

          "workspaces, 1, 3, default"
        ];
      };

      # Input
      # ========================================================================
      input = {
        kb_model = "";
        kb_layout = "us";
        kb_variant = "";
        kb_options = "caps:swapescape";
        kb_rules = "";
        kb_file = "";
        numlock_by_default = false;
        resolve_binds_by_sym = false;
        repeat_rate = 25;
        repeat_delay = 600;
        sensitivity = 0;
        accel_profile = "";
        force_no_accel = false;
        left_handed = false;
        scroll_points = "";
        scroll_method = "";
        scroll_button = 0;
        scroll_button_lock = 0;
        scroll_factor = 1;
        natural_scroll = false;
        follow_mouse = 1;
        mouse_refocus = true;
        focus_on_close = 0;
        float_switch_override_focus = 1;
        special_fallthrough = false;
        off_window_axis_events = 1;
        emulate_discrete_scroll = 1;
      };

      # Group
      # ========================================================================
      group = {
        auto_group = true;
        insert_after_current = true;
        focus_removed_window = true;
        drag_into_group = 1;
        merge_groups_on_drag = true;
        merge_groups_on_groupbar = true;
        merge_floated_into_tiled_on_groupbar = false;
        group_on_movetoworkspace = false;
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
          stacked = false;
          priority = 3;
          render_titles = true;
          scrolling = true;
          "text_color" = "${text}";
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
        "col.splash" = "${text}";
        font_family = "FiraCode Nerd Font Bold";
        splash_font_family = "FiraCode Nerd Font Bold";
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
        swallow_regex = "";
        swallow_exception_regex = "";
        focus_on_activate = false;
        mouse_move_focuses_monitor = true;
        render_ahead_of_time = false;
        render_ahead_safezone = 1;
        allow_session_lock_restore = false;
        "background_color" = "${base}";
        close_special_on_empty = true;
        new_window_takes_over_fullscreen = 0;
        exit_window_retains_fullscreen = false;
        initial_workspace_tracking = 1;
        middle_click_paste = true;
        render_unfocused_fps = 15;
        disable_xdg_env_checks = false;
        disable_hyprland_qtutils_check = false;
        lockdead_screen_delay = 1000;
      };

      # XWayland
      # ========================================================================
      xwayland = {
        enabled = true;
        use_nearest_neighbor = true;
        force_zero_scaling = false;
      };

      # OpenGL (Nvidia-only)
      # ========================================================================
      opengl = {
        nvidia_anti_flicker = true;
        force_introspection = 2;
      };

      # Render
      # ========================================================================
      render = {
        explicit_sync = 2;
        explicit_sync_kms = 2;
        direct_scanout = false;
        expand_undersized_textures = true;
      };

      # Cursor
      # ========================================================================
      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2;
        no_break_fs_vrr = false;
        min_refresh_rate = 24;
        hotspot_padding = 1;
        inactive_timeout = 0;
        no_warps = false;
        persistent_warps = false;
        warp_on_change_workspace = 0;
        default_monitor = "";
        zoom_factor = 1.0;
        zoom_rigid = false;
        enable_hyprcursor = true;
        hide_on_key_press = false;
        hide_on_touch = true;
        use_cpu_buffer = false;
        warp_back_after_non_mouse_input = false;
      };

      # Ecosystem
      # ========================================================================
      ecosystem = {
        no_update_news = false;
      };

      # Master layout
      # ========================================================================
      master = {
        allow_small_split = false;
        special_scale_factor = 0.5;
        mfact = 0.5;
        new_status = "master";
        new_on_top = false;
        new_on_active = "none";
        orientation = "left";
        inherit_fullscreen = true;
        always_center_master = false;
        smart_resizing = true;
        drop_at_cursor = true;
      };

      # Windows rules
      # ========================================================================
      windowrulev2 = [
        "workspace 2, class:(org.qutebrowser.qutebrowser)"
        "workspace 3, class:(obsidian)"
        "workspace 8, class:(.virt-manager-wrapped)"

        "workspace 9, class:(steam)"
        "float, class:(steam)"
      ];

      workspace = [
        # gaming workspace rules
        "9, gapsin:0, gapsout:0, bordersize:0, border:false, shadow:false, rounding:false, decorate:false"
      ];
    };
  };
}
