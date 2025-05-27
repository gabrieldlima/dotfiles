# ╔════════════════════════════╗
# ║██████╗  ██████╗ ███████╗██╗║
# ║██╔══██╗██╔═══██╗██╔════╝██║║
# ║██████╔╝██║   ██║█████╗  ██║║
# ║██╔══██╗██║   ██║██╔══╝  ██║║
# ║██║  ██║╚██████╔╝██║     ██║║
# ║╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝║
# ╚════════════════════════════╝

{
  pkgs,
  config,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    font = "JetBrains Mono ExtraBold 10";

    extraConfig = {
      modi = "drun,run,window";
      icon-theme = "Papirus";
      show-icons = false;
      terminal = "ghostty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = true;
      hide-scrollbar = true;
      display-drun = "drun";
      # display-run = " Run";
      # display-window = "󰕰 Window";
      # display-Network = "󰤨 Network";
      sidebar-mode = true;
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        width             = mkLiteral "400";
      };
      "#element-text, element-icon , mode-switcher" = {
        background-color  = mkLiteral "inherit";
        text-color        = mkLiteral "inherit";
      };
      "#window" = {
        background-color  = mkLiteral "#000000";
        border            = mkLiteral "3px";
        border-color      = mkLiteral "#458588";
        border-radius     = mkLiteral "0px";
        height            = mkLiteral "500px";
      };
      "#mainbox" = {
        background-color  = mkLiteral "#000000";
      };
      "#inputbar" = {
        children          = mkLiteral "[prompt,entry]";
        background-color  = mkLiteral "#000000";
        border-radius     = mkLiteral "0px";
        padding           = mkLiteral "2px";
      };
      "#prompt" = {
        background-color  = mkLiteral "#458588";
        border-radius     = mkLiteral "0px";
        margin            = mkLiteral "20px 0px 0px 20px";
        padding           = mkLiteral "6px";
        text-color        = mkLiteral "#000000";
      };
      "#textbox-prompt-colon" = {
        expand            = mkLiteral "false";
        str               = " =";
      };
      "#entry" = {
        background-color  = mkLiteral "#000000";
        margin            = mkLiteral "20px 0px 0px 10px";
        padding           = mkLiteral "6px";
        placeholder       = "Search";
        placeholder-color = mkLiteral "#45475a";
        text-color        = mkLiteral "#ebdbb2";
      };
      "#listview" = {
        background-color  = mkLiteral "#000000";
        border            = mkLiteral "0px 0px 0px";
        columns           = mkLiteral "1";
        lines             = mkLiteral "5";
        margin            = mkLiteral "0px 20px 0px 20px";
        padding           = mkLiteral "6px 0px 0px";
      };
      "#element" = {
        background-color  = mkLiteral "#000000";
        padding           = mkLiteral "5px";
        text-color        = mkLiteral "#ebdbb2";
      };
      "#element-icon" = {
        size              = mkLiteral "20px";
      };
      "#element selected" = {
        background-color  = mkLiteral "#458588";
        border-radius     = mkLiteral "0px";
        text-color        = mkLiteral "#000000";
      };
      "#mode-switcher" = {
        spacing           = mkLiteral "0";
      };
      "#button" = {
        background-color  = mkLiteral "#000000";
        horizontal-align  = mkLiteral "0.5";
        padding           = mkLiteral "10px";
        text-color        = mkLiteral "#6c7086";
        vertical-align    = mkLiteral "0.5";
      };
      "#button selected" = {
        background-color  = mkLiteral "#000000";
        text-color        = mkLiteral "#458588";
      };
      "#message" = {
        background-color  = mkLiteral "#000000";
        border-radius     = mkLiteral "0px";
        margin            = mkLiteral "2px";
        padding           = mkLiteral "2px";
      };
      "#textbox" = {
        background-color  = mkLiteral "#000000";
        margin            = mkLiteral "20px 0px 0px 20px";
        padding           = mkLiteral "6px";
        text-color        = mkLiteral "#458588";
      };
    };
  };
}
