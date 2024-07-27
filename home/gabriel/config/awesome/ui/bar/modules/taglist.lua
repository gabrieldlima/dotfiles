local awful   = require("awful")
local wibox   = require("wibox")
local mod     = require("binds.mod")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

local buttons = {
  awful.button {
    description = "move_to_tag",
    modifiers = { mod.super },
    button = mod.leftclick,
    on_press = function (t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end,
    on_release = nil,
  },

  awful.button {
    description = "toggle_tag",
    modifiers = { mod.super },
    button = mod.rightclick,
    on_press = function (t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end,
    on_release = nil,
  },

  awful.button {
    description = "viewtoggle",
    modifiers = {},
    button = mod.rightclick,
    on_press = function (t)
      awful.tag.viewtoggle(t)
    end,
    on_release = nil,
  },

  awful.button {
    description = "viewprev",
    modifiers = {},
    button = mod.scrollup,
    on_press = function (t)
      awful.tag.viewprev(t.screen)
    end,
    on_release = nil,
  },

  awful.button {
    description = "viewnext",
    modifiers = {},
    button = mod.scrolldowm,
    on_press = function (t)
      awful.tag.viewnext(t.screen)
    end,
    on_release = nil,
  },

  awful.button {
    description = "view_only",
    modifiers = {},
    button = mod.leftclick,
    on_press = function (t)
      t:view_only()
    end,
    on_release = nil,
  },
}

-- Widget
-- =============================================================================
local taglist = function (s)
  local taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = buttons,
    layout  = wibox.layout.fixed.horizontal,
    style = {
      font    = nil,
      spacing = 10,
      shape   = nil,

      -- Colors
      bg_focus    = colors.background,
      fg_focus    = colors.blue,
      bg_occupied = colors.background,
      fg_occupied = colors.text,
      bg_empty    = colors.background,
      fg_empty    = colors.surface0,
      bg_urgent   = colors.background,
      fg_urgent   = colors.red,
    },

    -- TODO: Fix urgent color not working
    widget_template = {
      widget = wibox.container.background,
      shape  = helpers.rrect(10),

      create_callback = function (self, c3, _)
        if c3.selected then
          self.bg = colors.blue
          self.forced_width = 28
        elseif #c3:clients() == 0 then
          self.bg = "#363a4f"
          self.forced_width = 12
        else
          self.bg = colors.lavender
          self.forced_width = 12
        end
      end,

      update_callback = function (self, c3, _)
        if c3.selected then
          self.bg = colors.blue
          self.forced_width = 28
        elseif #c3:clients() == 0 then
          self.bg = "#363a4f"
          self.forced_width = 12
        else
          self.bg = colors.lavender
          self.forced_width = 12
        end
      end,
    }
  }

  return helpers.cbackground(helpers.margin(taglist_widget, 4, 4, 9, 9), helpers.rrect(4), colors.background)
end

return taglist
