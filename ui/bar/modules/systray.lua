local wibox   = require("wibox")
local helpers = require("helpers")
local color   = require("themes.colorsheme")

local font      = "FiraCode Nerd Font Bold 12"

-- Option 1:  | 
-- Option 2:  | 
local show_icon = ""
local hide_icon = ""

local icon = helpers.textbox(color.foreground, font, show_icon)
local tray_toggle = helpers.margin(icon, 4, 4, 4, 4)
local systray = helpers.margin({ base_size = 20, widget = wibox.widget.systray }, 5, 5, 5, 5, false)
local togglableSystray = helpers.cbackground({ systray, tray_toggle, layout = wibox.layout.fixed.horizontal }, helpers.rrect(4), color.crust)

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
