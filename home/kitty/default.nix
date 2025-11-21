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

    extraConfig = ''
      font_family family="Iosevka"
      bold_font        auto
      italic_font      auto
      bold_italic_font auto
      font_size 11.0
    '';

    settings = {
      # Cursor customization
      cursor            = "#bdae93";
      cursor_text_color = "#665c54";
      cursor_shape      = "block";
      cursor_trail      = 1;

      # Mouse
      url_color      = "#458588";
      copy_on_select = true;
      open_url_with  = "qutebrowser";

      # Terminal bell
      enable_audio_bell = false;

      # Window layout
      remember_window_size = false;
      initial_window_width = 1000;
      initial_window_height = 700;
      window_margin_width = 5;
      confirm_os_window_close = 0;

      # Tab bar
      active_tab_foreground   = "#eeeeee";
      active_tab_background   = "#d65d0e";
      inactive_tab_foreground = "#ebdbb2";
      inactive_tab_background = "#171a1a";
      tab_bar_background      = "#000000";

      # The shell program to execute
      shell = "fish";

      # Color scheme
      background_opacity   = "1";
      foreground           = "#ebdbb2";
      background           = "#000000";
      selection_foreground = "#ebdbb2";
      selection_background = "#d65d0e";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";

      # Gruvbox dark hard
      # black
      color0 = "#3c3836";
      color8 = "#928374";

      # red
      color1 = "#cc241d";
      color9 = "#fb4934";

      # green
      color2  = "#98971a";
      color10 = "#b8bb26";

      # yellow
      color3  = "#d79921";
      color11 = "#fabd2f";

      # blue
      color4  = "#458588";
      color12 = "#83a598";

      # magenta
      color5  = "#b16286";
      color13 = "#d3869b";

      # cyan
      color6  = "#689d6a";
      color14 = "#8ec07c";

      # white
      color7  = "#a89984";
      color15 = "#fbf1c7";
    };
  };
}
