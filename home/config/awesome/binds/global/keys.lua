local awful         = require("awful")
local mod           = require("binds.mod")
local user          = require("config.user")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar       = require("menubar")

local global_key = awful.keyboard.append_global_keybindings

-- ---------------------------------------------------------------------------
-- awesome group
-- ---------------------------------------------------------------------------
global_key({
  group = "1. awesome",

  awful.key {
    description = "show help",
    modifiers = { mod.super },
    key = "s",
    on_press = function ()
      hotkeys_popup.show_help()
    end,
    on_release = nil,
  },

  awful.key {
    description = "show main menu",
    modifiers = { mod.super },
    key = "w",
    on_press = function ()
      mymainmenu:show()
    end,
    on_release = nil,
  },

  awful.key {
    description = "reload awesome",
    modifiers = { mod.super, mod.ctrl },
    key = "r",
    on_press = function ()
      awesome.restart()
    end,
    on_release = nil,
  },

  awful.key {
    description = "quit awesome",
    modifiers = { mod.super, mod.shift },
    key = "q",
    on_press = function ()
      awesome.quit()
    end,
    on_release = nil,
  },
})

-- ---------------------------------------------------------------------------
-- launcher group
-- ---------------------------------------------------------------------------
global_key({
  group = "2. launcher",

  awful.key {
    description = "open terminal",
    modifiers = { mod.super },
    key = "Return",
    on_press = function ()
      awful.spawn(user.apps.terminal)
    end,
    on_release = nil,
  },

  awful.key {
    description = "open file manager",
    modifiers = { mod.super },
    key = "e",
    on_press = function ()
      awful.spawn(user.apps.file_manager)
    end,
    on_release = nil,
  },

  awful.key {
    description = "open launcher",
    modifiers = { mod.super },
    key = "p",
    on_press = function ()
      awful.spawn(user.apps.launcher)
    end,
    on_release = nil,
  },

  awful.key {
    description = "open web browser",
    modifiers = { mod.super },
    key = "b",
    on_press = function ()
      awful.spawn(user.apps.web_browser)
    end,
    on_release = nil,
  },

  awful.key {
    description = "select screenshot",
    modifiers = { mod.super, mod.shift },
    key = "s",
    on_press = function ()
      awful.spawn(user.apps.screnshoot .. " gui -p " .. user.config.home .. "/Pictures/Screenshots", false)
    end,
    on_release = nil,
  },

  awful.key {
    description = "screenshot",
    modifiers = {},
    key = "Print",
    on_press = function ()
      awful.spawn(user.apps.screnshoot .. " screen -p " .. user.config.home .. "/Pictures/Screenshots", false)
    end,
    on_release = nil,
  },
})

