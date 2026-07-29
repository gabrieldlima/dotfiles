# ╔═══════════════════════════════════════════════════════════════════╗
# ║██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ ║
# ║██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗║
# ║███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║║
# ║██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║║
# ║██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝║
# ║╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ║
# ╚═══════════════════════════════════════════════════════════════════╝

{
  config,
  ...
}: { 
  imports = [
    ../vicinae
    ../waybar
  ];

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          fit_mode = "cover";
          monitor = "DP-2";
          path = "${config.home.homeDirectory}/pictures/wallpapers/wallpaper.png";
        }
      ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
-- =============================================================================
-- Autostart
-- =============================================================================
hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("waybar")
  hl.exec_cmd("vicinae server")
end)


-- =============================================================================
-- Environment variables
-- =============================================================================

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice-Right")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice-Right")
hl.env("HYPRCURSOR_SIZE", "24")


-- =============================================================================
-- Monitors
-- =============================================================================

hl.monitor({
  output   = "DP-2",
  mode     = "2560x1440@170.00Hz",
  position = "auto",
  scale    = "auto",
})


-- =============================================================================
-- General config
-- =============================================================================

hl.config({
  general = {
    gaps_in  = 5,
    gaps_out = 10,
    border_size = 2,
    col = {
      active_border   = { colors = {"rgb(ebdbb2)"}, angle = 45 },
      inactive_border = "rgb(0c0c0c)",
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "master",
  },
  decoration = {
    rounding       = 0,
    rounding_power = 2,
    active_opacity   = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = 0xee1a1a1a,
    },
    blur = {
      enabled   = true,
      size      = 3,
      passes    = 1,
      vibrancy  = 0.1696,
    },
  },
  animations = {
    enabled = true,
  },
  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "caps:ctrl_modifier",
    kb_rules   = "",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
  },
  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo   = false,
  },
  master = {
    new_status = "master",
    mfact = 0.50,
  },
  scrolling = {
    fullscreen_on_one_column = true,
  },
})


-- =============================================================================
-- Animations
-- =============================================================================

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- =============================================================================
-- Window rules
-- =============================================================================

local suppressMaximizeRule = hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})


-- =============================================================================
-- Keybindings
-- =============================================================================

local terminal = "alacritty"
local browser  = "zen-beta"
local launcher = "vicinae toggle"

local modkey = "SUPER"

hl.bind(modkey .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(modkey .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(modkey .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(modkey .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(modkey .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(modkey .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(modkey .. " + P",      hl.dsp.exec_cmd(launcher))

hl.bind(modkey .. " + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(modkey .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(modkey .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(modkey .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(modkey .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(modkey .. " + M", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))

hl.bind(modkey .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(modkey .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(modkey .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(modkey .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(modkey .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(modkey .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(modkey .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(modkey .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(modkey .. " + " .. key,         hl.dsp.focus({ workspace = i}))
  hl.bind(modkey .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
    '';
  };
}
