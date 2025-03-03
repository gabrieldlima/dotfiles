local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-----------------------------------------------------------------------------
-- Widgets
-----------------------------------------------------------------------------
local clock      = require("ui.bar.modules.clock")
local layoutbox  = require("ui.bar.modules.layoutbox")
local logo       = require("ui.bar.modules.logo")
local systray    = require("ui.bar.modules.systray")
local taglist    = require("ui.bar.modules.taglist")
local tasklist   = require("ui.bar.modules.tasklist")

awful.screen.connect_for_each_screen(function(s)

  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -----------------------------------------------------------------------------
  -- Bar
  -----------------------------------------------------------------------------

  s.bar = awful.wibar {
    position = "top",
    screen   = s,
    visible  = true,
    ontop    = false,
    width    = 2542,
    height   = 40,
    type     = "dock",
    margins  = { top = 10 },
    shape    = helpers.rrect(10),
  }

  s.bar:setup {
    {
      {
        -- Left widgets
        {
          helpers.margin(logo, 4, 4, 8, 8),
          helpers.margin(taglist(s), 4, 4, 5, 5),
          layout = wibox.layout.fixed.horizontal,
        },

        -- Center widgets
        {
          helpers.margin(tasklist(s), 4, 4, 5, 5),
          layout = wibox.layout.flex.horizontal,
        },

        -- Right widgets
        {
          helpers.margin(systray, 4, 4, 8, 8),
          helpers.margin(clock, 4, 4, 8, 8),
          helpers.margin(layoutbox, 4, 4, 4, 4),
          layout = wibox.layout.fixed.horizontal,
        },
        expand = "none",
        layout = wibox.layout.align.horizontal,
      },
      layout = wibox.layout.stack
    },
    widget = wibox.container.background,
    bg = colors.background,
  }
end)
