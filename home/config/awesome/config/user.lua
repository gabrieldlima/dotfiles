local M = {}

M.config = {
  -- My profile config
  user  = "Gabriel Lima",
  home  = os.getenv("HOME"),
  host  = "aorus",
  theme = "catppuccin_mocha",
  font  = "Iosevka Slab ExtraBold 11",
}

M.apps = {
  -- My profile apps
  terminal     = M.config.home .. "/.local/bin/wezterm",
  web_browser  = "qutebrowser",
  text_editor  = "nvim",
  launcher     = "rofi -show drun",
  file_manager = M.config.home .. "/.local/bin/wezterm" .. "-e yazi",
  screnshoot   = "flameshot",
  image_viewer = "sxiv",
  pdf_viewer   = "zathura"
}

return M
