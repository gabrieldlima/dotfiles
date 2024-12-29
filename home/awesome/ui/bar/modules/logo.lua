local awful   = require("awful")
local wibox   = require("wibox")
local mod     = require("binds.mod")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")
local user    = require("config.user")

local buttons = {
  awful.button {
    description = "open launcher",
    modifiers = { },
    button = mod.leftclick,
    on_press = function()
      awful.spawn(user.apps.launcher)
    end,
    on_release = nil,
  },
}

local logo = wibox.widget {
  image = helpers.recolor_image(user.config.home .. "/.config/awesome/theme/assets/logos/nix.svg", colors.blue),
  valign = "center",
  halign = "center",
  forced_height = 28,
  forced_width = 28,
  resize = true,
  buttons = buttons,
  widget = wibox.widget.imagebox,
}
local mylogo = helpers.cbackground(helpers.margin(logo, 4, 4, 0, 0), helpers.rrect(4), colors.background)

return mylogo
