local wezterm = require("wezterm")
local home = os.getenv("USERPROFILE")

local M = {}

-- Config
-- =============================================================================
M.default_prog = { "pwsh", "-nologo" }
M.font = wezterm.font_with_fallback { "JetBrains Mono", "Cascadia Code" }
M.font_size = 11
M.check_for_updates = false
M.window_close_confirmation = "NeverPrompt"
M.initial_cols = 120
M.initial_rows = 30
M.enable_wayland = false
M.window_background_opacity = 1
M.enable_tab_bar = true
M.use_fancy_tab_bar = false
M.tab_bar_at_bottom = false
M.hide_tab_bar_if_only_one_tab = false
M.front_end = "OpenGL"
M.max_fps = 170
M.animation_fps = 170
M.window_decorations = "RESIZE"

-- Theme
-- =============================================================================
local color_overrides = wezterm.color.get_builtin_schemes()["GruvboxDarkHard"]
color_overrides.background = "#000000"

M.color_schemes = {
    ["GruvboxDarkHard"] = color_overrides,
}
M.color_scheme = "GruvboxDarkHard"

M.colors = {
    tab_bar = {
        background = "#000000",

        active_tab = {
            bg_color = "#458588",
            fg_color = "#000000",
            intensity = "Bold",
        },

        inactive_tab = {
            bg_color = "#000000",
            fg_color = "#ebdbb2",
        },

        inactive_tab_hover = {
            bg_color = "#000000",
            fg_color = "#ebdbb2",
            italic = true,
        },

        new_tab = {
            bg_color = "#000000",
            fg_color = "#ebdbb2",
            intensity = "Bold",
        },

        new_tab_hover = {
            bg_color = "#000000",
            fg_color = "#ebdbb2",
            intensity = "Bold",
        },
    },
}

M.command_palette_bg_color = "#000000"
M.command_palette_fg_color = "#ebdbb2"
M.command_palette_font = wezterm.font "JetBrains Mono"
M.command_palette_font_size = 12
M.command_palette_rows = 14

-- Launcher
-- =============================================================================
M.launch_menu = {
    {
        label = "MSVC Insiders - Command Prompt",
        cwd = home .. "\\Source",
        args = {
            "cmd",
            "/k",
            "C:\\Program Files\\Microsoft Visual Studio\\18\\Insiders\\Common7\\Tools\\VsDevCmd.bat"
        },
    },
    {
        label = "MSVC Insiders - Powershell",
        cwd = home .. "\\Source",
        args = {
            "pwsh",
            "-NoExit",
            "-Command",
            "& 'C:\\Program Files\\Microsoft Visual Studio\\18\\Insiders\\Common7\\Tools\\Launch-VsDevShell.ps1'"
        },
    },
}

return M
