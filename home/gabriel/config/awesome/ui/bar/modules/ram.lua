local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local colors    = require("theme.colorsheme")
local helpers   = require("helpers")
local user      = require("config.user")

-- local memory_widget = wibox.widget {
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
  bash -c "free -h | awk '/Mem:/ {print $3}'"
]]

local memory_widget = wibox.widget {
  widget = wibox.widget.textbox
}

watch(cmd, 2,
  function(widget, stdout)
    widget.markup = helpers.mtext(colors.red, user.config.font, "  " .. stdout)
  end,
  memory_widget)

return helpers.cbackground(helpers.margin(memory_widget, 4, 4, 4, 4), helpers.rrect(4), colors.background)
