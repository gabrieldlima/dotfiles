{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    steam
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      fps_limit = 60;
      preset = 3;
      gpu_stats = true;
      cpu_stats = true;
      fps = true;
      frametime = true;
      frame_timing = true;
      text_outline = true;
    };
  };
}
