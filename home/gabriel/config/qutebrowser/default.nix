{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    qutebrowser
  ];

  home.file = {
    ".config/qutebrowser/config.py".source = ./config.py;
    ".config/qutebrowser/quickmarks".source = ./quickmarks;
  };
}
