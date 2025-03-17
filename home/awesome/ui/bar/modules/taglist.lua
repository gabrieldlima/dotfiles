local awful   = require("awful")
local wibox   = require("wibox")
local helpers = require("helpers")
local colors  = require("theme.colorsheme")

local buttons = {
  awful.button {
    description = "move_to_tag",
    modifiers = { "Mod1" },
    button = 1,
    on_press = function (t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end,
  },

  awful.button {
    description = "toggle_tag",
    modifiers = { "Mod1" },
    button = 3,
    on_press = function (t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end,
  },

  awful.button {
    description = "viewtoggle",
    button = 3,
    on_press = function (t)
      awful.tag.viewtoggle(t)
    end,
  },

  awful.button {
    description = "viewprev",
    button = 5,
    on_press = function (t)
      awful.tag.viewprev(t.screen)
    end,
  },

  awful.button {
    description = "viewnext",
    button = 4,
    on_press = function (t)
      awful.tag.viewnext(t.screen)
    end,
  },

  awful.button {
    description = "view_only",
    button = 1,
    on_press = function (t)
      t:view_only()
    end,
  },
}

local taglist = function (s)
  local taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = buttons,
    layout  = wibox.layout.fixed.horizontal,
    style = {
      -- font    = "JetBrains Mono Bold 10",
      spacing = 10,
      shape   = helpers.rrect(5),
      bg_focus    = colors.blue,
      fg_focus    = colors.background,
      bg_occupied = colors.background,
      fg_occupied = colors.lavender,
      bg_empty    = colors.background,
      fg_empty    = colors.surface0,
      bg_urgent   = colors.background,
      fg_urgent   = colors.red,
    },

    -- widget_template = {
    --   widget = wibox.container.background,
    --   shape  = helpers.rrect(10),
    --
    --   create_callback = function (self, c3, _)
    --     helpers.tagcolor(self, c3)
    --   end,
    --
    --   update_callback = function (self, c3, _)
    --     helpers.tagcolor(self, c3)
    --   end,
    -- }
  }

  return taglist_widget
  -- return helpers.cbackground(helpers.margin(taglist_widget, 0, 0, 0, 0), helpers.rrect(2), colors.crust)
end

return taglist
