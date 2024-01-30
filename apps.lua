return {
  -- Default applications
  terminal = "wezterm",
  browser  = "qutebrowser",
  launcher = "rofi -show drun",
  editor   = os.getenv("EDITOR") or "nvim",
}
