-- NOTE: https://awesomewm.org/apidoc/documentation/06-appearance.md.html
local user                     = require("config.user")
local colorscheme              = require("themes.colorsheme")
local layout_path              = os.getenv("HOME") .. "/.config/awesome/assets/icons/layouts/"

local theme                    = {}

-------------------------------------------------------------------------------
-- Default variables
-------------------------------------------------------------------------------
theme.useless_gap              = 5
theme.font                     = user.font

theme.bg_normal                = colorscheme.background
theme.bg_focus                 = colorscheme.background
theme.bg_urgent                = colorscheme.background
theme.bg_minimize              = colorscheme.background

theme.fg_normal                = colorscheme.foreground
theme.fg_focus                 = colorscheme.foreground
theme.fg_urgent                = colorscheme.red
theme.fg_minimize              = colorscheme.foreground

theme.border_width             = 3
theme.border_color_active      = colorscheme.blue
theme.border_color_normal      = colorscheme.background

theme.bg_systray               = colorscheme.background

-------------------------------------------------------------------------------
-- hotkeys
-------------------------------------------------------------------------------
theme.hotkeys_border_color     = colorscheme.blue
theme.hotkeys_modifiers_fg     = colorscheme.foreground
theme.hotkeys_font             = user.font
theme.hotkeys_description_font = user.font
theme.hotkeys_group_margin     = 10

-------------------------------------------------------------------------------
-- taglist
-------------------------------------------------------------------------------
theme.taglist_fg_empty         = colorscheme.background
theme.taglist_fg_focus         = colorscheme.blue
theme.taglist_fg_urgent        = colorscheme.red
theme.taglist_spacing          = 2

-------------------------------------------------------------------------------
-- tasklist
-------------------------------------------------------------------------------
theme.tasklist_disable_icon    = true

-------------------------------------------------------------------------------
-- layout
-------------------------------------------------------------------------------
theme.layout_fairh             = layout_path .. "fairhw.png"
theme.layout_fairv             = layout_path .. "fairvw.png"
theme.layout_floating          = layout_path .. "floatingw.png"
theme.layout_magnifier         = layout_path .. "magnifierw.png"
theme.layout_max               = layout_path .. "maxw.png"
theme.layout_fullscreen        = layout_path .. "fullscreenw.png"
theme.layout_tilebottom        = layout_path .. "tilebottomw.png"
theme.layout_tileleft          = layout_path .. "tileleftw.png"
theme.layout_tile              = layout_path .. "tilew.png"
theme.layout_tiletop           = layout_path .. "tiletopw.png"
theme.layout_spiral            = layout_path .. "spiralw.png"
theme.layout_dwindle           = layout_path .. "dwindlew.png"
theme.layout_cornernw          = layout_path .. "cornernww.png"
theme.layout_cornerne          = layout_path .. "cornernew.png"
theme.layout_cornersw          = layout_path .. "cornersww.png"
theme.layout_cornerse          = layout_path .. "cornersew.png"

return theme
