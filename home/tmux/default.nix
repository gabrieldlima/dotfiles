{
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    focusEvents = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set-window-option -g mode-keys vi

      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
    '';
  };
}
