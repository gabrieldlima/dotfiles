local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local colors    = require("theme.colorsheme")
local helpers   = require("helpers")
local user      = require("config.user")

local arc_cpu = {}

local text = wibox.widget {
  align = "center",
  valign = "center",
  widget = wibox.widget.textbox
}

local textbg = wibox.widget {
  text,
  widget = wibox.container.background
}

arc_cpu = wibox.widget {
  textbg,
  mix_value = 0,
  max_value = 100,
  rounded_edge = false,
  thickness = 6,
  start_angle = 4.71238898,
  forced_height = 22,
  forced_width = 22,
  bg = "#363a4f",
  widget = wibox.container.arcchart
}

watch(user.config.home .. "/.config/awesome/config/cpu.sh", 2,
  function(widget, stdout)
    widget.value = stdout
    widget.colors = { colors.green }
  end,
  arc_cpu)

return helpers.cbackground(helpers.margin(arc_cpu, 4, 4, 4, 4), helpers.rrect(4), colors.crust)
