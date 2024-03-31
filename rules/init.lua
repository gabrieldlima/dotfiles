local awful = require("awful")
local ruled = require("ruled")

--
-- [[ Rules to apply to new clients ]]
--
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id         = "global",
    rule       = { },
    properties = {
      focus     = awful.client.focus.filter,
      raise     = true,
      screen    = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  }

  -- Qutebrowser
  ruled.client.append_rule {
    rule       = { class = "qutebrowser" },
    properties = { screen = 1, tag = "2" }
  }

  -- Steam
  ruled.client.append_rule {
    rule       = { class = "steam" },
    properties = { screen = 1, tag = "9" }
  }
end)
