local awful = require("awful")
local wibox = require("wibox")
local mod  = require("bindings.mod")

local home = "/home/gabriel/"

--
-- [[ Wibar ]]
--
screen.connect_signal("request::desktop_decoration", function(s)
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
  -- awful.tag({ "一", "二", "三", "四", "五", "六", "七", "八", "九", "〇" }, s, awful.layout.layouts[1])

  -- Create a imagebox with Nix logo
  local nixos_logo = wibox.widget {
    image = home .. ".config/awesome/assets/nix.svg",
    valign = "center",
    halign = "center",
    forced_height = 26,
    forced_width = 26,
    resize = true,
    widget = wibox.widget.imagebox,
  }

  -- Create a taglist widget
  s.taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
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

  -- Create a tasklist widget
  s.tasklist_widget = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
  }

  -- Create a textclock widget
  s.textclock_widget = wibox.widget {
    format = "%a %b %d %I:%M %p ",
    widget = wibox.widget.textclock
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

  -- Create the wibox
  s.wibox = awful.wibar {
    position = "top",
    screen   = s,
    widget   = {
      layout = wibox.layout.align.horizontal,

      -- Left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        nixos_logo,
        s.taglist_widget,
      },

      -- Center widgets
      s.tasklist_widget,

      -- Left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        s.textclock_widget,
        s.layoutbox_widget,
      },
    }
  }
end)
