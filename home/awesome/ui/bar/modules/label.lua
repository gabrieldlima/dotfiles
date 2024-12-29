local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")
local user    = require("config.user")

-- Create a label widget
-- =============================================================================
local label_text  = "  awesome  "
local font = user.config.font

local label = wibox.widget {
  markup = helpers.mtext(colors.lavender, font, label_text),
  widget = wibox.widget.textbox
}
local mylabel = helpers.cbackground(label, helpers.rrect(4), colors.background)

return mylabel
