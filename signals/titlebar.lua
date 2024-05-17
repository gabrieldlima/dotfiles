local awful       = require("awful")
local wibox       = require("wibox")
local mod         = require("config.binds.modkeys")
local helpers     = require("helpers")

client.connect_signal("request::titlebars", function(c)
  local buttons = {
    awful.button(
      { }, mod.leftclick,
      function() c:activate { context = "titlebar", action = "mouse_move" } end
    ),
    awful.button(
      { }, mod.rightclick,
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
