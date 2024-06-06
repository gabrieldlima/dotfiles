{
  pkgs,
  ...
}:
let
  awesome-git = pkgs.awesome.overrideAttrs (oa: {
    version = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
    src = pkgs.fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
      hash = "sha256-ZGZ53IWfQfNU8q/hKexFpb/2mJyqtK5M9t9HrXoEJCg=";
    };

    patches = [ ];

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
    '';
  });
in {
  imports = [
    ../picom.nix
  ];

  home.packages = with pkgs; [
    sxiv
    xsel
    xwallpaper
  ];

  xresources = {
    properties = {
      "XTerm*faceName" = "FiraCode Nerd Font:size=12";
      "Xcursor.theme" = "GoogleDot-Black";
      "Xcursor.size" = 16;
    };
    extraConfig = ''
      *background: #050508
      *foreground: #CDD6F4

      ! black
      *color0: #45475A
      *color8: #585B70

      ! red
      *color1: #F38BA8
      *color9: #F38BA8

      ! green
      *color2: #A6E3A1
      *color10: #A6E3A1

      ! yellow
      *color3: #F9E2AF
      *color11: #F9E2AF

      ! blue
      *color4: #89B4FA
      *color12: #89B4FA

      ! magenta
      *color5: #F5C2E7
      *color13: #F5C2E7

      ! cyan
      *color6: #94E2D5
      *color14: #94E2D5

      ! white
      *color7: #BAC2DE
      *color15: #A6ADC8
    '';
  };

  xsession.windowManager.awesome = {
    enable = true;
    package = awesome-git;
  };
}
