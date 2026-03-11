{
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    escapeTime = 5;
    focusEvents = true;
    terminal = "screen-256color";
  };
}
