{
  config,
  ...
}: {
  home.file = {
    "${config.home.homeDirectory}/.config/waybar/nixos.png".source = ./assets/nixos.png;
    "${config.home.homeDirectory}/.config/waybar/avatar.png".source = ./assets/avatar.png;
  };

  programs.waybar = {
    enable = true;

    settings = {
      waybar = {
        layer = "bottom";
        output = [ "HDMI-A-1" ];
        position = "top";
        height = 45;
        width = 1910;
        margin-top = 5;
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

        modules-left = [ "image" "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ ];
        modules-right = [ "tray" "cpu" "memory" "clock" "user" ];

        image = {
          path = "${config.home.homeDirectory}/.config/waybar/nixos.png";
          size = 28;
        };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = true;
          format = "{name}";
          format-icons = {
            active = "";
            default = "";
            sort-by-number = true;
            urgent = "";
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
            "org.wezfurlong.wezterm" = "wezterm";
          };
        };

        tray = {
          icon-size = 20;
          spacing = 5;
        };

        cpu = {
          interval = 2;
          format = " {usage}%";
          tooltip = false;
        };

        memory = {
          interval = 2;
          format = "  {used:0.1f}GiB";
          tooltip = false;
        };

        clock = {
          interval = 60;
          format = "󰥔 {:%I:%M %p}";
          timezone = "America/Sao_Paulo";
          tooltip = false;
        };

        user = {
          format = "";
          icon = true;
          avatar = "${config.home.homeDirectory}/.config/waybar/avatar.png";
          height = 28;
          width = 28;
        };
      };
    };

    style = let
      rosewater = "#f5e0dc";
      flamingo  = "#f2cdcd";
      pink      = "#f5c2e7";
      mauve     = "#cba6f7";
      red       = "#f38ba8";
      maroon    = "#eba0ac";
      peach     = "#fab387";
      yellow    = "#f9e2af";
      green     = "#a6e3a1";
      teal      = "#94e2d5";
      sky       = "#89dceb";
      sapphire  = "#74c7ec";
      blue      = "#89b4fa";
      lavender  = "#b4befe";
      text      = "#cdd6f4";
      subtext1  = "#bac2de";
      subtext0  = "#a6adc8";
      overlay2  = "#9399b2";
      overlay1  = "#7f849c";
      overlay0  = "#6c7086";
      surface2  = "#585b70";
      surface1  = "#45475a";
      surface0  = "#313244";
      base      = "#010101";
      mantle    = "#010101";
      crust     = "#010101";
    in ''
      * {
        min-height: 0px;
      }

      window#waybar {
        background-color: transparent;
      }

      window#waybar > box {
        border-radius: 10px;
        margin: 4px 4px 4px 4px;
        background-color: ${base};
        box-shadow: 0px 0px 3px 0px ${base};
      }

      #image {
        padding-left: 8px;
      }

      #workspaces {
        font-size: 0px;
        background: ${base};
        margin-top: 3px;
        margin-bottom: 3px;
        padding: 10px 0px;
      }

      #workspaces button {
        padding: 0px;
        margin: 0px 5px;
        min-width: 10px;
        border-radius: 10px;
        background: ${lavender};
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.empty {
        background: ${surface0};
      }

      #workspaces button.active {
        background: ${blue};
        min-width: 40px;
        background-size: 400% 400%;
      }

      #workspaces button:hover {
        background: ${sapphire};
        min-width: 40px;
        background-size: 400% 400%;
      }

      #window,
      #cpu,
      #memory,
      #clock {
        font-family: "FiraCode Nerd Font SemBd";
        font-size: 13px;
      }

      #cpu {
        color: ${green};
        padding-left: 2px;
        padding-right: 2px;
      }

      #memory {
        color: ${red};
        padding-left: 2px;
        padding-right: 2px;
      }

      #clock {
        color: ${peach};
        padding-left: 2px;
        padding-right: 2px;
      }

      #user {
        padding-left: 2px;
        padding-right: 8px;
      }
    '';
  };
}
