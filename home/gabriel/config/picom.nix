{
  pkgs,
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
      detect-rounded-corners = false;
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

      # Opacity of windows
      active-opacity = 1.0;
      inactive-opacity = 1;
      frame-opacity = 1;
      inactive-opacity-override = false;

      # Fade windows in and out
      fading = true;
      fade-in-step = 0.5;
      fade-out-step = 0.5;

    };
    # Rules for specific window types
    wintypes = {
      dnd = {
        shadow = true;
      };
      dock = {
        shadow = true;
        clip-shadow-above = true;
      };
      dropdown_menu = {
        opacity = 1;
      };
      popup_menu = {
        opacity = 1;
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
