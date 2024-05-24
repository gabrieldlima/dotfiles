local wezterm = require("wezterm")

local color_overrides = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
color_overrides.background = "#010101"

local M = {}

-- Spawn a fish shell in login mode
M.default_prog = { "/usr/bin/fish" }

-- Colors & Appearance
M.color_schemes = {
  ["Catppuccin_Mocha_Dark"] = color_overrides,
}
M.color_scheme = "Catppuccin_Mocha_Dark"

-- Tab Bar Appearance & Colors
M.enable_tab_bar = false
M.hide_tab_bar_if_only_one_tab = true

-- Window Background Opacity
M.window_background_opacity = 1.0

-- Fonts
M.font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font", "FiraCode Nerd Font" }
M.font_size = 11

-- Configuration
M.check_for_updates = false
M.window_close_confirmation = "NeverPrompt"
M.initial_cols = 120
M.initial_rows = 30
M.enable_wayland = false

return M
