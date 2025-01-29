local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)

tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
  })
end)


client.connect_signal("request::titlebars", function(c)
  local buttons = {
    awful.button(
      { }, 1,
      function() c:activate { context = "titlebar", action = "mouse_move" } end
    ),
    awful.button(
      { }, 3,
      function() c:activate { context = "titlebar", action = "mouse_resize"} end
    ),
  }

  awful.titlebar(c).widget = {
    -- Left
    {
      helpers.margin(awful.titlebar.widget.iconwidget(c), 3, 3, 3, 3),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },

    -- Middle
    {
      {
        halign = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },

    -- Right
    {
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end)
