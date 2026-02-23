# ╔═════════════════════════════════════════════╗
# ║███████╗████████╗██╗   ██╗██╗     ██╗██╗  ██╗║
# ║██╔════╝╚══██╔══╝╚██╗ ██╔╝██║     ██║╚██╗██╔╝║
# ║███████╗   ██║    ╚████╔╝ ██║     ██║ ╚███╔╝ ║
# ║╚════██║   ██║     ╚██╔╝  ██║     ██║ ██╔██╗ ║
# ║███████║   ██║      ██║   ███████╗██║██╔╝ ██╗║
# ║╚══════╝   ╚═╝      ╚═╝   ╚══════╝╚═╝╚═╝  ╚═╝║
# ╚═════════════════════════════════════════════╝

{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = {
      base00 = "#000000"; # ----
      base01 = "#1d2021"; # ---
      base02 = "#504945"; # --
      base03 = "#665c54"; # -
      base04 = "#bdae93"; # +
      base05 = "#d5c4a1"; # ++
      base06 = "#ebdbb2"; # +++
      base07 = "#fbf1c7"; # ++++
      base08 = "#fb4934"; # red
      base09 = "#fe8019"; # orange
      base0A = "#fabd2f"; # yellow
      base0B = "#b8bb26"; # green
      base0C = "#8ec07c"; # aqua/cyan
      base0D = "#83a598"; # blue
      base0E = "#d3869b"; # purple
      base0F = "#d65d0e"; # brown
    };

    fonts = {
      monospace = { name = "FiraCode"; };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };

    cursor = {
      name = "GoogleDot-White";
      package = pkgs.google-cursor;
      # name = "Bibata-Modern-Ice-Right";
      # package = pkgs.bibata-cursors;
      size = 62;
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus";
      light = "Papirus";
    };

    targets = {
      gtk = {
        enable = true;
        extraCss = ''
          * { border-radius: 0; }
        '';
      };
    };
  };
}
