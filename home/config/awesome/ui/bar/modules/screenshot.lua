local awful   = require("awful")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")
local user    = require("config.user")
local mod     = require("binds.mod")

local screenshot = awful.widget.button {
  image = "/home/gabriel/.config/awesome/theme/assets/icons/screenshot.png",
  buttons = {
    awful.button({}, mod.leftclick, nil, function ()
      awful.spawn(user.apps.screnshoot .. " gui -p " .. user.config.home .. "/Pictures/Screenshots", false)
    end),
    awful.button({}, mod.rightclick, nil, function ()
      awful.spawn(user.apps.screnshoot .. " screen -p " .. user.config.home .. "/Pictures/Screenshots", false)
    end),
    awful.button({}, mod.midclick, nil, function ()
      awful.spawn(user.apps.image_viewer .. " -t ".. user.config.home .. "/Pictures/Screenshots", false)
    end),
  }
}
local myscreenshot = helpers.cbackground(helpers.margin(screenshot, 5, 5, 5, 5), helpers.rrect(4), colors.background)

return myscreenshot
