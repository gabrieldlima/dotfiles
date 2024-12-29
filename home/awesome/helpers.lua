local wibox   = require("wibox")
local gears   = require("gears")
local dpi     = require("beautiful").xresources.apply_dpi
local colors  = require("theme.colorsheme")

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

helpers.tagcolor = function(self, c3)
    if c3.selected then
        self.bg = colors.blue
        self.forced_width = 40
    elseif #c3:clients() == 0 then
        self.bg = colors.base
        self.forced_width = 12
    else
        self.bg = colors.lavender
        self.forced_width = 12
    end
end

helpers.recolor_image = function(image, color)
  return gears.color.recolor_image(image, color)
end

return helpers
