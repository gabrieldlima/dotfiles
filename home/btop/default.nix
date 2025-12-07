{
  ...
}: {
  programs.btop = {
    enable = true;

    settings = {
      vim_keys = true;
      color_theme = "gruvbox_dark_v2";
      theme_background = false;
      rounded_corners = false;
    };
  };
}
