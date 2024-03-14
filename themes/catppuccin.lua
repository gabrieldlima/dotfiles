local xresources    = require("beautiful.xresources")
local dpi           = xresources.apply_dpi

local font = "Vanilla Caramel 11"

local catppuccin_mocha = {
  rosewater = "#f5e0dc",
  flamingo  = "#f2cdcd",
  pink      = "#f5c2e7",
  mauve     = "#cba6f7",
  red       = "#f38ba8",
  maroon    = "#eba0ac",
  peach     = "#fab387",
  yellow    = "#f9e2af",
  green     = "#a6e3a1",
  teal      = "#94e2d5",
  sky       = "#89dceb",
  sapphire  = "#74c7ec",
  blue      = "#89b4fa",
  lavender  = "#b4befe",
  text      = "#cdd6f4",
  subtext1  = "#bac2de",
  subtext0  = "#a6adc8",
  overlay2  = "#9399b2",
  overlay1  = "#7f849c",
  overlay0  = "#6c7086",
  surface2  = "#585b70",
  surface1  = "#45475a",
  surface0  = "#313244",
  base      = "#1e1e2e",
  mantle    = "#181825",
  crust     = "#010101"
}

local theme = {}

--
-- [[ Default variables ]]
--
theme.useless_gap = dpi(5)
theme.font = font
theme.bg_normal = catppuccin_mocha.crust
-- theme.bg_focus = nil
-- theme.bg_urgent = nil
-- theme.bg_minimize = nil
theme.fg_normal = catppuccin_mocha.text
theme.fg_focus = catppuccin_mocha.lavender
-- theme.fg_urgent = nil
-- theme.fg_minimize = nil
-- theme.wallpaper = nil
-- theme.bg_systray = nil
-- theme.border_color_marked = nil
-- theme.border_color_floating = nil
-- theme.border_color_maximized = nil
-- theme.border_color_fullscreen = nil
theme.border_color_active = catppuccin_mocha.lavender
theme.border_color_normal = catppuccin_mocha.crust
-- theme.border_color_urgent = nil
-- theme.border_color_new = nil
-- theme.border_color_floating_active = nil
-- theme.border_color_floating_normal = nil
-- theme.border_color_floating_urgent = nil
-- theme.border_color_floating_new = nil
-- theme.border_color_maximized_active = nil
-- theme.border_color_maximized_normal = nil
-- theme.border_color_maximized_urgent = nil
-- theme.border_color_maximized_new = nil
-- theme.border_color_fullscreen_active = nil
-- theme.border_color_fullscreen_normal = nil
-- theme.border_color_fullscreen_urgent = nil
-- theme.border_color_fullscreen_new = nil
theme.border_width = dpi(2)
-- theme.border_width_floating = nil
-- theme.border_width_maximized = nil
-- theme.border_width_normal = nil
-- theme.border_width_active = nil
-- theme.border_width_urgent = nil
-- theme.border_width_new = nil
-- theme.border_width_floating_normal = nil
-- theme.border_width_floating_active = nil
-- theme.border_width_floating_urgent = nil
-- theme.border_width_floating_new = nil
-- theme.border_width_maximized_normal = nil
-- theme.border_width_maximized_active = nil
-- theme.border_width_maximized_urgent = nil
-- theme.border_width_maximized_new = nil
-- theme.border_width_fullscreen_normal = nil
-- theme.border_width_fullscreen_active = nil
-- theme.border_width_fullscreen_urgent = nil
-- theme.border_width_fullscreen_new = nil
-- theme.border_width_fullscreen = nil

--
-- [[ arcchart ]]
--
-- theme.arcchart_border_color = nil
-- theme.arcchart_color = nil
-- theme.arcchart_border_width = nil
-- theme.arcchart_paddings = nil
-- theme.arcchart_thickness = nil
-- theme.arcchart_rounded_edge = nil
-- theme.arcchart_bg = nil
-- theme.arcchart_start_angle = nil

--
-- [[ awesome ]]
--
-- theme.awesome_icon = nil

--
-- [[ calendar ]]
--
-- theme.calendar_style = nil
-- theme.calendar_font = nil
-- theme.calendar_spacing = nil
-- theme.calendar_week_numbers = nil
-- theme.calendar_start_sunday = nil
-- theme.calendar_long_weekdays = nil

