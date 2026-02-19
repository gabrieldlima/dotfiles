{
  ...
}: {
  programs.zellij = {
    enable = true;

    settings = {
      default_shell = "fish";
      show_startup_tips = false;
      theme = "gruvbox-dark-hard";
      themes.gruvbox-dark-hard.bg = "#282828";
      themes.gruvbox-dark-hard.fg = "#D5C4A1";
      themes.gruvbox-dark-hard.black = "#000000";
      themes.gruvbox-dark-hard.red = "#CC241D";
      themes.gruvbox-dark-hard.green = "#98971A";
      themes.gruvbox-dark-hard.yellow = "#D79921";
      themes.gruvbox-dark-hard.blue = "#3C8588";
      themes.gruvbox-dark-hard.magenta = "#B16286";
      themes.gruvbox-dark-hard.cyan = "#689D6A";
      themes.gruvbox-dark-hard.white = "#FBF1C7";
      themes.gruvbox-dark-hard.orange = "#FBF1C7";
    };
  };
}
