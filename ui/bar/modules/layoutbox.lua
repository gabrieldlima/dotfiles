local awful   = require("awful")
local helpers = require("helpers")
local mod     = require("config.mod")
local colors  = require("themes.colorsheme")

local layoutbox = awful.widget.layoutbox {
  buttons = {
    awful.button({}, mod.leftclick, function () awful.layout.inc( 1) end),
    awful.button({}, mod.rightclick, function () awful.layout.inc(-1) end),
  }
}
local mylayoutbox = helpers.cbackground(helpers.margin(layoutbox, 4, 4, 4, 4), helpers.rrect(4), colors.crust)

return mylayoutbox
