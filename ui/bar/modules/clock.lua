local wibox = require("wibox")

-- Create a textclock widget
local textclock = wibox.widget {
  format = "%a %b %d %I:%M %p ",
  widget = wibox.widget.textclock
}

return textclock