--
-- [[ checkbox ]]
--
-- theme.checkbox_border_width = nil
-- theme.checkbox_bg = nil
-- theme.checkbox_border_color = nil
-- theme.checkbox_check_border_color = nil
-- theme.checkbox_check_border_width = nil
-- theme.checkbox_check_color = nil
-- theme.checkbox_shape = nil
-- theme.checkbox_check_shape = nil
-- theme.checkbox_paddings = nil
-- theme.checkbox_color = nil

--
-- [[ column ]]
--
-- theme.column_count = nil

--
-- [[ cursor ]]
--
-- theme.cursor_mouse_resize = nil
-- theme.cursor_mouse_move = nil

--
-- [[ enable ]]
--
-- theme.enable_spawn_cursor = nil

--
-- [[ flex ]]
--
-- theme.flex_height = nil

--
-- [[ fullscreen ]]
--
-- theme.fullscreen_hide_border = nil

--
-- [[ gap ]]
--
-- theme.gap_single_client = nil

--
-- [[ graph ]]
--
-- theme.graph_fg = nil
-- theme.graph_bg = nil
-- theme.graph_border_color = nil

--
-- [[ hotkeys ]]
--
-- theme.hotkeys_bg = nil
-- theme.hotkeys_fg = nil
theme.hotkeys_border_width = dpi(2)
theme.hotkeys_border_color = catppuccin_mocha.lavender
-- theme.hotkeys_shape = nil
-- theme.hotkeys_modifiers_fg = nil
-- theme.hotkeys_label_bg = nil
-- theme.hotkeys_label_fg = nil
-- theme.hotkeys_font = nil
-- theme.hotkeys_description_font = nil
-- theme.hotkeys_group_margin = nil

--
-- [[ icon ]]
--
-- theme.icon_theme = nil

--
-- [[ layout ]]
--
local icons_path = os.getenv("HOME") .. "/.config/awesome/themes/icons/layouts/"
theme.layout_fairh      = icons_path .. "fairhw.png"
theme.layout_fairv      = icons_path .. "fairvw.png"
theme.layout_floating   = icons_path .. "floatingw.png"
theme.layout_magnifier  = icons_path .. "magnifierw.png"
theme.layout_max        = icons_path .. "maxw.png"
theme.layout_fullscreen = icons_path .. "fullscreenw.png"
theme.layout_tilebottom = icons_path .. "tilebottomw.png"
theme.layout_tileleft   = icons_path .. "tileleftw.png"
theme.layout_tile       = icons_path .. "tilew.png"
theme.layout_tiletop    = icons_path .. "tiletopw.png"
theme.layout_spiral     = icons_path .. "spiralw.png"
theme.layout_dwindle    = icons_path .. "dwindlew.png"
theme.layout_cornernw   = icons_path .. "cornernww.png"
theme.layout_cornerne   = icons_path .. "cornernew.png"
theme.layout_cornersw   = icons_path .. "cornersww.png"
theme.layout_cornerse   = icons_path .. "cornersew.png"

--
-- [[ layoutlist ]]
--
-- theme.layoutlist_fg_normal = nil
-- theme.layoutlist_bg_normal = nil
-- theme.layoutlist_fg_selected = nil
-- theme.layoutlist_bg_selected = nil
-- theme.layoutlist_disable_icon = nil
-- theme.layoutlist_disable_name = nil
-- theme.layoutlist_font = nil
-- theme.layoutlist_align = nil
-- theme.layoutlist_font_selected = nil
-- theme.layoutlist_spacing = nil
-- theme.layoutlist_shape = nil
-- theme.layoutlist_shape_border_width = nil
-- theme.layoutlist_shape_border_color = nil
-- theme.layoutlist_shape_selected = nil
-- theme.layoutlist_shape_border_width_selected = nil
-- theme.layoutlist_shape_border_color_selected = nil

--
-- [[ master ]]
--
-- theme.master_width_factor = nil
-- theme.master_fill_policy = nil
-- theme.master_count = nil

--
-- [[ maximized ]]
--
-- theme.maximized_honor_padding = nil
-- theme.maximized_hide_border = nil

