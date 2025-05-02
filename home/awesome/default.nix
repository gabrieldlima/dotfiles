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
    version = "git-691e36425a645e54402cb04efc4c2b00d73051bd";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "691e36425a645e54402cb04efc4c2b00d73051bd";
      hash = "sha256-IN5sNBDoC6CtBzr3Qp8S9r0rfqR2CD/maGB1aiZdRE4=";
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
