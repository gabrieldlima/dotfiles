local awful         = require("awful")
local mod           = require("binds.mod")

local client_key = awful.keyboard.append_client_keybindings

client.connect_signal("request::default_keybindings", function ()
  client_key({
    awful.key {
      description = "toggle fullscreen",
      group = "6. client",
      modifiers = { mod.super },
      key = "f",
      on_press = function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      on_release = nil,
    },

    awful.key {
      description = "close",
      group = "6. client",
      modifiers = { mod.super, mod.shift },
      key = "c",
      on_press = function (c)
        c:kill()
      end,
      on_release = nil,
    },

    awful.key {
      description = "toggle floating",
      group = "6. client",
      modifiers = { mod.super, mod.shift },
      key = "f",
      on_press = function ()
        awful.client.floating.toggle()
      end,
      on_release = nil,
    },

    awful.key {
      description = "move to master",
      group = "6. client",
      modifiers = { mod.super, mod.shift },
      key = "Return",
      on_press = function (c)
        c:swap(awful.client.getmaster())
      end,
      on_release = nil,
    },

    awful.key {
      description = "move to screen",
      group = "6. client",
      modifiers = { mod.super },
      key = "o",
      on_press = function (c)
        c:move_to_screen()
      end,
      on_release = nil,
    },

    awful.key {
      description = "toggle keep on top",
      group = "6. client",
      modifiers = { mod.super },
      key = "t",
      on_press = function (c)
        c.ontop = not c.ontop
      end,
      on_release = nil,
    },

    awful.key {
      description = "minimize",
      group = "6. client",
      modifiers = { mod.super },
      key = "n",
      on_press = function (c)
        c.minimized = true
      end,
      on_release = nil,
    },

    awful.key {
      description = "(un)maximize",
      group = "6. client",
      modifiers = { mod.super },
      key = "m",
      on_press = function (c)
        c.maximized = not c.maximized
        c:raise()
      end ,
      on_release = nil,
    },

    awful.key {
      description = "(un)maximize vertically",
      group = "6. client",
      modifiers = { mod.super, mod.ctrl },
      key = "m",
      on_press = function (c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end ,
      on_release = nil,
    },

    awful.key {
      description = "(un)maximize horizontally",
      group = "6. client",
      modifiers = { mod.super, mod.shift },
      key = "m",
      on_press = function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end ,
      on_release = nil,
    },
  })
end)
