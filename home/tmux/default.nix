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
      set -g status-style "bg=green,fg=#0c0c0c"
      set -g pane-active-border-style fg=green

      set -g mode-keys vi

      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R
    '';
  };
}
