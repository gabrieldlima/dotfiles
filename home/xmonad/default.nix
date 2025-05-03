# ╔══════════════════════════════════════════════════════╗
# ║██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗ ║
# ║╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗║
# ║ ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║║
# ║ ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║║
# ║██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝║
# ║╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝ ║
# ╚══════════════════════════════════════════════════════╝

{
  pkgs,
  ...
}: {
  imports = [
    ../picom
    ../xresources
  ];

  home = {
    file.".config/x11/xinitrc".text = ''
      exec xmonad
    '';

    packages = [
      pkgs.sxiv
      pkgs.xsel
      pkgs.xwallpaper
    ];
  };

  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
    extraConfig = ''
      --------------------------------------------------------------------------------
      -- Imports:

      import XMonad

      import XMonad.Util.EZConfig
      import XMonad.Util.SpawnOnce

      import XMonad.Hooks.EwmhDesktops

      import XMonad.Layout.Gaps
      import XMonad.Layout.Spacing


      --------------------------------------------------------------------------------
      -- Main:

      myConfig = def
        {
          modMask = myModMask
        , layoutHook = myLayoutHook
        , startupHook = myStartupHook
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        }
        `additionalKeysP` myKeys

      main :: IO ()
      main = xmonad $ ewmhFullscreen $ ewmh $ myConfig


      --------------------------------------------------------------------------------
      -- Variables:

      myModMask :: KeyMask
      myModMask = mod4Mask

      myNormalBorderColor, myFocusedBorderColor :: String
      myNormalBorderColor = "#000000"
      myFocusedBorderColor = "#89b4fa"


      --------------------------------------------------------------------------------
      -- Key bindings:

      myTerminal :: String
      myTerminal = "ghostty"

      myBrowser :: String
      myBrowser = "qutebrowser"

      myLauncher :: String
      myLauncher = "rofi -show drun"

      myKeys =
        [
          ("M-<Return>", spawn myTerminal)
        , ("M-b", spawn myBrowser)
        , ("M-p", spawn myLauncher)
        ]


      --------------------------------------------------------------------------------
      -- Layouts:

      myLayoutHook = avoidStruts
        $ gaps [(U,10), (D,10), (R,10), (L,10)]
        $ spacing 10
        $ tiled ||| Mirror tiled ||| Full
        where
          -- default tiling algorithm partitions the screen into two panes
          tiled = Tall nmaster delta ratio

          -- Default number of windows in the master pane
          nmaster = 1

          -- Default proportio of screen occupied by master pane
          ratio = 1 / 2

          -- Percent of screen to increment by when resizing panes
          delta = 3 / 100


      --------------------------------------------------------------------------------
      -- Startup hook:

      myStartupHook :: X ()
      myStartupHook = do
        spawnOnce "xset s off"
        spawnOnce "xset -dpms"
        spawnOnce "xset s noblank"
        spawnOnce "xrandr --output DisplayPort-1 --mode 2560x1440 --rate 170"
        spawnOnce "picom"
        spawnOnce "xwallpaper --stretch /home/gabriel/pictures/wallpapers/wallpaper.jpg"
        spawnOnce "xrdb -load /home/gabriel/.Xresources"
        spawnOnce "xsetroot -cursor_name left_ptr"
        spawnOnce "setxkbmap -option caps:escape"
    '';
  };
}
