# ╔═════════════════════════╗
# ║██╗  ██╗██████╗  ██████╗ ║
# ║╚██╗██╔╝██╔══██╗██╔════╝ ║
# ║ ╚███╔╝ ██║  ██║██║  ███╗║
# ║ ██╔██╗ ██║  ██║██║   ██║║
# ║██╔╝ ██╗██████╔╝╚██████╔╝║
# ║╚═╝  ╚═╝╚═════╝  ╚═════╝ ║
# ╚═════════════════════════╝
{
  config,
  ...
}: {
  xdg = {
    enable = true;

    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/share";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
    };

    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
        "image/png" = [ "sxiv.desktop" ];
        "image/jpg" = [ "sxiv.desktop" ];
        "image/jpeg" = [ "sxiv.desktop" ];
      };
    };
  };
}
