config.load_autoconfig(False)


###############################################################################
# CONFIGURATION
###############################################################################
c.fonts.default_family = "FiraCode Nerd Font"
c.fonts.default_size = "10pt"
c.tabs.show = "multiple"
c.downloads.position = "bottom"
c.content.javascript.clipboard = "access"


###############################################################################
# THEME
###############################################################################
rosewater = "#f5e0dc"
flamingo  = "#f2cdcd"
pink      = "#f5c2e7"
mauve     = "#cba6f7"
red       = "#f38ba8"
maroon    = "#eba0ac"
peach     = "#fab387"
yellow    = "#f9e2af"
green     = "#a6e3a1"
teal      = "#94e2d5"
sky       = "#89dceb"
sapphire  = "#74c7ec"
blue      = "#89b4fa"
lavender  = "#b4befe"
text      = "#cdd6f4"
subtext1  = "#bac2de"
subtext0  = "#a6adc8"
overlay2  = "#9399b2"
overlay1  = "#7f849c"
overlay0  = "#6c7086"
surface2  = "#585b70"
surface1  = "#45475a"
surface0  = "#313244"
base      = "#010101"
mantle    = "#010101"
crust     = "#010101" 

c.colors.completion.category.bg                 = base
c.colors.completion.category.border.bottom      = mantle
c.colors.completion.category.border.top         = overlay2
c.colors.completion.category.fg                 = green
c.colors.completion.fg                          = subtext0
c.colors.completion.item.selected.bg            = surface2
c.colors.completion.item.selected.border.bottom = surface2
c.colors.completion.item.selected.border.top    = surface2
c.colors.completion.item.selected.fg            = text
c.colors.completion.item.selected.match.fg      = rosewater
c.colors.completion.even.bg                     = base
c.colors.completion.odd.bg                      = base
c.colors.completion.match.fg                    = green
c.colors.completion.scrollbar.bg                = crust
c.colors.completion.scrollbar.fg                = surface2

c.colors.downloads.bar.bg                       = base
c.colors.downloads.error.bg                     = base
c.colors.downloads.start.bg                     = base
c.colors.downloads.stop.bg                      = base
c.colors.downloads.error.fg                     = red
c.colors.downloads.start.fg                     = blue
c.colors.downloads.stop.fg                      = green
c.colors.downloads.system.fg                    = "none"
c.colors.downloads.system.bg                    = "none"

c.colors.hints.bg                               = peach
c.colors.hints.fg                               = mantle
c.colors.hints.match.fg                         = subtext1

c.colors.keyhint.bg                             = mantle
c.colors.keyhint.fg                             = text
c.colors.keyhint.suffix.fg                      = subtext1

c.colors.messages.error.bg                      = overlay0
c.colors.messages.info.bg                       = overlay0
c.colors.messages.warning.bg                    = overlay0
c.colors.messages.error.border                  = mantle
c.colors.messages.info.border                   = mantle
c.colors.messages.warning.border                = mantle
c.colors.messages.error.fg                      = red
c.colors.messages.info.fg                       = text
c.colors.messages.warning.fg                    = peach

c.colors.prompts.bg                             = mantle
c.colors.prompts.border                         = overlay0
c.colors.prompts.fg                             = text
c.colors.prompts.selected.bg                    = surface2
c.colors.prompts.selected.fg                    = rosewater

c.colors.statusbar.normal.bg                    = base
c.colors.statusbar.insert.bg                    = crust
c.colors.statusbar.command.bg                   = base
c.colors.statusbar.caret.bg                     = base
c.colors.statusbar.caret.selection.bg           = base
c.colors.statusbar.progress.bg                  = base
c.colors.statusbar.passthrough.bg               = base
c.colors.statusbar.normal.fg                    = text
c.colors.statusbar.insert.fg                    = rosewater
c.colors.statusbar.command.fg                   = text
c.colors.statusbar.passthrough.fg               = peach
c.colors.statusbar.caret.fg                     = peach
c.colors.statusbar.caret.selection.fg           = peach
c.colors.statusbar.url.error.fg                 = red
c.colors.statusbar.url.fg                       = text
c.colors.statusbar.url.hover.fg                 = sky
c.colors.statusbar.url.success.http.fg          = teal
c.colors.statusbar.url.success.https.fg         = green
c.colors.statusbar.url.warn.fg                  = yellow
c.colors.statusbar.private.bg                   = mantle
c.colors.statusbar.private.fg                   = subtext1
c.colors.statusbar.command.private.bg           = base
c.colors.statusbar.command.private.fg           = subtext1

c.colors.tabs.bar.bg                            = crust
c.colors.tabs.even.bg                           = crust
c.colors.tabs.odd.bg                            = crust
c.colors.tabs.even.fg                           = text
c.colors.tabs.odd.fg                            = text
c.colors.tabs.indicator.error                   = red
c.colors.tabs.indicator.system                  = "none"
c.colors.tabs.selected.even.bg                  = blue
c.colors.tabs.selected.odd.bg                   = blue
c.colors.tabs.selected.even.fg                  = crust
c.colors.tabs.selected.odd.fg                   = crust
c.colors.tabs.pinned.even.bg                    = crust
c.colors.tabs.pinned.even.fg                    = text
c.colors.tabs.pinned.odd.bg                     = crust
c.colors.tabs.pinned.odd.fg                     = text
c.colors.tabs.pinned.selected.odd.bg            = blue
c.colors.tabs.pinned.selected.odd.fg            = crust
c.colors.tabs.pinned.selected.even.bg           = blue
c.colors.tabs.pinned.selected.even.fg           = crust

c.colors.contextmenu.menu.bg                    = base
c.colors.contextmenu.menu.fg                    = text
c.colors.contextmenu.disabled.bg                = mantle
c.colors.contextmenu.disabled.fg                = overlay0
c.colors.contextmenu.selected.bg                = overlay0
c.colors.contextmenu.selected.fg                = rosewater
