local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local mod     = require("bindings.mod")
local colors  = require("themes.colorsheme")

local layoutbox = awful.widget.layoutbox {
  buttons = {
    awful.button({}, mod.leftclick, function () awful.layout.inc( 1) end),
    awful.button({}, mod.rightclick, function () awful.layout.inc(-1) end),
  }
}

local mylayoutbox = wibox.widget {
  helpers.margin(layoutbox, 4, 4, 4, 4),
  shape = helpers.rrect(4),
  bg = colors.base,
  widget = wibox.container.background
}

return mylayoutbox
