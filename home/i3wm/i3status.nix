# ╔════════════════════════════════════════════════════════════════════╗
# ║██╗██████╗       ███████╗████████╗ █████╗ ████████╗██╗   ██╗███████╗║
# ║██║╚════██╗      ██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║   ██║██╔════╝║
# ║██║ █████╔╝█████╗███████╗   ██║   ███████║   ██║   ██║   ██║███████╗║
# ║██║ ╚═══██╗╚════╝╚════██║   ██║   ██╔══██║   ██║   ██║   ██║╚════██║║
# ║██║██████╔╝      ███████║   ██║   ██║  ██║   ██║   ╚██████╔╝███████║║
# ║╚═╝╚═════╝       ╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝║
# ╚════════════════════════════════════════════════════════════════════╝

{
...
}: {
  programs.i3status-rust = {
    enable = true;

    bars = {
      default = {
        icons = "material-nf";

        settings = {
          theme =  {
            theme = "plain";
            overrides = {
              idle_bg = "#000000";
              idle_fg = "#ebdbb2";
              info_bg = "#458588";
              info_fg = "#ebdbb2";
              good_bg = "#98971a";
              good_fg = "#ebdbb2";
              warning_bg = "#d79921";
              warning_fg = "#ebdbb2";
              critical_bg = "#cc241d";
              critical_fg = "#ebdbb2";
              separator = "";
              separator_bg = "#000000";
              separator_fg = "#000000";
            };
          };
        };

        blocks = [
          # Currently focused window
          # {
          #   block = "focused_window";
          #   format = " $title.str(max_w:200) |  i3wm ";
          # }

          # A pomodoro timer
          # {
          #   block = "pomodoro";
          #   format = " $icon{ $message|} ";
          #   notify_cmd = "dunstify '{msg}'";
          # }

          # Notifications
          # {
          #   block = "notify";
          #   format = " $icon {$paused{Off}|On} {($notification_count.eng(w:1))|}";
          #   driver = "dunst";
          # }

          # Scratchpad indicator
          {
            block = "scratchpad";
            format = "  $count ";
          }

          # The system temperature
          # {
          #   block = "temperature";
          #   format = " $icon $average ";
          #   format_alt = " $icon $min/$average/$max ";
          # }

          # CPU statistics
          # {
          #   block = "cpu";
          #   format = "  $utilization ";
          #   format_alt = "  $frequency $barchart ";
          #   interval = 2;
          # }

          # Memory usage
          # {
          #   block = "custom";
          #   format = "   $text ";
          #   command = "free -h | awk '/Mem:/ {print $3}'";
          #   shell = "bash";
          #   interval = 2;
          # }

          # Disk usage statistics
          # {
          #   block = "disk_space";
          #   format = " $icon $used/$total ";
          #   format_alt = " $icon $free/$percentage ";
          #   path = "/";
          # }

          # Network information
          # {
          #   block = "net";
          #   format = " ^icon_net_down$speed_down.eng(prefix:K) ^icon_net_up$speed_up.eng(prefix:K) ";
          #   format_alt = " $icon $ip ";
          #   device = "eno1";
          # }

          # Volume level
          {
            block = "sound";
            format = " $icon $volume ";
            format_alt = " $icon $active_port ";
            max_vol = 100;
            show_volume_when_muted = true;
            headphones_indicator = true;
          }

          # Date and clock
          {
            block = "time";
            format = "  $timestamp.datetime(f:'%a %b %d') 󰥔 $timestamp.datetime(f:'%I:%M %p') ";
            interval = 60;
          }
        ];
      };
    };
  };
}
