local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("themes.colorsheme")
local user    = require("config.user")

local logo = wibox.widget {
  image = helpers.gcolor_recolorimg(user.config.home .. "/.config/awesome/assets/logos/awesome64.png", colors.blue),
  valign = "center",
  halign = "center",
  forced_height = 20,
  forced_width = 20,
  resize = true,
  widget = wibox.widget.imagebox,
}
local mylogo = helpers.cbackground(helpers.margin(logo, 4, 4, 0, 0), helpers.rrect(4), colors.crust)

return mylogo
