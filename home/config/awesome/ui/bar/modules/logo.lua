local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")
local user    = require("config.user")

local logo = wibox.widget {
  image = helpers.recolor_image(user.config.home .. "/.config/awesome/theme/assets/logos/nix.svg", colors.blue),
  valign = "center",
  halign = "center",
  forced_height = 28,
  forced_width = 28,
  resize = true,
  widget = wibox.widget.imagebox,
}
local mylogo = helpers.cbackground(helpers.margin(logo, 4, 4, 0, 0), helpers.rrect(4), colors.background)

return mylogo
