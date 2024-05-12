local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("themes.colorsheme")

local textclock = wibox.widget {
  format = "%a %b %d %I:%M %p",
  widget = wibox.widget.textclock
}
local mytextclock = helpers.cbackground(textclock, helpers.rrect(4), colors.base)

return mytextclock
