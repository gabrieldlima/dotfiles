{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "git-ad0290b";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "ad0290b";
      hash = "sha256-uaskBbnX8NgxrprI4UbPfb5cRqdRsJZv0YXXshfsxFU=";
    };

    patches = [ ];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
    '';
  });
in {
  imports = [
    ../picom.nix
    ../xresources.nix
  ];

  home.packages = with pkgs; [
    sxiv
    xsel
    xwallpaper
  ];

  xsession.windowManager.awesome = {
    enable = true;
    package = awesome-git;
  };
}
