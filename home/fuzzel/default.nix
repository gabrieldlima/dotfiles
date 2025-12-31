{
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "wezterm start";
        font = "Iosevka:size=13";
        prompt = "\"$ \" ";
        icons-enabled = false;
        match-mode = "fzf";
        width = 50;
        horizontal-pad = 20;
        vertical-pad = 20;
        lines = 15;
        tabs = 4;
        anchor = "center";
        inner-pad = 5;
      };
      border = {
        width = 3;
        radius = 0;
      };
      colors = {
        background = "#000000ff";
        text = "#ebdbb2ff";
        selection = "#458588ff";
        selection-text = "#000000ff";
        border = "#458588ff";
        prompt = "#ebdbb2ff";
      };
      key-bindings = {
        execute = "Control+m Return";
      };
    };
  };
}
