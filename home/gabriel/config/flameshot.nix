{
  config,
  ...
}: {
  services.flameshot = {
    enable = true;

    # NOTE: https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
    settings = {
      General = {
        savePath= "${config.home.homeDirectory}/Pictures/Screenshots";
        saveAsFileExtension = ".png";
        showHelp = false;
        showSidePanelButton = false;
        showDesktopNotification = true;
        filenamePattern = "%F_%H-%M";
        disabledTrayIcon = true;
        drawThickness = 1;
        startupLaunch = false;
        copyPathAfterSave = true;
        saveAfterCopy = false;

        # Catppuccin theme
        userColors = "#f5e0dc, #f2cdcd, #f5c2e7, #cba6f7, #f38ba8, #eba0ac, #fab387, #f9e2af, #a6e3a1, #94e2d5, #89dceb, #74c7ec, #89b4fa, #b4befe";
        uiColor = "#cdd6f4";
        contrastUiColor= "#89b4fa";
        drawColor = "#f38ba8";
      };
    };
  };
}
