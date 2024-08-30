-- ╔═══════════════════════════════════════════════════════════════════════════════════╗
-- ║ █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗██╗    ██╗███╗   ███╗║
-- ║██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝██║    ██║████╗ ████║║
-- ║███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗  ██║ █╗ ██║██╔████╔██║║
-- ║██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║╚██╔╝██║║
-- ║██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗╚███╔███╔╝██║ ╚═╝ ██║║
-- ║╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝     ╚═╝║
-- ╚═══════════════════════════════════════════════════════════════════════════════════╝

-- Load luarocks if installed
pcall(require, "luarocks.loader")

--
-- [[ Awesome modules ]]
--
require("binds")
require("theme")
require("config.rules")
require("signal")
require("ui.bar")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Autostart script
require("awful").spawn.with_shell(os.getenv("HOME") .. "/.config/awesome/config/autostart.sh")

-- Garbage collection
require("gears").timer {
  timeout = 5,
  autostart = true,
  call_now = true,
  callback = function()
    collectgarbage "collect"
  end,
}

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
