{
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      # GENERAL
      shell = "fish";

      # ENV
      env = {
        TERM = "xterm-256color";
        SHELL = "fish";
      };

      # WINDOW
      window = {
        padding.x = 10;
        padding.y = 10;
        decorations = "None";
        opacity = 0.95;
      };

      # FONT
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };
        size = 11;
      };

      # COLORS
      colors = {
        primary = {
          background = "#010101";
          foreground = "#cdd6f4";
          dim_foreground = "#7f849c";
          bright_foreground = "#cdd6f4";
        };
        cursor = {
          text = "#1e1e2e";
          cursor = "#f5e0dc";
        };
        vi_mode_cursor = {
          text = "#1e1e2e";
          cursor = "#b4befe";
        };
        search.matches = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };
        search.focused_match = {
          foreground = "#1e1e2e";
          background = "#a6e3a1";
        };
        footer_bar = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };
        hints.start = {
          foreground = "#1e1e2e";
          background = "#f9e2af";
        };
        hints.end = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };
        selection = {
          text = "#1e1e2e";
          background = "#f5e0dc";
        };
        normal = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };
        bright = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };
        dim = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };
        indexed_colors = [
        { index = 16; color = "#fab387"; }
        { index = 17; color = "#f5e0dc"; }
        ];
      };

      # MOUSE
      mouse = {
        hide_when_typing = true;
      };
    };
  };
}
