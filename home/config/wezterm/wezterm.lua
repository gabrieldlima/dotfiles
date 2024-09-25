-- ╔══════════════════════════════════════════════════════════════╗
-- ║██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗║
-- ║██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║║
-- ║██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║║
-- ║██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║║
-- ║╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║║
-- ║ ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝║
-- ╚══════════════════════════════════════════════════════════════╝

local wezterm = require("wezterm")

local M = {}

-- Config
-- =============================================================================
M.default_prog = { "fish" }
M.font = wezterm.font_with_fallback { "FiraCode Nerd Font" }
M.font_size = 11
M.check_for_updates = false
M.window_close_confirmation = "NeverPrompt"
M.initial_cols = 120
M.initial_rows = 30
M.enable_wayland = false
M.window_background_opacity = 0.95
M.window_decorations = "RESIZE"
M.enable_tab_bar = true
M.use_fancy_tab_bar = false
M.hide_tab_bar_if_only_one_tab = false
M.front_end = "WebGpu"
M.webgpu_power_preference = "HighPerformance"
-- local gpus = wezterm.gui.enumerate_gpus()
M.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]


-- Theme
-- =============================================================================
local color_overrides = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
color_overrides.background = "#010101"

M.color_schemes = {
  ["Catppuccin_Mocha_Dark"] = color_overrides,
}
M.color_scheme = "Catppuccin_Mocha_Dark"

M.colors = {
  tab_bar = {
    background = "#010101",

    active_tab = {
      bg_color = "#89b4fa",
      fg_color = "#010101",
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "#010101",
      fg_color = "#cdd6f4",
    },

    inactive_tab_hover = {
      bg_color = "#010101",
      fg_color = "#cdd6f4",
      italic = true,
    },

    new_tab = {
      bg_color = "#010101",
      fg_color = "#89b4fa",
      intensity = "Bold",
    },

    new_tab_hover = {
      bg_color = "#010101",
      fg_color = "#89b4fa",
      intensity = "Bold",
    },
  },
}


-- Binds
-- =============================================================================
local direction_keys = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right"
}

local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == "true"
end

local function split_navigation(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == "resize" and "META" or "CTRL",
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
        }, pane)
      else
        if resize_or_move == "resize" then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

M.leader = { key=",", mods="CTRL" }

M.keys = {
  { key = "v", mods = "LEADER", action = wezterm.action { SplitVertical   = { domain = "CurrentPaneDomain" } } },
  { key = "s", mods = "LEADER", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },

  split_navigation("move", "h"),
  split_navigation("move", "j"),
  split_navigation("move", "k"),
  split_navigation("move", "l"),

  split_navigation("resize", "h"),
  split_navigation("resize", "j"),
  split_navigation("resize", "k"),
  split_navigation("resize", "l"),
}

return M
