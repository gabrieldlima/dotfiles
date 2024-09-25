local wibox = require("wibox")
local gears = require("gears")
local dpi   = require("beautiful").xresources.apply_dpi


local helpers = {}

helpers.mtext = function(color, font, text)
  return '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>'
end

helpers.textbox = function(color, font, text)
  return wibox.widget {
    markup = '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>',
    widget = wibox.widget.textbox
  }
end

helpers.margin = function(wgt, ml, mr, mt, mb, visible)
  return wibox.widget {
    wgt,
    widget = wibox.container.margin,
    left = dpi(ml),
    right = dpi(mr),
    top = dpi(mt),
    bottom = dpi(mb),
    visible = visible
  }
end

helpers.rrect = function(radius)
  radius = radius or dpi(4)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, radius)
  end
end

helpers.cbackground = function(widget, shape, bg)
  return wibox.widget {
    widget,
    shape = shape,
    bg = bg,
    widget = wibox.container.background
  }
end

-- Module: gears.color
-- NOTE: https://awesomewm.org/doc/api/libraries/gears.color.html#recolor_image
-- -----------------------------------------------------------------------------
helpers.recolor_image = function(image, color)
  return gears.color.recolor_image(image, color)
end

return helpers
