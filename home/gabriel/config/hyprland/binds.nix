{
  wayland.windowManager.hyprland.settings = {
    binds = {
      # if disabled, will not pass the mouse events to apps / dragging windows around if a keybind has been triggered
      pass_mouse_when_bound = false;
      # in ms, how many ms to wait after a scroll event to allow to pass another one for the binds
      scroll_event_delay = 300;
      # If enabled, an attempt to switch to the currently focused workspace will instead switch to the previous workspace. Akin to i3’s auto_back_and_forth
      workspace_back_and_forth = false;
      # If enabled, workspaces don’t forget their previous workspace, so cycles can be created by switching to the first workspace in a sequence, then endlessly going to the previous workspace
      allow_workspace_cycles = false;
      # Whether switching workspaces should center the cursor on the workspace (0) or on the last active window for that workspace (1)
      workspace_center_on = 0;
      # sets the preferred focus finding method when using focuswindow/movewindow/etc with a direction. 0 - history (recent have priority), 1 - length (longer shared edges have priority)
      focus_preferred_method = 0;
      # If enabled, dispatchers like moveintogroup, moveoutofgroup and movewindoworgroup will ignore lock per group.
      ignore_group_lock = false;
      # If enabled, when on a fullscreen window, movefocus will cycle fullscreen, if not, it will move the focus in a direction
      movefocus_cycles_fullscreen = true;
      # If enabled, apps that request keybinds to be disabled (e.g. VMs) will not be able to do so
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
}
