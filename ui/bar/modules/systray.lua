local wibox   = require("wibox")
local dpi     = require("beautiful").xresources.apply_dpi
local helpers = require("helpers")
local color   = require("themes.colorsheme")

local font      = "FiraCode Nerd Font Bold 12"

-- Option 1:  | 
-- Option 2:  | 
local show_icon = ""
local hide_icon = ""

local icon = helpers.textbox(color.foreground, font, show_icon)
local tray_toggle = helpers.margin(icon, 4, 4, 4, 4)

local systray = wibox.widget {
  {
    base_size = 20,
    widget = wibox.widget.systray,
  },
  left    = dpi(5),
  right   = dpi(5),
  top     = dpi(5),
  bottom  = dpi(5),
  visible = false,
  widget  = wibox.container.margin,
}

local togglableSystray = wibox.widget {
  {
    systray,
    tray_toggle,
    layout = wibox.layout.fixed.horizontal,
  },
  shape  = helpers.rrect(4),
  bg     = color.base,
  widget = wibox.container.background,
}

tray_toggle:connect_signal("button::press", function(_, _, _, button)
  if button == 1 then
    systray.visible = not systray.visible
    if systray.visible then
      icon.markup = helpers.mtext(color.foreground, font, hide_icon)
    else
      icon.markup = helpers.mtext(color.foreground, font, show_icon)
    end
  end
end)

return togglableSystray