--
-- [[ menu ]]
--
-- theme.menu_submenu_icon = nil
-- theme.menu_font = nil
-- theme.menu_height = nil
-- theme.menu_width = nil
-- theme.menu_border_color = nil
-- theme.menu_border_width = nil
-- theme.menu_fg_focus = nil
-- theme.menu_bg_focus = nil
-- theme.menu_fg_normal = nil
-- theme.menu_bg_normal = nil
-- theme.menu_submenu = nil

--
-- [[ menubar ]]
--
-- theme.menubar_fg_normal = nil
-- theme.menubar_bg_normal = nil
-- theme.menubar_border_width = nil
-- theme.menubar_border_color = nil
-- theme.menubar_fg_focus = nil
-- theme.menubar_bg_focus = nil
-- theme.menubar_font = nil

--
-- [[ notification ]]
--
-- theme.notification_max_width = nil
-- theme.notification_position = nil
-- theme.notification_action_underline_normal = nil
-- theme.notification_action_underline_selected = nil
-- theme.notification_action_icon_only = nil
-- theme.notification_action_label_only = nil
-- theme.notification_action_shape_normal = nil
-- theme.notification_action_shape_selected = nil
-- theme.notification_action_shape_border_color_normal = nil
-- theme.notification_action_shape_border_color_selected = nil
-- theme.notification_action_shape_border_width_normal = nil
-- theme.notification_action_shape_border_width_selected = nil
-- theme.notification_action_icon_size_normal = nil
-- theme.notification_action_icon_size_selected = nil
-- theme.notification_action_bg_normal = nil
-- theme.notification_action_bg_selected = nil
-- theme.notification_action_fg_normal = nil
-- theme.notification_action_fg_selected = nil
-- theme.notification_action_bgimage_normal = nil
-- theme.notification_action_bgimage_selected = nil
-- theme.notification_shape_normal = nil
-- theme.notification_shape_selected = nil
-- theme.notification_shape_border_color_normal = nil
-- theme.notification_shape_border_color_selected = nil
-- theme.notification_shape_border_width_normal = nil
-- theme.notification_shape_border_width_selected = nil
-- theme.notification_icon_size_normal = nil
-- theme.notification_icon_size_selected = nil
-- theme.notification_bg_normal = nil
-- theme.notification_bg_selected = nil
-- theme.notification_fg_normal = nil
-- theme.notification_fg_selected = nil
-- theme.notification_bgimage_normal = nil
-- theme.notification_bgimage_selected = nil
-- theme.notification_font = nil
-- theme.notification_bg = nil
-- theme.notification_fg = nil
-- theme.notification_border_width = nil
-- theme.notification_border_color = nil
-- theme.notification_shape = nil
-- theme.notification_opacity = nil
-- theme.notification_margin = nil
-- theme.notification_width = nil
-- theme.notification_height = nil
-- theme.notification_spacing = nil
-- theme.notification_icon_resize_strategy = nil
-- theme.notification_icon_size = nil

--
-- [[ opacity ]]
--
-- theme.opacity_normal = nil
-- theme.opacity_active = nil
-- theme.opacity_urgent = nil
-- theme.opacity_new = nil
-- theme.opacity_floating_normal = nil
-- theme.opacity_floating_active = nil
-- theme.opacity_floating_urgent = nil
-- theme.opacity_floating_new = nil
-- theme.opacity_floating = nil
-- theme.opacity_maximized_normal = nil
-- theme.opacity_maximized_active = nil
-- theme.opacity_maximized_urgent = nil
-- theme.opacity_maximized_new = nil
-- theme.opacity_maximized = nil
-- theme.opacity_fullscreen_normal = nil
-- theme.opacity_fullscreen_active = nil
-- theme.opacity_fullscreen_urgent = nil
-- theme.opacity_fullscreen_new = nil
-- theme.opacity_fullscreen = nil

--
-- [[ piechart ]]
--
-- theme.piechart_border_color = nil
-- theme.piechart_border_width = nil
-- theme.piechart_colors = nil

--
-- [[ progressbar ]]
--
-- theme.progressbar_bg = nil
-- theme.progressbar_fg = nil
-- theme.progressbar_shape = nil
-- theme.progressbar_border_color = nil
-- theme.progressbar_border_width = nil
-- theme.progressbar_bar_shape = nil
-- theme.progressbar_bar_border_width = nil
-- theme.progressbar_bar_border_color = nil
-- theme.progressbar_margins = nil
-- theme.progressbar_paddings = nil

