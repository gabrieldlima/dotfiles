local awful   = require("awful")
local helpers = require("helpers")
local mod     = require("binds.mod")
local colors  = require("theme.colorsheme")

local layoutbox = awful.widget.layoutbox {
  buttons = {
    awful.button({}, mod.leftclick, function () awful.layout.inc( 1) end),
    awful.button({}, mod.rightclick, function () awful.layout.inc(-1) end),
  }
}
local mylayoutbox = helpers.cbackground(helpers.margin(layoutbox, 5, 5, 5, 5), helpers.rrect(4), colors.background)

return mylayoutbox
