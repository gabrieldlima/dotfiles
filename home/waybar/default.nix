# ╔═══════════════════════════════════════════════════╗
# ║██╗    ██╗ █████╗ ██╗   ██╗██████╗  █████╗ ██████╗ ║
# ║██║    ██║██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗║
# ║██║ █╗ ██║███████║ ╚████╔╝ ██████╔╝███████║██████╔╝║
# ║██║███╗██║██╔══██║  ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗║
# ║╚███╔███╔╝██║  ██║   ██║   ██████╔╝██║  ██║██║  ██║║
# ║ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝║
# ╚═══════════════════════════════════════════════════╝

{
  ...
}: {
  programs.waybar = {
    enable = true;

    settings = {
      waybar = {
        layer = "bottom";
        output = [ "DP-2" ];
        position = "bottom";
        height = 32;
        width = 2560;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;
        spacing = 10;
        name = "waybar";
        mode = "dock";
        start_hidden = false;
        exclusive = true;
        fixed-center = true;
        reload_style_on_change = true;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ ];
        modules-right = [ "group/systray" "network" "pulseaudio" "clock" ];

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = true;
          format = "{name}";
          format-icons = {
            active = "";
            default = "";
            urgent = "";
            empty = "";
            sort-by-number = true;
          };
          persistent-workspaces = {
            "*" = 9;
          };
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{class}";
          rewrite = {
            "org.pwmt.zathura" = "zathura";
            "org.qutebrowser.qutebrowser" = "qutebrowser";
            "brave-browser" = "brave";
            "org.wezfurlong.wezterm" = "wezterm";
            "com.mitchellh.ghostty" = "ghostty";
            "dev.zed.Zed" = "zed";
            "zen-beta" = "zen";
          };
        };

        "group/systray" = {
          orientation = "horizontal";
          modules = [ "custom/showtray" "tray" ];
          drawer = {
            click-to-reveal = true;
            transition-duration = 300;
            children-class = "minimized";
          };
        };

        "custom/showtray" = {
          format = "";
          tooltip = false;
        };

        tray = {
          icon-size = 16;
          spacing = 5;
        };

        clock = {
          interval = 60;
          format = "󰥔 {:%I:%M %p}";
          format-alt = "{:%A, %B %d, %Y}";
          timezone = "America/Sao_Paulo";
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-icons = {
            "alsa_output.pci-0000_09_00.4.analog-stereo" = "";
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "phone-muted" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          on-click-right = "pavucontrol";
          scroll-step = 5;
          tooltip = false;
          max-volume = 150;
          ignored-sinks = [
            "alsa_output.pci-0000_07_00.1.hdmi-stereo-extra3"
            "alsa_output.usb-Sony_Interactive_Entertainment_DualSense_Wireless_Controller-00.analog-surround-40"
          ];
        };

        network = {
          interface = "eno1";
          format-ethernet = "󰈀 up";
          format-disconnectd = "󰈀 down";
          format-alt = "󰈀 {ipaddr}";
          tooltip = false;
        };
      };
    };

    style = ''
        /*
        =================================================================================
        Waybar
        =================================================================================
        */
        * {
            min-height: 0px;
        }

        window#waybar {
          background-color: transparent;
        }

        window#waybar > box {
            color: #ebdbb2;
            background-color: #000000;
            font-family: "Iosevka";
            font-size: 14px;
            margin: 3px 0px 0px 0px;
            box-shadow: 0px 0px 3px 0px #000000;
        }

        /*
        =================================================================================
        Tooltip
        =================================================================================
        */
        tooltip {
            background-color: #000000;
            border: 0px;
            border-radius: 0px;
        }
        tooltip label {
            color: #ebdbb2;
            background-color: #000000;
            font-family: "Iosevka";
            font-size: 14px;
        }

        /*
        =================================================================================
        Hyprland
        =================================================================================
        */
        #workspaces button {
            color: #ebdbb2;
            background: #000000;
            font-size: 14px;
            margin-left: 2px;
            margin-right: 2px;
            margin-top: 4px;
            margin-bottom: 4px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            padding-bottom: 0px;
            border-radius: 0px;
        }

        #workspaces button.empty {
            border-radius: 0px;
            color: #000000;
            background: #000000;
        }

        #workspaces button.active {
            border-radius: 0px;
            color: #000000;
            background: #458588;
        }

        #workspaces button.urgent {
            border-radius: 0px;
            color: #cc241d;
            background: #000000;
        }

        /*
        =================================================================================
        System tray
        =================================================================================
        */
        #custom-showtray {
            font-size: 13px;
            color: #ebdbb2;
            padding-left: 2px;
            padding-right: 2px;
        }

        #tray {
            padding-left: 2px;
            padding-right: 2px;
        }

        #tray menu {
            color: #ebdbb2;
            background: #000000;
            border: 0px solid #458588;
            border-radius: 0px;
        }

        #tray menu menuitem:hover {
            color: #000000;
            background: #458588;
            border-radius: 0px;
        }

        /*
        =================================================================================
        Clock
        =================================================================================
        */
        #clock {
            padding-right: 5px;
        }

        /*
        =================================================================================
        Network
        =================================================================================
        */
        #network.disconnectd {
            color: #cc241d;
        }
    '';
  };
}