--
-- [[ prompt ]]
--
-- theme.prompt_fg_cursor = nil
-- theme.prompt_bg_cursor = nil
-- theme.prompt_font = nil
-- theme.prompt_fg = nil
-- theme.prompt_bg = nil

--
-- [[ radialprogressbar ]]
--
-- theme.radialprogressbar_border_color = nil
-- theme.radialprogressbar_color = nil
-- theme.radialprogressbar_border_width = nil
-- theme.radialprogressbar_paddings = nil

--
-- [[ screenshot ]]
--
-- theme.screenshot_frame_color = nil
-- theme.screenshot_frame_shape = nil

--
-- [[ separator ]]
--
-- theme.separator_thickness = nil
-- theme.separator_border_color = nil
-- theme.separator_border_width = nil
-- theme.separator_span_ratio = nil
-- theme.separator_color = nil
-- theme.separator_shape = nil

--
-- [[ slider ]]
--
-- theme.slider_bar_border_width = nil
-- theme.slider_bar_border_color = nil
-- theme.slider_handle_border_color = nil
-- theme.slider_handle_border_width = nil
-- theme.slider_handle_width = nil
-- theme.slider_handle_color = nil
-- theme.slider_handle_shape = nil
-- theme.slider_handle_cursor = nil
-- theme.slider_bar_shape = nil
-- theme.slider_bar_height = nil
-- theme.slider_bar_margins = nil
-- theme.slider_handle_margins = nil
-- theme.slider_bar_color = nil
-- theme.slider_bar_active_color = nil

--
-- [[ snap ]]
--
-- theme.snap_bg = nil
-- theme.snap_border_width = nil
-- theme.snap_shape = nil

--
-- [[ snapper ]]
--
-- theme.snapper_gap = nil

--
-- [[ systray ]]
--
-- theme.systray_max_rows = nil
-- theme.systray_icon_spacing = nil

--
-- [[ taglist ]]
--
-- theme.taglist_fg_focus = nil
-- theme.taglist_bg_focus = nil
-- theme.taglist_fg_urgent = nil
-- theme.taglist_bg_urgent = nil
-- theme.taglist_bg_occupied = nil
-- theme.taglist_fg_occupied = nil
-- theme.taglist_bg_empty = nil
theme.taglist_fg_empty = catppuccin_mocha.surface1
-- theme.taglist_bg_volatile = nil
-- theme.taglist_fg_volatile = nil
-- theme.taglist_squares_sel = nil
-- theme.taglist_squares_unsel = nil
-- theme.taglist_squares_sel_empty = nil
-- theme.taglist_squares_unsel_empty = nil
-- theme.taglist_squares_resize = nil
-- theme.taglist_disable_icon = nil
theme.taglist_font = "Noto Sans JP ExtraBold 10"
-- theme.taglist_spacing = nil
-- theme.taglist_shape = nil
-- theme.taglist_shape_border_width = nil
-- theme.taglist_shape_border_color = nil
-- theme.taglist_shape_empty = nil
-- theme.taglist_shape_border_width_empty = nil
-- theme.taglist_shape_border_color_empty = nil
-- theme.taglist_shape_focus = nil
-- theme.taglist_shape_border_width_focus = nil
-- theme.taglist_shape_border_color_focus = nil
-- theme.taglist_shape_urgent = nil
-- theme.taglist_shape_border_width_urgent = nil
-- theme.taglist_shape_border_color_urgent = nil
-- theme.taglist_shape_volatile = nil
-- theme.taglist_shape_border_width_volatile = nil
-- theme.taglist_shape_border_color_volatile = nil

