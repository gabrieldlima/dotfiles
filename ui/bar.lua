local awful = require("awful")
local wibox = require("wibox")
local mod  = require("bindings.mod")
local helpers = require("helpers")


--
-- [[ Wibar ]]
--
screen.connect_signal("request::desktop_decoration", function(s)

  -----------------------------------------------------------------------------
  -- Widgets
  -----------------------------------------------------------------------------
  s.nixos_logo = require('ui.modules.nixos_logo')
  s.textclock  = require("ui.modules.textclock")

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

  -- Create a layoutbox widget
  s.layoutbox_widget = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button(
        {}, mod.leftclick,
        function () awful.layout.inc( 1) end
      ),
      awful.button(
        {}, mod.rightclick,
        function () awful.layout.inc(-1) end
      ),
    }
  }

  -----------------------------------------------------------------------------
  -- Create the wibox
  -----------------------------------------------------------------------------
  s.wibox = awful.wibar {
    position = "top",
    screen   = s,
    widget   = {
      layout = wibox.layout.align.horizontal,

      -- Left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        s.nixos_logo,
        s.taglist_widget,
      },

      -- Center widgets
      {
        layout = wibox.layout.fixed.horizontal,
      },

      -- Right widgets
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        s.textclock,
        helpers.margin(s.layoutbox_widget, 4, 4, 4, 4)
      },
    }
  }
end)
