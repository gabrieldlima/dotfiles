# ╔════════════════════════════════╗
# ║██████╗  █████╗ ███████╗██╗  ██╗║
# ║██╔══██╗██╔══██╗██╔════╝██║  ██║║
# ║██████╔╝███████║███████╗███████║║
# ║██╔══██╗██╔══██║╚════██║██╔══██║║
# ║██████╔╝██║  ██║███████║██║  ██║║
# ║╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝║
# ╚════════════════════════════════╝

{
...
}: {
  programs.bash = {
    enable = true;

    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && [ "$XDG_VTNR" = 1 ] && exec Hyprland
      [ "$(tty)" = "/dev/tty2" ] && exec gamescope -W 2560 -H 1440 -r 170 -e -- steam -tenfoot
    '';
  };
}
