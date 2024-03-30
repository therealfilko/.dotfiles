-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.hide_tab_bar_if_only_one_tab = true

-- Theme
config.color_scheme = 'rose-pine'
config.window_background_opacity = 0.88
config.colors = {
    background = "rgba(0,0,0,1)",
}

-- Typographie
config.font = wezterm.font 'GeistMono Nerd Font'
config.font =
wezterm.font('GeistMono Nerd Font', { weight = 'Regular', italic = false })
config.font_size = 21.0

return config
