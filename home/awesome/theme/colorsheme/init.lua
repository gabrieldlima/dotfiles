local user = require("config.user")
local colorscheme

local colorschemes = {
  catppuccin_mocha = require("theme.colorsheme.catppuccin_mocha")
}

if user.config.theme == "catppuccin_mocha" then
  colorscheme = colorschemes.catppuccin_mocha
end

return colorscheme
