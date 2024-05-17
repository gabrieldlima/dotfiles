local awful = require("awful")
local mod   = require("config.binds.modkeys")

-- Global mouse
awful.mouse.append_global_mousebindings({
  awful.button(
    { }, mod.rightclick,
    function () mymainmenu:toggle() end
  ),
  awful.button(
    { mod.super }, mod.sideupclick,
    awful.tag.viewnext
  ),
  awful.button(
    { mod.super }, mod.sidedownclick,
    awful.tag.viewprev
  )
})

-- Client mouse
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
