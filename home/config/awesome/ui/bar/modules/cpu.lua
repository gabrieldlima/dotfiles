local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local colors    = require("theme.colorsheme")
local helpers   = require("helpers")
local user      = require("config.user")

-- local cpu_widget = wibox.widget {
--   {
--     {
--       align = "center",
--       valign = "center",
--       widget = wibox.widget.textbox
--     },
--     widget = wibox.container.background
--   },
--   mix_value = 0,
--   max_value = 100,
--   rounded_edge = false,
--   thickness = 6,
--   start_angle = 4.71238898,
--   forced_height = 22,
--   forced_width = 22,
--   bg = colors.mantle,
--   widget = wibox.container.arcchart
-- }

local cmd = [[
  bash -c "echo $(top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print int(100 - $1)\"%\"}')"
]]

local cpu_widget = wibox.widget {
  widget = wibox.widget.textbox
}

watch(cmd, 2,
  function(widget, stdout)
    widget.markup = helpers.mtext(colors.green, user.config.font, " " .. stdout)
  end,
  cpu_widget)

return helpers.cbackground(helpers.margin(cpu_widget, 4, 4, 4, 4), helpers.rrect(4), colors.background)
