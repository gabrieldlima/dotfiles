# ╔═══════════════════════════════════════════════════════════════════════════════════╗
# ║ █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗██╗    ██╗███╗   ███╗║
# ║██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝██║    ██║████╗ ████║║
# ║███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗  ██║ █╗ ██║██╔████╔██║║
# ║██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║╚██╔╝██║║
# ║██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗╚███╔███╔╝██║ ╚═╝ ██║║
# ║╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝     ╚═╝║
# ╚═══════════════════════════════════════════════════════════════════════════════════╝

{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "git";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "cab3e81dc6071e3c1c4bd15cf8fab91236c7f2bd";
      hash = "sha256-g4cSjASTulAIXM1nSRGqdBRNOyUDl8A+WlJhF3duq+E=";
    };

    patches = [];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
    '';
  });
in {
  imports = [
    ../picom
    ../xresources
  ];

  home = {
    file.".config/x11/xinitrc".text = ''
      exec awesome
    '';

    packages = [
      pkgs.sxiv
      pkgs.xsel
      pkgs.xwallpaper
    ];
  };

  xsession.windowManager.awesome = {
    enable = true;
    package = awesome-git;
  };
}
