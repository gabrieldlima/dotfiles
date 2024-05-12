local awful   = require("awful")
local wibox   = require("wibox")
local mod     = require("bindings.mod")
local helpers = require("helpers")
local colors  = require("themes.colorsheme")

-----------------------------------------------------------------------------
-- Widgets
-----------------------------------------------------------------------------
local oslogo    = require("ui.bar.modules.oslogo")
local systray   = require("ui.bar.modules.systray")
local clock     = require("ui.bar.modules.clock")
local layoutbox = require("ui.bar.modules.layoutbox")

awful.screen.connect_for_each_screen(function(s)

  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
  -- awful.tag({ "一", "二", "三", "四", "五", "六", "七", "八", "九", "〇" }, s, awful.layout.layouts[1])

  -- Create a taglist widget
  s.taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.noempty,
    buttons = {
      awful.button(
        {}, mod.leftclick,
        function(t) t:view_only() end
      ),
      awful.button(
        { mod.super }, mod.leftclick,
        function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end
      ),
      awful.button(
        {}, mod.rightclick,
        awful.tag.viewtoggle
      ),
      awful.button(
        { mod.super }, mod.rightclick,
        function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end
      ),
      awful.button(
        {}, mod.scrollup,
        function(t) awful.tag.viewprev(t.screen) end
      ),
      awful.button(
        {}, mod.scrolldowm,
        function(t) awful.tag.viewnext(t.screen) end
      ),
    }
  }

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
          helpers.margin(oslogo, 4, 4, 4, 4),
          s.taglist_widget,
          layout = wibox.layout.fixed.horizontal,
        },

        -- Center widgets
        nil,

        -- Right widgets
        {
          helpers.margin(systray, 4, 4, 4, 4),
          helpers.margin(clock, 4, 4, 4, 4),
          helpers.margin(layoutbox, 4, 4, 4, 4),
          layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.align.horizontal,
      },
      layout = wibox.layout.stack
    },
    widget = wibox.container.background,
    bg = colors.background,
  }
end)
