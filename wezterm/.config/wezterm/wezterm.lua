-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

-- This is where you actually apply your config choices
config.font = wezterm.font 'JuliaMono'

config.colors = theme.colors()
config.window_frame = theme.window_frame()

config.font_size = 16
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'TITLE | RESIZE'

-- Keybindings
config.leader = { key = 'q', mods = 'CTRL', timeout_miliseconds = 1000 }

-- and finally, return the configuration to wezterm
return config
