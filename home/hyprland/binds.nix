{
  ...
}: let
  terminal     = "wezterm";
  web_browser  = "zen";
  launcher     = "rofi -show drun";
  file_manager = "${terminal} -e yazi";
  pdf_viewer   = "zathura";
  notes        = "obsidian";

  mod        = "SUPER";
  modShift   = "SUPER + SHIFT";
  modControl = "SUPER + CONTROL";
  modAlt     = "SUPER + ALT";
in {
  wayland.windowManager.hyprland.settings = {
    binds = {
      pass_mouse_when_bound = false;
      scroll_event_delay = 300;
      workspace_back_and_forth = false;
      allow_workspace_cycles = false;
      workspace_center_on = 0;
      focus_preferred_method = 0;
      ignore_group_lock = false;
      movefocus_cycles_fullscreen = true;
      movefocus_cycles_groupfirst = false;
      disable_keybind_grabbing = false;
      window_direction_monitor_fallback = true;
      allow_pin_fullscreen = false;
    };

    bind = [
      "${mod}, RETURN, exec, ${terminal}"
      "${mod}, B, exec, ${web_browser}"
      "${mod}, P, exec, ${launcher}"
      "${mod}, E, exec, ${file_manager}"
      "${mod}, O, exec, ${notes}"
      "${mod}, Z, exec, ${pdf_viewer}"

      "${modShift}, C, killactive"
      "${modShift}, Q, exit"
      "${modControl}, R, exec, hyprctl reload"
      "${modControl}, X, exec, hyprctl kill"

      "${mod}, F, fullscreen, 0"
      "${mod}, M, fullscreen, 1"

      "${modShift}, F, togglefloating"
      "${mod}, SPACE, centerwindow"

      "${mod}, h, movefocus, l"
      "${mod}, l, movefocus, r"
      "${mod}, k, movefocus, u"
      "${mod}, j, movefocus, d"

      "${modShift}, h, movewindow, l"
      "${modShift}, l, movewindow, r"
      "${modShift}, k, movewindow, u"
      "${modShift}, j, movewindow, d"

      "${mod}, 1, workspace, 1"
      "${mod}, 2, workspace, 2"
      "${mod}, 3, workspace, 3"
      "${mod}, 4, workspace, 4"
      "${mod}, 5, workspace, 5"
      "${mod}, 6, workspace, 6"
      "${mod}, 7, workspace, 7"
      "${mod}, 8, workspace, 8"
      "${mod}, 9, workspace, 9"

      "${modShift}, 1, movetoworkspacesilent, 1"
      "${modShift}, 2, movetoworkspacesilent, 2"
      "${modShift}, 3, movetoworkspacesilent, 3"
      "${modShift}, 4, movetoworkspacesilent, 4"
      "${modShift}, 5, movetoworkspacesilent, 5"
      "${modShift}, 6, movetoworkspacesilent, 6"
      "${modShift}, 7, movetoworkspacesilent, 7"
      "${modShift}, 8, movetoworkspacesilent, 8"
      "${modShift}, 9, movetoworkspacesilent, 9"

      "${modShift}, RETURN, layoutmsg, swapwithmaster"

      "${mod}, mouse:276, workspace, +1"
      "${mod}, mouse:275, workspace, -1"
    ];

    binde = [
      "${modControl}, h, resizeactive, -50 0"
      "${modControl}, l, resizeactive, 50 0"
      "${modControl}, k, resizeactive, 0 -50"
      "${modControl}, j, resizeactive, 0 50"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];
  };
}
