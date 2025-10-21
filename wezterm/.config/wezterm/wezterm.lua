-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
-- Using the wezterm API
local config = wezterm.config_builder()
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
local sessionizer = wezterm.plugin.require("https://github.com/mikkasendke/sessionizer.wezterm")
local schema = {
    sessionizer.DefaultWorkspace {},
    sessionizer.AllActiveWorkspaces {},
    sessionizer.FdSearch "~/Projects",
}

-- This is where you actually apply your config choices
config.font = wezterm.font 'JuliaMonoNerdFont'

config.colors = theme.colors()
config.colors.cursor_fg = 'ffffff'
config.colors.cursor_bg = 'ff00ff'
config.window_frame = theme.window_frame()

config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'TITLE | RESIZE'

-- Keybindings
config.leader = { key = 'q', mods = 'CTRL', timeout_miliseconds = 1000 }
config.keys = {
    {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Send "CTRL-Q" to the terminal when pressing CTRL-Q, CTRL-Q
    {
        key = 'q',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
    { key = "S", mods = "ALT", action = sessionizer.show(schema) },
}


-- and finally, return the configuration to wezterm
return config
