# ╔═══════════════════════════════════════╗
# ║██████╗ ██╗ ██████╗ ██████╗ ███╗   ███╗║
# ║██╔══██╗██║██╔════╝██╔═══██╗████╗ ████║║
# ║██████╔╝██║██║     ██║   ██║██╔████╔██║║
# ║██╔═══╝ ██║██║     ██║   ██║██║╚██╔╝██║║
# ║██║     ██║╚██████╗╚██████╔╝██║ ╚═╝ ██║║
# ║╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝║
# ╚═══════════════════════════════════════╝

{
  ...
}: {
  services.picom = {
    enable = true;
    settings = {
      # Picom settings
      backend = "glx";
      vsync = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      glx-no-stencil = true;
      glx-no-rebind-pixmap = false;
      use-damage = true;
      log-level = "warn";

      # Draw window shadows
      shadow = true;
      shadow-radius = 12;
      shadow-opacity = 1;
      shadow-offset-x = -12;
      shadow-offset-y = -12;
      shadow-color = "#000000";
      # shadow-exclude = [
      #   "window_type = 'dock'"
      # ];

      # Opacity of windows
      active-opacity = 1.0;
      inactive-opacity = 1;
      frame-opacity = 1;
      inactive-opacity-override = false;

      # Fade windows in and out
      fading = true;
      fade-in-step = 0.5;
      fade-out-step = 0.5;

      # Corners
      corner-radius = 0;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };

    # Rules for specific window types
    wintypes = {
      menu = {
        shadow = false;
      };
      dropdown_menu = {
        shadow = false;
      };
      popup_menu = {
        shadow = false;
      };
      utility = {
        shadow = true;
      };
      dnd = {
        shadow = true;
      };
      dock = {
        shadow = true;
        clip-shadow-above = true;
      };
      tooltip = {
        fade = true;
        shadow = true;
        opacity = 1;
        focus = true;
        full-shadow = false;
      };
    };
  };
}
