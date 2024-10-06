{
  config,
  ...
}: {
  home.file."${config.home.homeDirectory}/.config/waybar/nixos.png".source = ./nixos.png;

  programs.waybar = {
    enable = true;

    settings = {
      waybar = {
        layer = "bottom";
        output = [ "HDMI-A-1" ];
        position = "top";
        height = 40;
        width = 1900;
        margin-top = 8;
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

        modules-left = [ "image" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "tray" "cpu" "memory" "clock" ];

        image = {
          path = ./nixos.png;
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
        min-height: 0;
        border-radius: 10px;
      }

      #image {
        padding-left: 8px;
      }

      #workspaces {
        font-size: 0;
        background: ${base};
        margin: 0;
        padding: 14px 0;
      }

      #workspaces button {
        padding: 0;
        margin: 0 5px;
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
        padding-right: 8px;
      }
    '';
  };
}
