{
  pkgs,
  ...
}: {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    pop-shell
  ];
  
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; 
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "pop-shell@system76.com"
          "dash-to-dock@micxgx.gmail.com"
        ];
      };

      "org/gnome/shell/extensions/pop-shell" = {
        active-hint = true;
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        "panel/blur" = false;
        "dash-to-dock/blur" = false;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = 48;
        show-trash = false;
        show-mounts = false;
        intellihide-mode = "ALL_WINDOWS";
        custom-theme-shrink = true;
        custom-background-color = true;
        background-color = "rgb(0,0,0)";
      };
    };
  };
}
