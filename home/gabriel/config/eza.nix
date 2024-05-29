{
  pkgs,
  ...
}: {
  programs.eza = {
    enable = true;
    icons = true;
    git = true;
    # extraOptions = [
    #   "--group-directories-first"
    # ];
  };
}
