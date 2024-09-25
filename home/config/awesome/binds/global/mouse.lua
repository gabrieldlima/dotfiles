local awful = require("awful")
local mod   = require("binds.mod")

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
