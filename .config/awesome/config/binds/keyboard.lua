local awful         = require("awful")
local mod           = require("config.binds.modkeys")
local user          = require("config.user")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar       = require("menubar")

-- Client keys
client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
    awful.key(
      { mod.super }, "f",
      function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      { description = "toggle fullscreen", group = "client" }
    ),
    awful.key(
      { mod.super, mod.shift }, "c",
      function (c) c:kill() end,
      { description = "close", group = "client" }
    ),
    awful.key(
      { mod.super, mod.ctrl }, "space",
      awful.client.floating.toggle,
      { description = "toggle floating", group = "client" }
    ),
    awful.key(
      { mod.super, mod.ctrl }, "Return",
      function (c) c:swap(awful.client.getmaster()) end,
      { description = "move to master", group = "client" }
    ),
    awful.key(
      { mod.super }, "o",
      function (c) c:move_to_screen() end,
      { description = "move to screen", group = "client" }
    ),
    awful.key(
      { mod.super }, "t",
      function (c) c.ontop = not c.ontop end,
      { description = "toggle keep on top", group = "client" }
    ),
    awful.key(
      { mod.super }, "n",
      function (c) c.minimized = true end ,
      { description = "minimize", group = "client" }
    ),
    awful.key(
      { mod.super }, "m",
      function (c)
        c.maximized = not c.maximized
        c:raise()
      end ,
      { description = "(un)maximize", group = "client" }
    ),
    awful.key(
      { mod.super, mod.ctrl }, "m",
      function (c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end ,
      { description = "(un)maximize vertically", group = "client" }
    ),
    awful.key(
      { mod.super, mod.shift }, "m",
      function (c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end ,
      { description = "(un)maximize horizontally", group = "client" }
    ),
  })
end)

-- Global keys
awful.keyboard.append_global_keybindings({
  awful.key(
    { mod.super }, "s",
    hotkeys_popup.show_help,
    { description="show help", group="awesome" }
  ),
  awful.key(
    { mod.super }, "w",
    function () mymainmenu:show() end,
    { description = "show main menu", group = "awesome" }
  ),
  awful.key(
    { mod.super, mod.ctrl }, "r",
    awesome.restart,
    { description = "reload awesome", group = "awesome" }
  ),
  awful.key({ mod.super, mod.shift }, "q",
    awesome.quit,
    { description = "quit awesome", group = "awesome" }
  ),
  awful.key(
    { mod.super }, "Return",
    function () awful.spawn(user.apps.terminal) end,
    { description = "open a terminal", group = "launcher" }
  ),
  awful.key(
    { mod.super }, "e",
    function () awful.spawn(user.apps.file_manager) end,
    { description = "open file manager", group = "launcher" }
  ),
  awful.key(
    { mod.super }, "p",
    function() menubar.show() end,
    { description = "show the dmenu", group = "launcher" }
  ),
  awful.key(
    { mod.super }, "b",
    function () awful.spawn(user.apps.web_browser) end,
    { description = "open a web browser", group = "launcher"}
  ),
  awful.key(
    { mod.super, mod.shift }, "s",
    function () awful.spawn(user.apps.screnshoot .. " gui -p " .. user.config.home .. "/Pictures/Screenshots", false) end,
    { description = "screenshot select", group = "launcher"}
  ),
  awful.key(
    {}, "Print",
    function () awful.spawn(user.apps.screnshoot .. " screen -p " .. user.config.home .. "/Pictures/Screenshots", false) end,
    { description = "screenshot fullscreen", group = "launcher"}
  )
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
  awful.key(
    { mod.super }, "Left",
    awful.tag.viewprev,
    { description = "view previous", group = "tag" }
  ),
  awful.key(
    { mod.super }, "Right",
    awful.tag.viewnext,
    { description = "view next", group = "tag" }
  ),
  awful.key(
    { mod.super }, "Escape",
    awful.tag.history.restore,
    { description = "go back", group = "tag" }
  ),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
  awful.key(
    { mod.super }, "j",
    function () awful.client.focus.byidx( 1) end,
    { description = "focus next by index", group = "client" }
  ),
  awful.key(
    { mod.super }, "k",
    function () awful.client.focus.byidx(-1) end,
    { description = "focus previous by index", group = "client" }
  ),
  awful.key(
    { mod.super }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "go back", group = "client" }
  ),
  awful.key(
    { mod.super, mod.ctrl }, "j",
    function () awful.screen.focus_relative( 1) end,
    { description = "focus the next screen", group = "screen" }
  ),
  awful.key(
    { mod.super, mod.ctrl }, "k",
    function () awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }
  ),
  awful.key(
    { mod.super, mod.ctrl }, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:activate { raise = true, context = "key.unminimize" }
      end
    end,
    { description = "restore minimized", group = "client" }
  ),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
  awful.key(
    { mod.super, mod.shift }, "j",
    function () awful.client.swap.byidx(  1) end,
    { description = "swap with next client by index", group = "client" }
  ),
  awful.key(
    { mod.super, mod.shift }, "k",
    function () awful.client.swap.byidx( -1) end,
    { description = "swap with previous client by index", group = "client" }
  ),
  awful.key(
    { mod.super }, "u",
    awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }
  ),
  awful.key(
    { mod.super }, "l",
    function () awful.tag.incmwfact( 0.05) end,
    { description = "increase master width factor", group = "layout" }
  ),
  awful.key(
    { mod.super }, "h",
    function () awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  awful.key(
    { mod.super, mod.shift }, "h",
    function () awful.tag.incnmaster( 1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }
  ),
  awful.key(
    { mod.super, mod.shift }, "l",
    function () awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }
  ),
  awful.key(
    { mod.super, mod.ctrl }, "h",
    function () awful.tag.incncol( 1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }
  ),
  awful.key(
    { mod.super, mod.ctrl }, "l",
    function () awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }
  ),
  awful.key(
    { mod.super }, "space",
    function () awful.layout.inc( 1) end,
    { description = "select next", group = "layout" }
  ),
  awful.key(
    { mod.super, mod.shift }, "space",
    function () awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }
  ),
})

awful.keyboard.append_global_keybindings({
  awful.key {
    modifiers   = { mod.super },
    keygroup    = "numrow",
    description = "only view tag",
    group       = "tag",
    on_press    = function (index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  awful.key {
    modifiers   = { mod.super, mod.ctrl },
    keygroup    = "numrow",
    description = "toggle tag",
    group       = "tag",
    on_press    = function (index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  },
  awful.key {
    modifiers = { mod.super, mod.shift },
    keygroup    = "numrow",
    description = "move focused client to tag",
    group       = "tag",
    on_press    = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers   = { mod.super, mod.ctrl, mod.shift },
    keygroup    = "numrow",
    description = "toggle focused client on tag",
    group       = "tag",
    on_press    = function (index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers   = { mod.super },
    keygroup    = "numpad",
    description = "select layout directly",
    group       = "layout",
    on_press    = function (index)
      local t = awful.screen.focused().selected_tag
      if t then
        t.layout = t.layouts[index] or t.layout
      end
    end,
  }
})
