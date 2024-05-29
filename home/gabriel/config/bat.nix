{
  pkgs,
  ...
}: {
  programs.bat = {
    enable = true;
    themes = {
      catppuccinMocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1";
          sha256 = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "CatppuccinMocha.tmTheme";
      };
    };
    config = {
      theme = "catppuccinMocha";
      style = "header-filename,header-filesize,grid";
      wrap = "never";
    };
  };
}
