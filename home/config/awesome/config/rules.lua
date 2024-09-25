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

  -- Add titlebars to normal clients and dialogs
  ruled.client.append_rule {
    id         = "titlebars",
    except_any = { class = { "steam", "obsidian" } },
    rule_any   = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = true }
  }

  -- Qutebrowser
  ruled.client.append_rule {
    rule       = { class = "qutebrowser" },
    properties = { screen = 1, tag = "2" }
  }

  -- Obsidian
  ruled.client.append_rule {
    rule       = { class = "obsidian" },
    properties = { screen = 1, tag = "3" },
  }

  -- Steam
  ruled.client.append_rule {
    rule       = { class = "steam" },
    properties = { screen = 1, tag = "9", floating = true, placement = awful.placement.centered }
  }

  -- Virt Manager
  ruled.client.append_rule {
    rule       = { class = "Virt-manager" },
    properties = { screen = 1, tag = "8" },
  }

  -- Love2D
  ruled.client.append_rule {
    rule       = { class = "love" },
    properties = { floating = true },
  }

  -- sxiv
  ruled.client.append_rule {
    rule       = { class = "Sxiv" },
    properties = { floating = true, placement = awful.placement.centered },
  }

  -- 1password
  ruled.client.append_rule {
    rule       = { class = "1Password" },
    properties = { floating = true, placement = awful.placement.centered },
  }
end)
