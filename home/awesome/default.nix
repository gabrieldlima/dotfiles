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
    version = "git-0f950cb";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "0f950cb";
      hash = "sha256-GIUkREl60vQ0cOalA37sCgn7Gv8j/9egfRk9emgGm/Y=";
    };

    patches = [
      ./patches/tasklist.patch
    ];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
    '';
  });
in {
  imports = [
    ../flameshot
    ../picom
    ../xresources
  ];

  home = {
    file.".config/x11/xinitrc".text = ''
      exec awesome
    '';

    packages = with pkgs; [
      sxiv
      xsel
      xwallpaper
    ];
  };

  xsession.windowManager.awesome = {
    enable = true;
    package = awesome-git;
  };
}
