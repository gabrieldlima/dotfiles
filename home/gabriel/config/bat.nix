{
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;
    themes = {
      CatppuccinMocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1";
          sha256 = "sha256-Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
    config = {
      theme = "CatppuccinMocha";
      style = "header-filename,header-filesize,grid";
      wrap = "never";
    };
  };
}