--
-- [[ tasklist ]]
--
-- theme.tasklist_fg_normal = nil
-- theme.tasklist_bg_normal = nil
-- theme.tasklist_fg_focus = nil
-- theme.tasklist_bg_focus = nil
-- theme.tasklist_fg_urgent = nil
-- theme.tasklist_bg_urgent = nil
-- theme.tasklist_fg_minimize = nil
-- theme.tasklist_bg_minimize = nil
-- theme.tasklist_bg_image_normal = nil
-- theme.tasklist_bg_image_focus = nil
-- theme.tasklist_bg_image_urgent = nil
-- theme.tasklist_bg_image_minimize = nil
theme.tasklist_disable_icon = true
-- theme.tasklist_disable_task_name = nil
-- theme.tasklist_plain_task_name = nil
-- theme.tasklist_sticky = nil
-- theme.tasklist_ontop = nil
-- theme.tasklist_above = nil
-- theme.tasklist_below = nil
-- theme.tasklist_floating = nil
-- theme.tasklist_maximized = nil
-- theme.tasklist_maximized_horizontal = nil
-- theme.tasklist_maximized_vertical = nil
-- theme.tasklist_minimized = nil
-- theme.tasklist_align = nil
-- theme.tasklist_font = nil
-- theme.tasklist_font_focus = nil
-- theme.tasklist_font_minimized = nil
-- theme.tasklist_font_urgent = nil
-- theme.tasklist_spacing = nil
-- theme.tasklist_shape = nil
-- theme.tasklist_shape_border_width = nil
-- theme.tasklist_shape_border_color = nil
-- theme.tasklist_shape_focus = nil
-- theme.tasklist_shape_border_width_focus = nil
-- theme.tasklist_shape_border_color_focus = nil
-- theme.tasklist_shape_minimized = nil
-- theme.tasklist_shape_border_width_minimized = nil
-- theme.tasklist_shape_border_color_minimized = nil
-- theme.tasklist_shape_urgent = nil
-- theme.tasklist_shape_border_width_urgent = nil
-- theme.tasklist_shape_border_color_urgent = nil
-- theme.tasklist_icon_size = nil

