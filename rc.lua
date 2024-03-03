-- ----------------------------------------------------------------------------------------
--  █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗██╗    ██╗███╗   ███╗ --
-- ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝██║    ██║████╗ ████║ --
-- ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗  ██║ █╗ ██║██╔████╔██║ --
-- ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║╚██╔╝██║ --
-- ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗╚███╔███╔╝██║ ╚═╝ ██║ --
-- ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝     ╚═╝ --
-----------------------------------------------------------------------------------------

--
-- [[ Awesome modules ]]
--
require("bindings")
require("rules")
require("signals")

local apps = require("apps")
local mod  = require("bindings.mod")

local awful = require("awful") -- Standard awesome library
require("awful.autofocus")
local gears = require("gears")
local wibox = require("wibox") -- Widget and layout library
local beautiful = require("beautiful")-- Theme handling library
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys") -- Enable hotkeys help widget for VIM and other appsk

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

--
-- [[ Menu ]]
--
-- Create a launcher widget and a main menu
local myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", apps.terminal .. " -e man awesome" },
  { "edit config", apps.terminal .. " -e " .. apps.editor .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({
  items = {
    { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", apps.terminal }
  }
})

-- Menubar configuration
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it


--
-- [[ Tag layout ]]
--
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
  })
end)
-- }}}


--
-- [[ Wibar ]]
--
screen.connect_signal("request::desktop_decoration", function(s)
  -- Each screen has its own tag table.
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -- Create a taglist widget
  s.taglist_widget = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button(
        {}, mod.leftclick,
        function(t) t:view_only() end
      ),
      awful.button(
        { mod.super }, mod.leftclick,
        function(t)
          if client.focus then
            client.focus:move_to_tag(t)
          end
        end
      ),
      awful.button(
        {}, mod.rightclick,
        awful.tag.viewtoggle
      ),
      awful.button(
        { mod.super }, mod.rightclick,
        function(t)
          if client.focus then
            client.focus:toggle_tag(t)
          end
        end
      ),
      awful.button(
        {}, mod.scrollup,
        function(t) awful.tag.viewprev(t.screen) end
      ),
      awful.button(
        {}, mod.scrolldowm,
        function(t) awful.tag.viewnext(t.screen) end
      ),
    }
  }

  -- Create a tasklist widget
  s.tasklist_widget = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
  }

  -- Create a textclock widget
  s.textclock_widget = wibox.widget {
    format = "%a %b %d %I:%M %p ",
    widget = wibox.widget.textclock
  }

  -- Create a layoutbox widget
  s.layoutbox_widget = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button(
        {}, mod.leftclick,
        function () awful.layout.inc( 1) end
      ),
      awful.button(
        {}, mod.rightclick,
        function () awful.layout.inc(-1) end
      ),
    }
  }

  -- Create the wibox
  s.wibox = awful.wibar {
    position = "top",
    screen   = s,
    widget   = {
      layout = wibox.layout.align.horizontal,

      -- Left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        s.taglist_widget,
      },

      -- Center widgets
      s.tasklist_widget,

      -- Left widgets
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.widget.systray(),
        s.textclock_widget,
        s.layoutbox_widget,
      },
    }
  }
end)
