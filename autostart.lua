--
-- [[ Autostart applications ]]
--
local awful = require("awful")
local wallpapers_path = os.getenv("HOME") .. "/Pictures/Wallpapers/"

awful.spawn("picom", false)
awful.spawn("openrgb -d 0 -m off", false)
awful.spawn("openrgb -d 1 -m off", false)
awful.spawn("xwallpaper --stretch " .. wallpapers_path .. "wallpaper.png", false)
