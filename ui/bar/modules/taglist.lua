local awful   = require("awful")
local mod     = require("config.binds.modkeys")
local helpers = require("helpers")
local colors  = require("themes.colorsheme")

local taglist = function(s)
  local taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({ mod.super }, mod.leftclick,
        function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end
      ),
      awful.button(
        { mod.super }, mod.rightclick,
        function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end
      ),
      awful.button({}, mod.rightclick, awful.tag.viewtoggle),
      awful.button({}, mod.scrollup,function(t) awful.tag.viewprev(t.screen) end),
      awful.button({}, mod.scrolldowm,function(t) awful.tag.viewnext(t.screen) end),
      awful.button({}, mod.leftclick, function(t) t:view_only() end),
    }
  }

  return helpers.cbackground(helpers.margin(taglist_widget, 4, 4, 4, 4), helpers.rrect(4), colors.crust)
end

return taglist
