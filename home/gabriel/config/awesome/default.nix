{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "git-a35fced";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "a35fceda14c39b4a2b1c52947288b378f410f32a";
      hash = "sha256-IH/20D+qrgk5l6Zmu9egif7aVTUhMtLTVSgKY2i47BU=";
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
