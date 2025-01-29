-- NOTE: https://awesomewm.org/apidoc/documentation/06-appearance.md.html
local helpers       = require("helpers")
local user          = require("config.user")
local color         = require("theme.colorsheme")
local layout_icons   = user.config.home .. "/.config/awesome/theme/icons/layouts/"
local titlebar_icons = user.config.home .. "/.config/awesome/theme/icons/titlebar/"

local theme = {}

-------------------------------------------------------------------------------
-- Default variables
-------------------------------------------------------------------------------
theme.useless_gap                      = 5
theme.font                             = user.config.font

theme.bg_normal                        = color.background
theme.bg_focus                         = color.background
theme.bg_urgent                        = color.background
theme.bg_minimize                      = color.background

theme.fg_normal                        = color.foreground
theme.fg_focus                         = color.foreground
theme.fg_urgent                        = color.red
theme.fg_minimize                      = color.foreground

theme.border_width                     = 2
theme.border_color_active              = color.blue
theme.border_color_normal              = color.background

theme.bg_systray                       = color.background

-------------------------------------------------------------------------------
-- hotkeys
-------------------------------------------------------------------------------
theme.hotkeys_border_color             = color.blue
theme.hotkeys_modifiers_fg             = color.foreground
theme.hotkeys_font                     = user.config.font
theme.hotkeys_description_font         = user.config.font
theme.hotkeys_group_margin             = 10

-------------------------------------------------------------------------------
-- layout
-------------------------------------------------------------------------------
theme.layout_fairh                     = layout_icons .. "fairhw.png"
theme.layout_fairv                     = layout_icons .. "fairvw.png"
theme.layout_floating                  = layout_icons .. "floatingw.png"
theme.layout_magnifier                 = layout_icons .. "magnifierw.png"
theme.layout_max                       = layout_icons .. "maxw.png"
theme.layout_fullscreen                = layout_icons .. "fullscreenw.png"
theme.layout_tilebottom                = layout_icons .. "tilebottomw.png"
theme.layout_tileleft                  = layout_icons .. "tileleftw.png"
theme.layout_tile                      = layout_icons .. "tilew.png"
theme.layout_tiletop                   = layout_icons .. "tiletopw.png"
theme.layout_spiral                    = layout_icons .. "spiralw.png"
theme.layout_dwindle                   = layout_icons .. "dwindlew.png"
theme.layout_cornernw                  = layout_icons .. "cornernww.png"
theme.layout_cornerne                  = layout_icons .. "cornernew.png"
theme.layout_cornersw                  = layout_icons .. "cornersww.png"
theme.layout_cornerse                  = layout_icons .. "cornersew.png"

theme.taglist_bg_focus = color.red

--------------------------------------------------------------------------------
-- titlebar
-------------------------------------------------------------------------------
theme.titlebar_bg                       = color.background
theme.titlebar_bg_focus                 = color.background

-- Close Button
theme.titlebar_close_button_normal      = helpers.recolor_image(titlebar_icons .. "button_normal.png", color.surface0)
theme.titlebar_close_button_focus       = helpers.recolor_image(titlebar_icons .. "button_close.png", color.red)
theme.titlebar_close_button_focus_hover = titlebar_icons .. "button_close.png"
------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- systray
-------------------------------------------------------------------------------
theme.bg_systray                       = color.background
theme.systray_max_rows                 = nil
theme.systray_icon_spacing             = 5

return theme
