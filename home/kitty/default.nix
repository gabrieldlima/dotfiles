# ╔══════════════════════════════════════╗
# ║██╗  ██╗██╗████████╗████████╗██╗   ██╗║
# ║██║ ██╔╝██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝║
# ║█████╔╝ ██║   ██║      ██║    ╚████╔╝ ║
# ║██╔═██╗ ██║   ██║      ██║     ╚██╔╝  ║
# ║██║  ██╗██║   ██║      ██║      ██║   ║
# ║╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝   ║
# ╚══════════════════════════════════════╝

{
...
}: {
  programs.kitty = {
    enable = true;

    font = {
      name = "Iosevka Term Slab Medium";
      size = 11;
    };

    settings = {
      # Cursor customization
      cursor            = "#F5E0DC";
      cursor_text_color = "#1E1E2E";
      cursor_shape      = "beam";

      # Mouse
      url_color      = "#F5E0DC";
      copy_on_select = true;
      open_url_with  = "qutebrowser";

      # Terminal bell
      enable_audio_bell = false;

      # Window layout
      remember_window_size = false;
      initial_window_height = 500;
      initial_window_width = 1000;
      window_margin_width = 5;
      confirm_os_window_close = 0;

      # Tab bar
      active_tab_foreground   = "#11111B";
      active_tab_background   = "#050508";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background      = "#11111B";

      # The shell program to execute
      shell = "fish";

      # Color scheme
      background_opacity   = "0.95";
      foreground           = "#CDD6F4";
      background           = "#000000";
      selection_foreground = "#1E1E2E";
      selection_background = "#F5E0DC";

      # Kitty window border colors
      active_border_color   = "#B4BEFE";
      inactive_border_color = "#6C7086";
      bell_border_color     = "#F9E2AF";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#1E1E2E";
      mark1_background = "#B4BEFE";
      mark2_foreground = "#1E1E2E";
      mark2_background = "#CBA6F7";
      mark3_foreground = "#1E1E2E";
      mark3_background = "#74C7EC";

      # The 16 terminal colors";
      # black
      color0 = "#45475A";
      color8 = "#585B70";

      # red
      color1 = "#F38BA8";
      color9 = "#F38BA8";

      # green
      color2  = "#A6E3A1";
      color10 = "#A6E3A1";

      # yellow
      color3  = "#F9E2AF";
      color11 = "#F9E2AF";

      # blue
      color4  = "#89B4FA";
      color12 = "#89B4FA";

      # magenta
      color5  = "#F5C2E7";
      color13 = "#F5C2E7";

      # cyan
      color6  = "#94E2D5";
      color14 = "#94E2D5";

      # white
      color7  = "#BAC2DE";
      color15 = "#A6ADC8";
    };
  };
}
