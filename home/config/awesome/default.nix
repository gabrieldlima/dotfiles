{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "git-fcd23a7";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "fcd23a7";
      hash = "sha256-P1AlGDvR/VMo7BDpP7XSgqnPlEeAz4YRG1OcqSNLM+Y=";
    };

    patches = [ ];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
    '';
  });
in {
  imports = [
    ../flameshot.nix
    ../picom.nix
    ../xresources.nix
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
