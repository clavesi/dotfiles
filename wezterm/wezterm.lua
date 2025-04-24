-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font_with_fallback{ 'CaskaydiaCove Nerd Font Mono', 'JetBrains Mono' }
config.font_size = 12.0

-- config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false 
config.tab_bar_at_bottom = true

-- Default size on initial launch
config.initial_cols = 100
config.initial_rows = 30

if wezterm.target_triple == "x86_64-pc-windows-msvc" or wezterm.target_triple == "aarch64-pc-windows-msvc" then
    config.default_prog = { 'pwsh' }
else
    config.default_prog = { 'zsh' }
end

-- and finally, return the configuration to wezterm
return config