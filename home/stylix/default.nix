# ╔═════════════════════════════════════════════╗
# ║███████╗████████╗██╗   ██╗██╗     ██╗██╗  ██╗║
# ║██╔════╝╚══██╔══╝╚██╗ ██╔╝██║     ██║╚██╗██╔╝║
# ║███████╗   ██║    ╚████╔╝ ██║     ██║ ╚███╔╝ ║
# ║╚════██║   ██║     ╚██╔╝  ██║     ██║ ██╔██╗ ║
# ║███████║   ██║      ██║   ███████╗██║██╔╝ ██╗║
# ║╚══════╝   ╚═╝      ╚═╝   ╚══════╝╚═╝╚═╝  ╚═╝║
# ╚═════════════════════════════════════════════╝

{
pkgs,
...
}: {
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = {
      base00 = "000000";
      base01 = "0f0f0f";
      base02 = "3c3835";
      base03 = "504945";
      base04 = "bdae93";
      base05 = "d5c4a1";
      base06 = "ebdbb2";
      base07 = "fbf1c7";
      base08 = "fb4934";
      base09 = "fe8019";
      base0A = "fabd2f";
      base0B = "b8bb26";
      base0C = "8ec07c";
      base0D = "83a598";
      base0E = "d3869b";
      base0F = "d65d0e";
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Iosevka";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Iosevka";
      };

      monospace = {
        package = pkgs.noto-fonts;
        name = "Iosevka";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Iosevka";
      };
    };

    cursor = {
      name = "GoogleDot-Black";
      package = pkgs.google-cursor;
      size = 48;
    };
    # cursor = let
    #   getFrom = url: hash: name: {
    #     name = name;
    #     size = 16;
    #     package = pkgs.runCommand "moveUp" {} ''
    #       mkdir -p $out/share/icons
    #       ln -s ${pkgs.fetchzip {
    #       url = url;
    #       hash = hash;
    #       }} $out/share/icons/${name}
    # #     '';
    #   };
    # in
    #   getFrom
    # "https://github.com/gabrieldlima/oldSys/releases/download/release/91083-oldSys.tar.gz"
    # "sha256-WvlnCmeWywCqKZXIREiuLG9sQj+M4/3egAlmZDfi7yQ="
    # "oldSys";

    targets = {
      gtk = {
        enable = true;
        # extraCss = ''
        #   * { border-radius: 10; }
        # '';
      };
    };
  };
}