--
-- [[ titlebar ]]
--
-- theme.titlebar_fg_normal = nil
-- theme.titlebar_bg_normal = nil
-- theme.titlebar_bgimage_normal = nil
-- theme.titlebar_fg = nil
-- theme.titlebar_bg = nil
-- theme.titlebar_bgimage = nil
-- theme.titlebar_fg_focus = nil
-- theme.titlebar_bg_focus = nil
-- theme.titlebar_bgimage_focus = nil
-- theme.titlebar_fg_urgent = nil
-- theme.titlebar_bg_urgent = nil
-- theme.titlebar_bgimage_urgent = nil
-- theme.titlebar_floating_button_normal = nil
-- theme.titlebar_maximized_button_normal = nil
-- theme.titlebar_minimize_button_normal = nil
-- theme.titlebar_minimize_button_normal_hover = nil
-- theme.titlebar_minimize_button_normal_press = nil
-- theme.titlebar_close_button_normal = nil
-- theme.titlebar_close_button_normal_hover = nil
-- theme.titlebar_close_button_normal_press = nil
-- theme.titlebar_ontop_button_normal = nil
-- theme.titlebar_sticky_button_normal = nil
-- theme.titlebar_floating_button_focus = nil
-- theme.titlebar_maximized_button_focus = nil
-- theme.titlebar_minimize_button_focus = nil
-- theme.titlebar_minimize_button_focus_hover = nil
-- theme.titlebar_minimize_button_focus_press = nil
-- theme.titlebar_close_button_focus = nil
-- theme.titlebar_close_button_focus_hover = nil
-- theme.titlebar_close_button_focus_press = nil
-- theme.titlebar_ontop_button_focus = nil
-- theme.titlebar_sticky_button_focus = nil
-- theme.titlebar_floating_button_normal_active = nil
-- theme.titlebar_floating_button_normal_active_hover = nil
-- theme.titlebar_floating_button_normal_active_press = nil
-- theme.titlebar_maximized_button_normal_active = nil
-- theme.titlebar_maximized_button_normal_active_hover = nil
-- theme.titlebar_maximized_button_normal_active_press = nil
-- theme.titlebar_ontop_button_normal_active = nil
-- theme.titlebar_ontop_button_normal_active_hover = nil
-- theme.titlebar_ontop_button_normal_active_press = nil
-- theme.titlebar_sticky_button_normal_active = nil
-- theme.titlebar_sticky_button_normal_active_hover = nil
-- theme.titlebar_sticky_button_normal_active_press = nil
-- theme.titlebar_floating_button_focus_active = nil
-- theme.titlebar_floating_button_focus_active_hover = nil
-- theme.titlebar_floating_button_focus_active_press = nil
-- theme.titlebar_maximized_button_focus_active = nil
-- theme.titlebar_maximized_button_focus_active_hover = nil
-- theme.titlebar_maximized_button_focus_active_press = nil
-- theme.titlebar_ontop_button_focus_active = nil
-- theme.titlebar_ontop_button_focus_active_hover = nil
-- theme.titlebar_ontop_button_focus_active_press = nil
-- theme.titlebar_sticky_button_focus_active = nil
-- theme.titlebar_sticky_button_focus_active_hover = nil
-- theme.titlebar_sticky_button_focus_active_press = nil
-- theme.titlebar_floating_button_normal_inactive = nil
-- theme.titlebar_floating_button_normal_inactive_hover = nil
-- theme.titlebar_floating_button_normal_inactive_press = nil
-- theme.titlebar_maximized_button_normal_inactive = nil
-- theme.titlebar_maximized_button_normal_inactive_hover = nil
-- theme.titlebar_maximized_button_normal_inactive_press = nil
-- theme.titlebar_ontop_button_normal_inactive = nil
-- theme.titlebar_ontop_button_normal_inactive_hover = nil
-- theme.titlebar_ontop_button_normal_inactive_press = nil
-- theme.titlebar_sticky_button_normal_inactive = nil
-- theme.titlebar_sticky_button_normal_inactive_hover = nil
-- theme.titlebar_sticky_button_normal_inactive_press = nil
-- theme.titlebar_floating_button_focus_inactive = nil
-- theme.titlebar_floating_button_focus_inactive_hover = nil
-- theme.titlebar_floating_button_focus_inactive_press = nil
-- theme.titlebar_maximized_button_focus_inactive = nil
-- theme.titlebar_maximized_button_focus_inactive_hover = nil
-- theme.titlebar_maximized_button_focus_inactive_press = nil
-- theme.titlebar_ontop_button_focus_inactive = nil
-- theme.titlebar_ontop_button_focus_inactive_hover = nil
-- theme.titlebar_ontop_button_focus_inactive_press = nil
-- theme.titlebar_sticky_button_focus_inactive = nil
-- theme.titlebar_sticky_button_focus_inactive_hover = nil
-- theme.titlebar_sticky_button_focus_inactive_press = nil
-- theme.titlebar_tooltip_messages_close = nil
-- theme.titlebar_tooltip_messages_minimize = nil
-- theme.titlebar_tooltip_messages_maximized_active = nil
-- theme.titlebar_tooltip_messages_maximized_inactive = nil
-- theme.titlebar_tooltip_messages_floating_active = nil
-- theme.titlebar_tooltip_messages_floating_inactive = nil
-- theme.titlebar_tooltip_messages_ontop_active = nil
-- theme.titlebar_tooltip_messages_ontop_inactive = nil
-- theme.titlebar_tooltip_messages_sticky_active = nil
-- theme.titlebar_tooltip_messages_sticky_inactive = nil
-- theme.titlebar_tooltip_delay_show = nil
-- theme.titlebar_tooltip_margins_leftright = nil
-- theme.titlebar_tooltip_margins_topbottom = nil
-- theme.titlebar_tooltip_timeout = nil
-- theme.titlebar_tooltip_align = nil

--
-- [[ tooltip ]]
--
-- theme.tooltip_border_color = nil
-- theme.tooltip_bg = nil
-- theme.tooltip_fg = nil
-- theme.tooltip_font = nil
-- theme.tooltip_border_width = nil
-- theme.tooltip_opacity = nil
-- theme.tooltip_gaps = nil
-- theme.tooltip_shape = nil
-- theme.tooltip_align = nil

--
-- [[ wallpaper ]]
--
-- theme.wallpaper_bg = nil
-- theme.wallpaper_fg = nil

--
-- [[ wibar ]]
--
-- theme.wibar_stretch = nil
-- theme.wibar_favor_vertical = nil
-- theme.wibar_border_width = nil
-- theme.wibar_border_color = nil
-- theme.wibar_ontop = nil
-- theme.wibar_cursor = nil
-- theme.wibar_opacity = nil
-- theme.wibar_type = nil
-- theme.wibar_width = nil
-- theme.wibar_height = nil
-- theme.wibar_bg = nil
-- theme.wibar_bgimage = nil
-- theme.wibar_fg = nil
-- theme.wibar_shape = nil
-- theme.wibar_margins = nil
-- theme.wibar_align = nil

return theme
