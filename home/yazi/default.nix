{
  ...
}: {
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

    theme = {
      indicator = {
        padding = {
          open = "█";
          close = "█";
        };
      };
      status = {
        sep_left = {
          open = "█";
          close = "█";
        };
        sep_right = {
          open = "█";
          close = "█";
        };
      };
      tabs = {
        sep_inner = {
          open = "█";
          close = "█";
        };
        sep_outer = {
          open = "█";
          close = "█";
        };
      };
    };
  };
}
