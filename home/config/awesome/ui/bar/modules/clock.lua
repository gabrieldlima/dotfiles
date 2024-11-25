local awful     = require("awful")
local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local colors    = require("theme.colorsheme")
local helpers   = require("helpers")
local user      = require("config.user")

-- Clock widget
--------------------------------------------------------------------------------
-- '+%a %b %d %I:%M %p'
local cmd = [[
  bash -c "date '+%a %b %d %I:%M %p'"
]]

local textclock = wibox.widget {
  widget = wibox.widget.textbox
}

watch(cmd, 30,
  function(widget, stdout)
    widget.markup = helpers.mtext(colors.pink, user.config.font, "") ..
                    helpers.mtext(colors.foreground, user.config.font, stdout)
  end,
  textclock)
local mytextclock = helpers.cbackground(helpers.margin(textclock, 0, 4, 4, 4), helpers.rrect(4), colors.background)

-- Calendar widget
--------------------------------------------------------------------------------
local calendar = awful.widget.calendar_popup.month {
  margin = 10,
  spacing = 10,
  week_numbers = false,
  long_weekdays = false,
  shape = helpers.rrect(10),
  start_sunday = true,

  style_month = {
    fg_color     = colors.foreground,
    bg_color     = colors.background,
    padding      = 10,
    border_width = 3,
    border_color = colors.blue,
    shape = helpers.rrect(7)
  },
  style_header = {
    fg_color = colors.background,
    bg_color = colors.blue,
    shape = helpers.rrect(4)
  },
  style_weekday = { fg_color = colors.foreground },
  style_normal = { fg_color = colors.subtext0 },
  style_focus = { fg_color = colors.background, bg_color = colors.blue, shape = helpers.rrect(4) },
}
calendar:attach(mytextclock, "tc", { on_hover = false })

return mytextclock
