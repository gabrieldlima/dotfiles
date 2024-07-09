local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-----------------------------------------------------------------------------
-- Widgets
-----------------------------------------------------------------------------
local logo       = require("ui.bar.modules.logo")
local systray    = require("ui.bar.modules.systray")
local clock      = require("ui.bar.modules.clock")
local layoutbox  = require("ui.bar.modules.layoutbox")
local taglist    = require("ui.bar.modules.taglist")
local screenshot = require("ui.bar.modules.screenshot")
local cpu        = require("ui.bar.modules.cpu")
local ram        = require("ui.bar.modules.ram")

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
    width    = 1920,
    height   = 40,
    type     = "dock",
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
