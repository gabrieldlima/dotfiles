return {
  -- Default applications
  terminal = "wezterm",
  browser  = "brave",
  launcher = "rofi -show drun",
  editor   = os.getenv("EDITOR") or "nvim",
}
