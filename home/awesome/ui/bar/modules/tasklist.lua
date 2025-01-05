local awful   = require("awful")
local mod     = require("binds.mod")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

local buttons = {
  awful.button({ }, mod.leftclick, function (c) c:activate { context = "tasklist", action = "toggle_minimization" } end),
  awful.button({ }, mod.rightclick, function() awful.menu.client_list { theme = { width = 250 } } end),
  awful.button({ }, mod.scrolldown, function() awful.client.focus.byidx(-1) end),
  awful.button({ }, mod.scrollup, function() awful.client.focus.byidx( 1) end),
}

local tasklist = function (s)
  local mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
    buttons = buttons,
    style = {
      disable_icon = true
    }
  }
  return helpers.cbackground(helpers.margin(mytasklist, 4, 4, 4, 4), helpers.rrect(4), colors.background)
end

return tasklist
