{
  ...
}: {
  home.file.".config/x11/xinitrc".text = ''
    exec awesome
  '';
  programs.bash = {
    enable = true;

    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && [ "$XDG_VTNR" = 1 ] && exec startx >& "$XDG_CACHE_HOME/xsession-errors"
    '';
  };
}
