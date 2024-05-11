local wibox = require("wibox")

-- Create a imagebox with Nix logo
local nixos_logo = wibox.widget {
  image = os.getenv("HOME") .. "/.config/awesome/assets/nix.svg",
  valign = "center",
  halign = "center",
  forced_height = 26,
  forced_width = 26,
  resize = true,
  widget = wibox.widget.imagebox,
}

return nixos_logo
