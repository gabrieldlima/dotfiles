{
  config,
  ...
}: {
  services.flameshot = {
    enable = true;

    # NOTE: https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
    settings = {
      General = {
        # Image Save Path
        savePath= "${config.home.homeDirectory}/Pictures/Screenshots";

        # Default file extension for screenshots
        saveAsFileExtension = ".png";

        # Show the help screen on startup (bool)
        showHelp = false;

        # Show the side panel button (bool)
        showSidePanelButton = false;

        # Show desktop notifications (bool)
        showDesktopNotification = true;

        # Filename pattern using C++ strftime formatting
        filenamePattern = "%F_%H-%M";

        # Whether the tray icon is disabled (bool)
        disabledTrayIcon = true;

        #  Last used tool thickness
        drawThickness = 1;

        # Launch at startup (bool)
        startupLaunch = false;

        # Copy path to image after save (bool)
        copyPathAfterSave = true;

        # Save image after copy (bool)
        saveAfterCopy = false;

        #
        # [[ Theme ]]
        #
        # List of colors for color picker
        # The colors are arranged counter-clockwise with the first being set to the right of the cursor
        # Colors are any valid hex code or W3C color name
        # "picker" adds a custom color picke
        userColors = "#f5e0dc, #f2cdcd, #f5c2e7, #cba6f7, #f38ba8, #eba0ac, #fab387, #f9e2af, #a6e3a1, #94e2d5, #89dceb, #74c7ec, #89b4fa, #b4befe";

        # Main UI color
        uiColor = "#cdd6f4";

        # Contrast UI color
        contrastUiColor= "#89b4fa";

        # Last used color
        drawColor = "#f38ba8";
      };
    };
  };
}
