{ pkgs, ... }:
let
  steam-with-packages = pkgs.steam.override {
    extraPkgs = pkgs: with pkgs; [
    # Missing deps go here
    ];
  };
in
{
  home.packages = with pkgs; [
    steam-with-packages
  ];
}
