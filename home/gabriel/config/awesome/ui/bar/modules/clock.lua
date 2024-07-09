local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-- Clock widget
--------------------------------------------------------------------------------
local textclock = wibox.widget {
  format = " %a %b %d %I:%M %p ",
  widget = wibox.widget.textclock
}
local mytextclock = helpers.cbackground(textclock, helpers.rrect(4), colors.crust)

-- Calendar widget
--------------------------------------------------------------------------------
local calendar = awful.widget.calendar_popup.month {
  margin = 10,
  spacing = 10,
  week_numbers = false,
  long_weekdays = false,

  style_month = {
    fg_color     = colors.foreground,
    bg_color     = colors.background,
    padding      = 10,
    border_width = 3,
    border_color = colors.blue,
  },
  style_header = {
    fg_color = colors.foreground,
    bg_color = colors.crust,
    shape = helpers.rrect(4)
  },
  style_weekday = { fg_color = colors.lavender },
  style_normal = { fg_color = colors.subtext0 },
  style_focus = { fg_color = colors.blue },
}
calendar:attach(mytextclock, "tc", { on_hover = false })

return mytextclock
