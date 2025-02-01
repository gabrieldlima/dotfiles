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
    package = pkgs.rofi;

    font = "JetBrains Mono ExtraBold 10";

    extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Papirus";
      show-icons = true;
      terminal = "wezterm";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "󰀘 Apps";
      display-run = " Run";
      display-window = "󰕰 Window";
      display-Network = "󰤨 Network";
      sidebar-mode = true;
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        width             = mkLiteral "800";
      };
      "#element-text, element-icon , mode-switcher" = {
        background-color  = mkLiteral "inherit";
        text-color        = mkLiteral "inherit";
      };
      "#window" = {
        background-color  = mkLiteral "#000000";
        border            = mkLiteral "2px";
        border-color      = mkLiteral "#89b4fa";
        border-radius     = mkLiteral "0px";
        height            = mkLiteral "400px";
      };
      "#mainbox" = {
        background-color  = mkLiteral "#000000";
      };
      "#inputbar" = {
        children          = mkLiteral "[prompt,entry]";
        background-color  = mkLiteral "#000000";
        border-radius     = mkLiteral "4px";
        padding           = mkLiteral "2px";
      };
      "#prompt" = {
        background-color  = mkLiteral "#89b4fa";
        border-radius     = mkLiteral "4px";
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
        text-color        = mkLiteral "#cdd6f4";
      };
      "#listview" = {
        background-color  = mkLiteral "#000000";
        border            = mkLiteral "0px 0px 0px";
        columns           = mkLiteral "2";
        lines             = mkLiteral "5";
        margin            = mkLiteral "0px 20px 0px 20px";
        padding           = mkLiteral "6px 0px 0px";
      };
      "#element" = {
        background-color  = mkLiteral "#000000";
        padding           = mkLiteral "5px";
        text-color        = mkLiteral "#cdd6f4";
      };
      "#element-icon" = {
        size              = mkLiteral "20px";
      };
      "#element selected" = {
        background-color  = mkLiteral "#89b4fa";
        border-radius     = mkLiteral "4px";
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
        text-color        = mkLiteral "#89b4fa";
      };
      "#message" = {
        background-color  = mkLiteral "#000000";
        border-radius     = mkLiteral "4px";
        margin            = mkLiteral "2px";
        padding           = mkLiteral "2px";
      };
      "#textbox" = {
        background-color  = mkLiteral "#000000";
        margin            = mkLiteral "20px 0px 0px 20px";
        padding           = mkLiteral "6px";
        text-color        = mkLiteral "#89b4fa";
      };
    };
  };
}
