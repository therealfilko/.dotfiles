-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

-- Theme
config.color_scheme = 'rose-pine'
config.window_background_opacity = 0.85
config.colors = {
    background = "rgba(0,0,0,1)",
}

-- Typographie
config.font_size = 22.0
config.max_fps = 120
config.front_end = "WebGpu"


return config
