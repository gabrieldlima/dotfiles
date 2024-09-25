local awful = require("awful")
local mod   = require("binds.mod")

client.connect_signal("request::default_mousebindings", function()
  awful.mouse.append_client_mousebindings({
    awful.button(
      { }, mod.leftclick,
      function (c) c:activate { context = "mouse_click" } end
    ),
    awful.button(
      { mod.super }, mod.leftclick,
      function (c) c:activate { context = "mouse_click", action = "mouse_move" } end
    ),
    awful.button(
      { mod.super }, mod.rightclick,
      function (c) c:activate { context = "mouse_click", action = "mouse_resize" } end
    ),
  })
end)
