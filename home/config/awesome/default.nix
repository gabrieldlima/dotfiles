{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "git-206e6e1";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "206e6e1";
      hash = "sha256-CpieBypRPQ9h/RzWskvv/zSVbPPBHCWOIdrGBySBtlQ=";
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
