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
        position = "top";
        height = 30;
        width = 2560;
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;
        margin-bottom = 0;
        spacing = 0;
        name = "waybar";
        mode = "dock";
        start_hidden = false;
        exclusive = true;
        fixed-center = true;
        reload_style_on_change = true;

        modules-left = [ "custom/logo" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "group/systray" "network" "pulseaudio" ];

        "custom/logo" = {
          format = " ";
          on-click = "rofi -show drun";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            # "1" = "1";
            # "2" = "2";
            # "3" = "3";
            # "4" = "4";
            # "5" = "5";
            # "6" = "6";
            # "7" = "7";
            # "8" = "8";
            # "9" = "9";
            active = "󱓻";
            default = "";
            urgent = "";
            empty = "";
            sort-by-number = true;
          };
          persistent-workspaces = { "*" = 5; };
          active-only = false;
          all-outputs = false;
          disable-scroll = true;
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{class}";
          rewrite = {
            ".virt-manager-wrapped" = "virt-manager";
            "Alacritty" = "alacritty";
            "brave-browser" = "brave";
            "com.mitchellh.ghostty" = "ghostty";
            "dev.zed.Zed" = "zed";
            "org.pwmt.zathura" = "zathura";
            "org.qutebrowser.qutebrowser" = "qutebrowser";
            "org.wezfurlong.wezterm" = "wezterm";
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
          format = "  ";
          tooltip = false;
        };

        "tray" = {
          icon-size = 16;
          spacing = 5;
        };

        "clock" = {
          format = "{:L%A %I:%M %p}";
          format-alt = "{:L%d %B W%V %Y}";
          interval = 60;
          timezone = "America/Sao_Paulo";
          tooltip = false;
        };

        "pulseaudio" = {
          format = " {icon} ";
          format-muted = "  ";
          format-icons = {
            "default" = ["" "" ""];
          };
          on-click-right = "pavucontrol";
          scroll-step = 5;
          tooltip = true;
          tooltip-format = "Volume: {volume}%";
          max-volume = 100;
          ignored-sinks = [
            "alsa_output.pci-0000_07_00.1.hdmi-stereo-extra3"
            "alsa_output.usb-Sony_Interactive_Entertainment_DualSense_Wireless_Controller-00.analog-surround-40"
          ];
        };

        "network" = {
          format-ethernet = " 󰛳 ";
          format-disconnectd = " 󰲛 ";
          interface = "eno1";
          tooltip = true;
          interval = 30;
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
          font-family: "Iosevka Semibold";
          font-size: 14px;
          margin: 0px 0px 0px 0px;
          box-shadow: 0px 0px 0px 0px #000000;
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
          font-family: "Iosevka Semibold";
          font-size: 14px;
        }

        /*
        =================================================================================
        Hyprland
        =================================================================================
        */
        #workspaces button {
          all: initial;
          padding: 0 6px;
          margin: 0 1.5px;
          min-width: 9px;
          color: #ebdbb2;
        }

        #workspaces button.empty {
          opacity: 0.5;
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
          padding-right: 0px;
        }

        /*
        =================================================================================
        Network
        =================================================================================
        */
        #network.disconnectd {
          color: #cc241d;
        }

        /*
        =================================================================================
        Logo
        =================================================================================
        */
        #custom-logo {
          font-size: 16px;
        }

        /*
        =================================================================================
        Modules groups (left, center, right)
        =================================================================================
        */
        .modules-left {
          margin-left: 8px;
        }

        .modules-right {
          margin-right: 8px;
        }
    '';
  };
}
