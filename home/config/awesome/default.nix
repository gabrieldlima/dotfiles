{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "git-d53eb1be67f594f62fb6134fe40928e8ca17304a";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "d53eb1be67f594f62fb6134fe40928e8ca17304a";
      hash = "sha256-FjvthODMP8M0NFyXWGTj0SmUU8TNqldTKZ3AfIFJVp8=";
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
