local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local colors    = require("theme.colorsheme")
local helpers   = require("helpers")
local user      = require("config.user")

local cmd = [[
  bash -c "cat /sys/class/net/eno1/operstate"
]]

local network_widget = wibox.widget {
  widget = wibox.widget.textbox,
}

watch(cmd, 2,
  function(widget, stdout)
    widget.markup = helpers.mtext(colors.background, user.config.font, "󰈀 NET ") ..
                    helpers.mtext(colors.background, user.config.font, stdout)
  end,
  network_widget)

return helpers.cbackground(helpers.margin(network_widget, 4, 4, 4, 4), helpers.rrect(4), colors.blue)
