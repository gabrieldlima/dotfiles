local awful     = require("awful")
local wibox     = require("wibox")
local watch     = require("awful.widget.watch")
local colors    = require("theme.colorsheme")
local helpers   = require("helpers")
local user      = require("config.user")
local mod       = require("binds.mod")

local buttons = {
  awful.button {
    description = "open pavucontrol",
    modifiers = {},
    button = mod.rightclick,
    on_press = function ()
      awful.spawn("pavucontrol", false)
    end,
    on_release = nil,
  },
  awful.button {
    description = "open pavucontrol",
    modifiers = {},
    button = mod.leftclick,
    on_press = function ()
      awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false)
    end,
    on_release = nil,
  },
}

local cmd = [[
  bash -c "pactl get-sink-volume @DEFAULT_SINK@ | grep 'Volume:' | awk '{print $5}'"
]]

local volume_widget = wibox.widget {
  widget = wibox.widget.textbox,
  buttons = buttons
}

watch(cmd, 2,
  function(widget, stdout)
    awful.spawn.easy_async_with_shell("pactl get-sink-mute @DEFAULT_SINK@", function (is_muted)
      is_muted = is_muted:match("yes")
      if is_muted then
        widget.markup = helpers.mtext(colors.background, user.config.font, "󰖁 VOL ") ..
                        helpers.mtext(colors.background, user.config.font, "off")
      else
        widget.markup = helpers.mtext(colors.background, user.config.font, "󰕾 VOL ") ..
                        helpers.mtext(colors.background, user.config.font, stdout)
      end
    end)
  end,
  volume_widget)

return helpers.cbackground(helpers.margin(volume_widget, 4, 4, 4, 4), helpers.rrect(4), colors.blue)
