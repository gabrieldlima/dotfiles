local awful   = require("awful")
local ruled   = require("ruled")
local naughty = require("naughty")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    urgency = "critical",
    title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
    message = message,
    border_color = colors.background,
    border_width = 2,
    shape = helpers.rrect(0),
    position = "top_right"
  }
end)

ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule {
    rule       = { },
    properties = {
      screen           = awful.screen.preferred,
      implicit_timeout = 5,
    }
  }
end)

naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n }
end)
