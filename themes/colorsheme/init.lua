local user = require("config.user")
local colorscheme

local colorschemes = {
  catppuccin_mocha = require("themes.colorsheme.catppuccin_mocha")
}

if user.theme == "catppuccin_mocha" then
  colorscheme = colorschemes.catppuccin_mocha
end

return colorscheme
