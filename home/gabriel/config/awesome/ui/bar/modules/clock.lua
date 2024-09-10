local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-- Clock widget
--------------------------------------------------------------------------------
local textclock = wibox.widget {
  -- format = "%I:%M %p",
  format = "%a %b %d %I:%M %p",
  widget = wibox.widget.textclock
}
local mytextclock = helpers.cbackground(textclock, helpers.rrect(4), colors.background)

-- Calendar widget
--------------------------------------------------------------------------------
local calendar = awful.widget.calendar_popup.month {
  margin = 10,
  spacing = 10,
  week_numbers = false,
  long_weekdays = false,
  shape = helpers.rrect(10),

  style_month = {
    fg_color     = colors.foreground,
    bg_color     = colors.background,
    padding      = 10,
    border_width = 0,
    border_color = colors.overlay0,
  },
  style_header = {
    fg_color = colors.foreground,
    bg_color = colors.background,
    shape = helpers.rrect(4)
  },
  style_weekday = { fg_color = colors.foreground },
  style_normal = { fg_color = colors.subtext0 },
  style_focus = { fg_color = colors.blue },
}
calendar:attach(mytextclock, "t", { on_hover = false })

return mytextclock
