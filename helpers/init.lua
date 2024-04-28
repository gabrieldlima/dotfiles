local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

local helpers = {}

helpers.textbox = function(color, font, text)
  return wibox.widget {
    markup = '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>',
    widget = wibox.widget.textbox
  }
end

helpers.margin = function(wgt, ml, mr, mt, mb)
  return wibox.widget {
    wgt,
    widget = wibox.container.margin,
    left = dpi(ml),
    right = dpi(mr),
    top = dpi(mt),
    bottom = dpi(mb),
  }
end

return helpers
