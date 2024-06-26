local awful   = require("awful")
local mod     = require("config.binds.modkeys")
local helpers = require("helpers")
local colors  = require("themes.colorsheme")

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

local taglist = function (s)
  local taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = buttons
  }

  return helpers.cbackground(helpers.margin(taglist_widget, 4, 4, 4, 4), helpers.rrect(4), colors.background)
end

return taglist
