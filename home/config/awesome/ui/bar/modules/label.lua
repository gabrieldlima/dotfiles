local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-- Create a label widget
-- =============================================================================
local label_text  = "  awesome  "
local font = "FiraCode Nerd Font Bold 10"

local label = wibox.widget {
  markup = helpers.mtext(colors.lavender, font, label_text),
  widget = wibox.widget.textbox
}
local mylabel = helpers.cbackground(label, helpers.rrect(4), colors.background)

return mylabel
