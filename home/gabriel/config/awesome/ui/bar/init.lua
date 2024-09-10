local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-----------------------------------------------------------------------------
-- Widgets
-----------------------------------------------------------------------------
local clock      = require("ui.bar.modules.clock")
local cpu        = require("ui.bar.modules.cpu")
local layoutbox  = require("ui.bar.modules.layoutbox")
local logo       = require("ui.bar.modules.logo")
local ram        = require("ui.bar.modules.ram")
local screenshot = require("ui.bar.modules.screenshot")
local systray    = require("ui.bar.modules.systray")
local taglist    = require("ui.bar.modules.taglist")

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
    width    = 1900,
    height   = 40,
    type     = "dock",
    shape    = helpers.rrect(10),
    margins  = {
      left = 0,
      right = 0,
      top = 8,
      bottom = 0,
    },
  }

  s.bar:setup {
    {
      {
        -- Left widgets
        {
          helpers.margin(logo, 4, 4, 4, 4),
          helpers.margin(taglist(s), 4, 4, 5, 5),
          layout = wibox.layout.fixed.horizontal,
        },

        -- Center widgets
        {
          helpers.margin(clock, 4, 4, 4, 4),
          layout = wibox.layout.flex.horizontal,
        },

        -- Right widgets
        {
          helpers.margin(systray, 4, 4, 4, 4),
          helpers.margin(screenshot, 4, 4, 4, 4),
          helpers.margin(cpu, 4, 4, 4, 4),
          helpers.margin(ram, 4, 4, 4, 4),
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