-- ---------------------------------------------------------------------------
-- tag group
-- ---------------------------------------------------------------------------
global_key({
  group = "3. tag",

  awful.key {
    description = "view previous",
    modifiers = { mod.super },
    key = "Left",
    on_press = function ()
      awful.tag.viewprev()
    end,
    on_release = nil,
  },

  awful.key {
    description = "view next",
    modifiers = { mod.super },
    key = "Right",
    on_press = function ()
      awful.tag.viewnext()
    end,
    on_release = nil,
  },

  awful.key {
    description = "go back",
    modifiers = { mod.super },
    key = "Escape",
    on_press = function ()
      awful.tag.history.restore()
    end,
    on_release = nil,
  },

  awful.key {
    description = "only view tag",
    keygroup = "numrow",
    modifiers = { mod.super },
    on_press = function (index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
    on_release = nil,
  },

  awful.key {
    description = "toggle tag",
    keygroup = "numrow",
    modifiers = { mod.super, mod.ctrl },
    on_press = function (index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
    on_release = nil,
  },

  awful.key {
    description = "move focused client to tag",
    keygroup = "numrow",
    modifiers = { mod.super, mod.shift },
    on_press = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
    on_release = nil,
  },

  awful.key {
    description = "toggle focused client on tag",
    keygroup = "numrow",
    modifiers = { mod.super, mod.ctrl, mod.shift },
    on_press = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
    on_release = nil,
  },
})

-- ---------------------------------------------------------------------------
-- screen group
-- ---------------------------------------------------------------------------
global_key({
  group = "4. screen",

  awful.key {
    modifiers = { mod.super, mod.ctrl },
    key = "j",
    on_press = function ()
      awful.screen.focus_relative(1)
    end,
    on_release = nil,
    description = "focus the next screen",
  },

  awful.key {
    modifiers = { mod.super, mod.ctrl },
    key = "k",
    on_press = function ()
      awful.screen.focus_relative(-1)
    end,
    on_release = nil,
    description = "focus the previous screen",
  },
})

-- ---------------------------------------------------------------------------
-- layout group
-- ---------------------------------------------------------------------------
global_key({
  group = "5. layout",

  awful.key {
    description = "select next",
    modifiers = { mod.super },
    key = "space",
    on_press = function ()
      awful.layout.inc(1)
    end,
    on_release = nil,
  },

  awful.key {
    description = "select previous",
    modifiers = { mod.super, mod.shift },
    key = "space",
    on_press = function ()
      awful.layout.inc(-1)
    end,
    on_release = nil,
  },

  awful.key {
    description = "increase master width factor",
    modifiers = { mod.super, mod.ctrl },
    key = "l",
    on_press = function ()
      awful.tag.incmwfact( 0.05)
    end,
    on_release = nil,
  },

  awful.key {
    description = "decrease master width factor",
    modifiers = { mod.super, mod.ctrl },
    key = "h",
    on_press = function ()
      awful.tag.incmwfact(-0.05)
    end,
    on_release = nil,
  },

  awful.key {
    description = "increase gap size",
    modifiers = { mod.super, mod.ctrl },
    key = ",",
    on_press = function ()
      awful.tag.incgap(-5)
    end,
    on_release = nil,
  },

  awful.key {
    description = "decrease gap size",
    modifiers = { mod.super, mod.ctrl },
    key = ".",
    on_press = function ()
      awful.tag.incgap(5)
    end,
    on_release = nil,
  },

  awful.key {
    description = "set gap size",
    modifiers = { mod.super, mod.ctrl },
    key = "g",
    on_press = function ()
      awful.tag.setgap(5)
    end,
  },

  awful.key {
    description = "increase the number of master clients",
    modifiers = { mod.super },
    key = ",",
    on_press = function ()
      awful.tag.incnmaster( 1, nil, true)
    end,
    on_release = nil,
  },

  awful.key {
    description = "decrease the number of master clients",
    modifiers = { mod.super },
    key = ".",
    on_press = function ()
      awful.tag.incnmaster(-1, nil, true)
    end,
    on_release = nil,
  },

  awful.key {
    description = "increase the number of columns",
    modifiers = { mod.super, mod.shift },
    key = ",",
    on_press = function ()
      awful.tag.incncol( 1, nil, true)
    end,
    on_release = nil,
  },

  awful.key {
    description = "decrease the number of columns",
    modifiers = { mod.super, mod.shift },
    key = ".",
    on_press = function ()
      awful.tag.incncol(-1, nil, true)
    end,
    on_release = nil,
  },
})

-- ---------------------------------------------------------------------------
-- client group
-- ---------------------------------------------------------------------------
global_key({
  group = "6. client",

  awful.key{
    description = "focus left",
    modifiers = { mod.super },
    key = "h",
    on_press = function ()
      awful.client.focus.global_bydirection("left")
    end,
    on_release = nil,
  },

  awful.key {
    description = "focus down",
    modifiers = { mod.super },
    key = "j",
    on_press = function ()
      awful.client.focus.global_bydirection("down")
    end,
    on_release = nil,
  },

  awful.key {
    description = "focus up",
    modifiers = { mod.super },
    key = "k",
    on_press = function ()
      awful.client.focus.global_bydirection("up")
    end,
    on_release = nil,
  },

  awful.key {
    description = "focus right",
    modifiers = { mod.super },
    key = "l",
    on_press = function ()
      awful.client.focus.global_bydirection("right")
    end,
    on_release = nil,
  },

  awful.key {
    description = "swap left",
    modifiers = { mod.super, mod.shift },
    key = "h",
    on_press = function ()
      awful.client.swap.bydirection("left")
    end,
    on_release = nil,
  },

  awful.key {
    description = "swap down",
    modifiers = { mod.super, mod.shift },
    key = "j",
    on_press = function ()
      awful.client.swap.bydirection("down")
    end,
    on_release = nil,
  },

  awful.key {
    description = "swap up",
    modifiers = { mod.super, mod.shift },
    key = "k",
    on_press = function ()
      awful.client.swap.bydirection("up")
    end,
    on_release = nil,
  },

  awful.key {
    description = "swap right",
    modifiers = { mod.super, mod.shift },
    key = "l",
    on_press = function ()
      awful.client.swap.bydirection("right")
    end,
    on_release = nil,
  },

  awful.key {
    description = "go back",
    modifiers = { mod.super },
    key = "Tab",
    on_press = function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    on_release = nil,
  },

  awful.key {
    description = "restore minimized",
    modifiers = { mod.super, mod.ctrl },
    key = "n",
    on_press = function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:activate { raise = true, context = "key.unminimize" }
      end
    end,
    on_release = nil,
  },

  awful.key {
    description = "jump to urgent client",
    modifiers = { mod.super },
    key = "u",
    on_press = function ()
      awful.client.urgent.jumpto()
    end,
    on_release = nil,
  },
})
