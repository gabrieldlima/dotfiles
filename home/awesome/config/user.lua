local M = {}

M.config = {
  -- My profile config
  user  = "Gabriel Lima",
  home  = os.getenv("HOME"),
  host  = "aorus",
  theme = "catppuccin_mocha",
  font  = "JetBrains Mono Bold 10",
}

M.apps = {
  -- My profile apps
  terminal     = "ghostty",
  web_browser  = "qutebrowser",
  text_editor  = "nvim",
  launcher     = "rofi -show drun",
  file_manager = "ghostty -e yazi",
  screnshoot   = "flameshot",
  image_viewer = "sxiv",
  pdf_viewer   = "zathura",
  notes        = "obsidian"
}

return M
