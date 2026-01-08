# ╔══════════════════════════════════════════════════════════════════════╗
# ║ █████╗ ██╗      █████╗  ██████╗██████╗ ██╗████████╗████████╗██╗   ██╗║
# ║██╔══██╗██║     ██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝║
# ║███████║██║     ███████║██║     ██████╔╝██║   ██║      ██║    ╚████╔╝ ║
# ║██╔══██║██║     ██╔══██║██║     ██╔══██╗██║   ██║      ██║     ╚██╔╝  ║
# ║██║  ██║███████╗██║  ██║╚██████╗██║  ██║██║   ██║      ██║      ██║   ║
# ║╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝   ║
# ╚══════════════════════════════════════════════════════════════════════╝

{
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # GENERAL
      terminal.shell = "fish";

      # ENV
      env = {
        TERM = "xterm-256color";
        SHELL = "fish";
      };

      # WINDOW
      window = {
        dimensions.columns = 130;
        dimensions.lines = 35;
        padding.x = 10;
        padding.y = 10;
        decorations = "None";
        opacity = 1;
      };

      # FONT
      font = {
        normal = {
          family = "Iosevka";
          style = "Regular";
        };
        bold = {
          family = "Iosevka";
          style = "Bold";
        };
        italic = {
          family = "Iosevka";
          style = "Italic";
        };
        bold_italic = {
          family = "Iosevka";
          style = "Bold Italic";
        };
        size = 11;
      };

      # COLORS
      colors = {
        primary = {
          background = "#000000";
          foreground = "#ebdbb2";
        };
        normal = {
          black   = "#282828";
          red     = "#cc241d";
          green   = "#98971a";
          yellow  = "#d79921";
          blue    = "#458588";
          magenta = "#b16286";
          cyan    = "#689d6a";
          white   = "#a89984";
        };
        bright = {
          black   = "#928374";
          red     = "#fb4934";
          green   = "#b8bb26";
          yellow  = "#fabd2f";
          blue    = "#83a598";
          magenta = "#d3869b";
          cyan    = "#8ec07c";
          white   = "#ebdbb2";
        };
      };

      # MOUSE
      mouse = {
        hide_when_typing = true;
      };
    };
  };
}
