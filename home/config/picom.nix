# NOTE: https://github.com/nix-community/home-manager/issues/5744
{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      picom
    ];

    file = {
      "${config.home.homeDirectory}/.config/picom/picom.conf".text = ''
        active-opacity = 1.000000;
        backend = "glx";
        corner-radius = 10;
        detect-client-opacity = true;
        detect-rounded-corners = true;
        detect-transient = true;
        fade-delta = 10;
        fade-exclude = [  ];
        fade-in-step = 0.500000;
        fade-out-step = 0.500000;
        fading = true;
        frame-opacity = 1;
        glx-no-rebind-pixmap = false;
        glx-no-stencil = true;
        inactive-opacity = 1;
        inactive-opacity-override = false;
        log-level = "warn";
        mark-ovredir-focused = true;
        mark-wmwin-focused = true;
        opacity-rule = [  ];
        rounded-corners-exclude = [ "window_type = 'dock'" , "window_type = 'desktop'" ];
        shadow = true;
        shadow-color = "#000000";
        shadow-exclude = [  ];
        shadow-offset-x = -12;
        shadow-offset-y = -12;
        shadow-opacity = 1;
        shadow-radius = 12;
        use-damage = true;
        vsync = true;
        wintypes: { dnd = { shadow = true; }; dock = { clip-shadow-above = true; shadow = true; }; dropdown_menu = { opacity = 1; }; popup_menu = { opacity = 1; }; tooltip = { fade = true; focus = true; full-shadow = false; opacity = 1; shadow = true; }; };

        animations = (
            {
              triggers = [ "open", "show" ];
              preset = "fly-in";
              direction = "up";
              duration = 0.2;
            },
            {
              triggers = [ "close", "hide" ];
              preset = "fly-out";
              direction = "down";
              duration = 0.2;
            },
            {
              triggers = [ "geometry" ];
              preset = "geometry-change";
              duration = 0.2;
            }
        )
      '';
    };
  };
  # services.picom = {
  #   enable = true;
  #   settings = {
  #     # Picom settings
  #     backend = "glx";
  #     vsync = true;
  #     mark-wmwin-focused = true;
  #     mark-ovredir-focused = true;
  #     detect-rounded-corners = true;
  #     detect-client-opacity = true;
  #     detect-transient = true;
  #     glx-no-stencil = true;
  #     glx-no-rebind-pixmap = false;
  #     use-damage = true;
  #     log-level = "warn";
  #
  #     # Draw window shadows
  #     shadow = true;
  #     shadow-radius = 12;
  #     shadow-opacity = 1;
  #     shadow-offset-x = -12;
  #     shadow-offset-y = -12;
  #     shadow-color = "#000000";
  #     # shadow-exclude = [
  #     #   "window_type = 'dock'"
  #     # ];
  #
  #     # Opacity of windows
  #     active-opacity = 1.0;
  #     inactive-opacity = 1;
  #     frame-opacity = 1;
  #     inactive-opacity-override = false;
  #
  #     # Fade windows in and out
  #     fading = true;
  #     fade-in-step = 0.5;
  #     fade-out-step = 0.5;
  #
  #     # Corners
  #     corner-radius = 10;
  #     rounded-corners-exclude = [
  #       "window_type = 'dock'"
  #       "window_type = 'desktop'"
  #     ];
  #   };
  #
  #   # Rules for specific window types
  #   wintypes = {
  #     dnd = {
  #       shadow = true;
  #     };
  #     dock = {
  #       shadow = true;
  #       clip-shadow-above = true;
  #     };
  #     dropdown_menu = {
  #       opacity = 1;
  #     };
  #     popup_menu = {
  #       opacity = 1;
  #     };
  #     tooltip = {
  #       fade = true;
  #       shadow = true;
  #       opacity = 1;
  #       focus = true;
  #       full-shadow = false;
  #     };
  #   };
  # };
}
