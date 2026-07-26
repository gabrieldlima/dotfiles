{
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    colorScheme = "dark";

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      package = pkgs.iosevka;
      name = "Iosevka";
      size = 11;
    };
  };
}
