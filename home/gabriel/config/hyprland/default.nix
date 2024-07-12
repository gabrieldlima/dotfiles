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
    package = pkgs.hyprland; # Version: 0.40.0-unstable-2024-05-05
    xwayland.enable = true;

    settings = {
      ###############################################################################
      # Autostart applications
      ###############################################################################
      # will execute only on launch
      exec-once = [
        "swww-daemon"
        "openrgb -d 0 -m off && openrgb -d 1 -m off"
      ];

      ###############################################################################
      # Monitors
      ###############################################################################
      monitor = "HDMI-A-2,1920x1080@60,0x0,1";

      ###############################################################################
      # General
      ###############################################################################
      general = {
        # size of border around windows
        border_size = 3;
        # disable borders for floating windows
        no_border_on_floating = false;
        # gaps between windows
        gaps_in = 5;
        # gaps between windows and monitor edges
        gaps_out = 10;
        # border color for the active window
        "col.active_border" = "$blue";
        # border color for inactive windows
        "col.inactive_border" = "$base";
        # in seconds, after how many seconds of cursor’s inactivity to hide it. Set to 0 for never
        # cursor_inactive_timeout = 0;
        # which layout to use. (Available: dwindle, master)
        layout = "master";
        # if true, will not warp the cursor in many cases (focusing, keybinds, etc)
        # no_cursor_warps = true;
        # if true, will not fall back to the next available window when moving focus in a direction where no window was found
        no_focus_fallback = true;
        # if on, will also apply the sensitivity to raw mouse output (e.g. sensitivity in games) NOTICE: really not recommended
        apply_sens_to_raw = false;
        # enables resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true;
        # extends the area around the border where you can click and drag on, only used when general:resize_on_border is on
        extend_border_grab_area = 0;
        # show a cursor icon when hovering over borders, only used when general:resize_on_border is on
        hover_icon_on_border = true;
        # master switch for allowing tearing to occur
        allow_tearing = false;
      };

      ###############################################################################
      # Decoration
      ###############################################################################
      decoration = {
        # rounded corners’ radius (in layout px)
        rounding = 5;
        # opacity of active windows. (0.0 - 1.0)
        active_opacity = 1.0;
        # opacity of inactive windows. (0.0 - 1.0)
        inactive_opacity = 1.0;
        # opacity of fullscreen windows. (0.0 - 1.0)
        fullscreen_opacity = 1.0;
        # enable drop shadows on windows
        drop_shadow = true;
        # Shadow range (“size”) in layout px
        shadow_range = 5;
        # (1 - 4), in what power to render the falloff (more power, the faster the falloff)
        shadow_render_power = 3;
        # if true, the shadow will not be rendered behind the window itself, only around it
        shadow_ignore_window = true;
        # shadow’s color. Alpha dictates shadow’s opacity
        "col.shadow" = "$base";
        # shadow’s rendering offset.
        shadow_offset = "0, 0";
        # shadow’s scale. 0.0 - 1.0
        shadow_scale = 1.0;
        # enables dimming of inactive windows
        dim_inactive = false;
        # how much inactive windows should be dimmed, 0.0 - 1.0
        dim_strength = 0.5;
        # how much to dim the rest of the screen by when a special workspace is open. 0.0 - 1.0
        dim_special = 0.2;
        # how much the dimaround window rule should dim by. 0.0 - 1.0
        dim_around = 0.4;
        # a path to a custom shader to be applied at the end of rendering
        screen_shader = "";

        blur = {
          # enable kawase window background blur
          enabled = true;
          # blur size (distance)
          size = 3;
          # the amount of passes to perform
          passes = 1;
          # make the blur layer ignore the opacity of the window
          ignore_opacity = false;
          # whether to enable further optimizations to the blur. Recommended to leave on, as it will massively improve performance
          new_optimizations = true;
          # if enabled, floating windows will ignore tiled windows in their blur. Only available if blur_new_optimizations is true. Will reduce overhead on floating blur significantly
          xray = true;
          # how much noise to apply. 0.0 - 1.0
          noise = 0.0117;
          # contrast modulation for blur. 0.0 - 2.0
          contrast = 0.8916;
          # brightness modulation for blur. 0.0 - 2.0
          brightness = 0.8172;
          # increase saturation of blurred colors. 0.0 - 1.0
          vibrancy = 0;
          # how strong the effect of vibrancy is on dark areas . 0.0 - 1.0
          vibrancy_darkness = 0;
          # whether to blur behind the special workspace (note: expensive)
          special = false;
          # whether to blur popups (e.g. right-click menus)
          popups = false;
          # works like ignorealpha in layer rules. If pixel opacity is below set value, will not blur
          popups_ignorealpha = 0.2;
        };
      };

      ###############################################################################
      # Animations
      ###############################################################################
      animations = {
        # enable animations
        enabled = true;
        # enable first launch animation
        first_launch_animation = true;
        # Defining your own Bezier curve can be done with the bezier keyword
        # - https://www.cssportal.com/css-cubic-bezier-generator/
        # - https://easings.net/
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];
        # Animations are declared with the animation keyword
        # animation = NAME, ONOFF, SPEED, CURVE, STYLE
        #
        # Animation tree:
        # global
        #   ↳ windows - styles: slide, popin
        #     ↳ windowsIn - window open
        #     ↳ windowsOut - window close
        #     ↳ windowsMove - everything in between, moving, dragging, resizing.
        #   ↳ layers - styles: slide, popin, fade
        #     ↳ layersIn - layer open
        #     ↳ layersOut - layer close
        #   ↳ fade
        #     ↳ fadeIn - fade in for window open
        #     ↳ fadeOut - fade out for window close
        #     ↳ fadeSwitch - fade on changing activewindow and its opacity
        #     ↳ fadeShadow - fade on changing activewindow for shadows
        #     ↳ fadeDim - the easing of the dimming of inactive windows
        #     ↳ fadeLayers - for controlling fade on layers
        #       ↳ fadeLayersIn - fade in for layer open
        #       ↳ fadeLayersOut - fade out for layer close
        #   ↳ border - for animating the border's color switch speed
        #   ↳ borderangle - for animating the border's gradient angle - styles: once (default), loop
        #   ↳ workspaces - styles: slide, slidevert, fade, slidefade, slidefadevert
        #     ↳ specialWorkspace - styles: same as workspaces
        # - ONOFF: can be either 0 or 1, 0 to disable, 1 to enable. note: if it’s 0, you can omit further args.
        # - SPEED: is the amount of ds (1ds = 100ms) the animation will take
        # - CURVE: is the bezier curve name
        # - STYLE: (optional) is the animation style
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

      ###############################################################################
      # Input
      ###############################################################################
      input = {
        # Appropriate XKB keymap parameter
        kb_layout = "us";
        # swap caps-lock and escape
        kb_options = "caps:swapescape";
        # Engage numlock by default.
        numlock_by_default = false;
        # The repeat rate for held-down keys, in repeats per seconds
        repeat_rate = 25;
        # Delay before a held-down key is repeated, in milliseconds
        repeat_delay = 600;
        # Sets the mouse input sensitivity. Value will be clamped to the range -1.0 to 1.0
        sensitivity = 0;
        # Force no cursor acceleration. This bypasses most of your pointer settings to get as raw of a signal as possible. Enabling this is not recommended due to potential cursor desynchronization
        force_no_accel = false;
        # Switches RMB and LMB
        left_handed = false;
        # Sets the scroll button. Has to be an int, cannot be a string. Check wev if you have any doubts regarding the ID. 0 means default
        scroll_button = 0;
        # If the scroll button lock is enabled, the button does not need to be held down. Pressing and releasing the button once enables the button lock, the button is now considered logically held down. Pressing and releasing the button a second time logically releases the button. While the button is logically held down, motion events are converted to scroll events
        scroll_button_lock = false;
        # Inverts scrolling direction. When enabled, scrolling moves content directly instead of manipulating a scrollbar
        natural_scroll = false;
        # (0/1/2/3) Specify if and how cursor movement should affect window focus. See the note below
        # - 0: Cursor movement will not change focus.
        # - 1: Cursor movement will always change focus to the window under the cursor.
        # - 2: Cursor focus will be detached from keyboard focus. Clicking on a window will move keyboard focus to that window.
        # - 3: Cursor focus will be completely separate from keyboard focus. Clicking on a window will not change keyboard focus.
        follow_mouse = 1;
        # If disabled and follow_mouse=1 then mouse focus will not switch to the hovered window unless the mouse crosses a window boundary
        mouse_refocus = true;
        # If enabled (1 or 2), focus will change to the window under the cursor when changing from tiled-to-floating and vice versa. If 2, focus will also follow mouse on float-to-float switches
        float_switch_override_focus = 1;
      };

      ###############################################################################
      # Gestures
      ###############################################################################
      gestures = {
        # enable workspace swipe gesture
        workspace_swipe = false;
        # how many fingers for the gesture
        workspace_swipe_fingers = 3;
        # in px, the distance of the gesture
        workspace_swipe_distance = 300;
        # enable workspace swiping from the edge of a touchscreen
        workspace_swipe_touch = false;
        #invert the direction
        workspace_swipe_invert = true;
        # minimum speed in px per timepoint to force the change ignoring cancel_ratio. Setting to 0 will disable this mechanic
        workspace_swipe_min_speed_to_force = 30;
        # how much the swipe has to proceed in order to commence it
        workspace_swipe_cancel_ratio = 0.5;
        # whether a swipe right on the last workspace should create a new one
        workspace_swipe_create_new = true;
        # if enabled, switching direction will be locked when you swipe past the direction_lock_threshold
        workspace_swipe_direction_lock = true;
        # in px, the distance to swipe before direction lock activates
        workspace_swipe_direction_lock_threshold = 10;
        # if enabled, swiping will not clamp at the neighboring workspaces but continue to the further ones
        workspace_swipe_forever = false;
        # if enabled, swiping will use the r prefix instead of the m prefix for finding workspaces. (requires disabled workspace_swipe_numbered)
        workspace_swipe_use_r = false;
      };

      ###############################################################################
      # Group
      ###############################################################################
      group = {
        # whether new windows in a group spawn after current or at group tail
        insert_after_current = true;
        # whether Hyprland should focus on the window that has just been moved out of the group
        focus_removed_window = true;
        # active group border color
        "col.border_active" = "$red";
        # inactive (out of focus) group border color
        "col.border_inactive" = "$base";
        # active locked group border color
        "col.border_locked_active" = "$red";
        # inactive locked group border color
        "col.border_locked_inactive" = "$base";

        groupbar = {
          # enables groupbars
          enabled = true;
          # font used to display groupbar titles
          font_family = "FiraCode Nerd Font Bold";
          # font size for the above
          font_size = 10;
          # whether to draw gradients under the titles of the above
          gradients = true;
          # height of the groupbar
          height = 15;
          # sets the decoration priority for groupbars
          priority = 3;
          # whether to render titles in the group bar decoration
          render_titles = true;
          # whether scrolling in the groupbar changes group active window
          scrolling = true;
          # controls the group bar text color
          text_color = "$text";
          # active group border color
          "col.active" = "$red";
          # inactive (out of focus) group border color
          "col.inactive" = "$base";
          # active locked group border color
          "col.locked_active" = "$red";
          # inactive locked group border color
          "col.locked_inactive" = "$base";
        };
      };

      ###############################################################################
      # Misc
      ###############################################################################
      misc = {
        # disables the random hyprland logo / anime girl background
        disable_hyprland_logo = true;
        # disables the hyprland splash rendering. (requires a monitor reload to take effect)
        disable_splash_rendering = false;
        # Enforce any of the 3 default wallpapers. Setting this to 0 disables the anime background. -1 means “random”
        force_default_wallpaper = -1;
        # controls the VFR status of hyprland. Heavily recommended to leave on true to conserve resources
        vfr = true;
        # controls the VRR (Adaptive Sync) of your monitors. 0 - off, 1 - on, 2 - fullscreen only
        vrr = 0;
        # If DPMS is set to off, wake up the monitors if the mouse moves
        mouse_move_enables_dpms = false;
        # If DPMS is set to off, wake up the monitors if a key is pressed
        key_press_enables_dpms = false;
        # Will make mouse focus follow the mouse when drag and dropping. Recommended to leave it enabled, especially for people using focus follows mouse at 0
        always_follow_on_dnd = true;
        # If true, will make keyboard-interactive layers keep their focus on mouse move (e.g. wofi, bemenu)
        layers_hog_keyboard_focus = true;
        # If true, will animate manual window resizes/moves
        animate_manual_resizes = false;
        # If true, will animate windows being dragged by mouse, note that this can cause weird behavior on some curves
        animate_mouse_windowdragging = false;
        # If true, the config will not reload automatically on save, and instead needs to be reloaded with hyprctl reload. Might save on battery.
        disable_autoreload = false;
        # Enable window swallowing
        enable_swallow = false;
        # Whether Hyprland should focus an app that requests to be focused (an activate request)
        focus_on_activate = false;
        # Disables direct scanout. Direct scanout attempts to reduce lag when there is only one fullscreen application on a screen (e.g. game). It is also recommended to set this to true if the fullscreen application shows graphical glitches
        no_direct_scanout = true;
        # Hides the cursor when the last input was a touch input until a mouse input is done
        # hide_cursor_on_touch = true;
        # Whether mouse moving into a different monitor should focus it
        mouse_move_focuses_monitor = true;
        # [Warning: buggy] starts rendering before your monitor displays a frame in order to lower latency
        render_ahead_of_time = false;
        # how many ms of safezone to add to rendering ahead of time. Recommended 1-2.
        render_ahead_safezone = 1;
        # the factor to zoom by around the cursor. AKA. Magnifying glass. Minimum 1.0 (meaning no zoom)
        # cursor_zoom_factor = 1.0;
        # whether the zoom should follow the cursor rigidly (cursor is always centered if it can be) or loosely
        # cursor_zoom_rigid = false;
        # if true, will allow you to restart a lockscreen app in case it crashes (red screen of death)
        allow_session_lock_restore = false;
        # change the background color. (requires enabled disable_hyprland_logo)
        background_color = "$base";
        # close the special workspace if the last window is removed
        close_special_on_empty = true;
        # if there is a fullscreen window, whether a new tiled window opened should replace the fullscreen one or stay behind. 0 - behind, 1 - takes over, 2 - unfullscreen the current fullscreen window
        new_window_takes_over_fullscreen = 0;
      };

      ###############################################################################
      # XWayland
      ###############################################################################
      xwayland = {
        # uses the nearest neigbor filtering for xwayland apps, making them pixelated rather than blurry
        use_nearest_neighbor = true;
        # forces a scale of 1 on xwayland windows on scaled displays
        force_zero_scaling = false;
      };

      ###############################################################################
      # Master layout
      ###############################################################################
      master = {
        # enable adding additional master windows in a horizontal split style
        allow_small_split = false;
        # (0.0 - 1.0) the scale of the special workspace windows
        special_scale_factor = 0.5;
        # (0.0 - 1.0) master split factor, the ratio of master split
        mfact = 0.5;
        # whether a newly open window should replace the master or join the slaves
        # new_is_master = true;
        # whether a newly open window should be on the top of the stack
        new_on_top = true;
        # whether to apply gaps when there is only one window on a workspace, aka. smart gaps. (default: disabled - 0) no border - 1, with border - 2
        no_gaps_when_only = 0;
        # default placement of the master area, can be left, right, top, bottom or center
        orientation = "left";
        # inherit fullscreen status when cycling/swapping to another window (e.g. monocle layout)
        inherit_fullscreen = true;
        # when using orientation=center, keep the master window centered, even when it is the only window in the workspace.
        always_center_master = false;
        # if enabled, resizing direction will be determined by the mouse’s position on the window (nearest to which corner). Else, it is based on the window’s tiling position
        smart_resizing = true;
        # when enabled, dragging and dropping windows will put them at the cursor position. Otherwise, when dropped at the stack side, they will go to the top/bottom of the stack depending on new_on_top
        drop_at_cursor = true;
      };

      ###############################################################################
      # Windows rules
      ###############################################################################
      windowrulev2 = [
        "workspace 2,class:(org.qutebrowser.qutebrowser)"
        "workspace 3,class:(obsidian)"
        "workspace 9,class:(virt-manager)"
      ];

      ###############################################################################
      # Theme: Catppuccin Mocha
      ###############################################################################
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
