local font = "Iosevka 11"
local icons = "/home/gabriel/.config/awesome/icons/"

local theme = {
  gruvbox = {
    background = "#000000",
    foreground = "#ebdbb2",
    color0     = "#282828", -- darkGray
    color1     = "#cc241d", -- darkRed
    color2     = "#98971a", -- darkGreen
    color3     = "#d79921", -- darkYellow
    color4     = "#458588", -- darkBlue
    color5     = "#b16286", -- darkMagenta
    color6     = "#689d6a", -- darkCyan
    color7     = "#a89984", -- lightGrey
    color8     = "#928374", -- gray
    color9     = "#fb4934", -- red
    color10    = "#b8bb26", -- green
    color11    = "#fabd2f", -- yellow
    color12    = "#83a598", -- blue
    color13    = "#d3869b", -- magenta
    color14    = "#8ec07c", -- cyan
    color15    = "#ebdbb2", -- white
  },
}

local M = {}


-------------------------------------------------------------------------------
-- Default variables
-------------------------------------------------------------------------------
M.useless_gap                      = 5
M.font                             = font

M.bg_normal                        = theme.gruvbox.background
M.bg_focus                         = theme.gruvbox.background
M.bg_urgent                        = theme.gruvbox.background
M.bg_minimize                      = theme.gruvbox.background

M.fg_normal                        = theme.gruvbox.foreground
M.fg_focus                         = theme.gruvbox.foreground
M.fg_urgent                        = theme.gruvbox.color9
M.fg_minimize                      = theme.gruvbox.foreground

M.border_width                     = 3
M.border_color_active              = theme.gruvbox.color4
M.border_color_normal              = theme.gruvbox.background

M.taglist_bg_focus                 = theme.gruvbox.color4
M.taglist_fg_focus                 = theme.gruvbox.background

M.bg_systray                       = theme.gruvbox.background

-------------------------------------------------------------------------------
-- hotkeys
-------------------------------------------------------------------------------
M.hotkeys_border_color             = theme.gruvbox.color4
M.hotkeys_modifiers_fg             = theme.gruvbox.foreground
M.hotkeys_font                     = font
M.hotkeys_description_font         = font
M.hotkeys_group_margin             = 10

-------------------------------------------------------------------------------
-- layout
-------------------------------------------------------------------------------
M.layout_fairh                     = icons .. "fairhw.png"
M.layout_fairv                     = icons .. "fairvw.png"
M.layout_floating                  = icons .. "floatingw.png"
M.layout_magnifier                 = icons .. "magnifierw.png"
M.layout_max                       = icons .. "maxw.png"
M.layout_fullscreen                = icons .. "fullscreenw.png"
M.layout_tilebottom                = icons .. "tilebottomw.png"
M.layout_tileleft                  = icons .. "tileleftw.png"
M.layout_tile                      = icons .. "tilew.png"
M.layout_tiletop                   = icons .. "tiletopw.png"
M.layout_spiral                    = icons .. "spiralw.png"
M.layout_dwindle                   = icons .. "dwindlew.png"
M.layout_cornernw                  = icons .. "cornernww.png"
M.layout_cornerne                  = icons .. "cornernew.png"
M.layout_cornersw                  = icons .. "cornersww.png"
M.layout_cornerse                  = icons .. "cornersew.png"

-------------------------------------------------------------------------------
-- systray
-------------------------------------------------------------------------------
M.bg_systray                       = theme.gruvbox.background
M.systray_max_rows                 = nil
M.systray_icon_spacing             = 5

return M
