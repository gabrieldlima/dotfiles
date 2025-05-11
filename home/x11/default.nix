{
  ...
}: {
  home.file.".config/x11/xinitrc".text = ''
    xrandr --output DisplayPort-1 --mode 2560x1440 --rate 170
    xset s off
    xset -dpms
    xset s noblank
    exec i3
  '';
}
