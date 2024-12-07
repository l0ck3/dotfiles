local wezterm = require 'wezterm'
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font_size = 13.0
config.font = wezterm.font "FiraCode Nerd Font Mono"
config.macos_window_background_blur = 30
config.window_background_opacity = 0.83
config.window_decorations = 'RESIZE'
config.audible_bell = "Disabled"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
  position = "bottom",
  modules = {
    clock = {
      enabled = false,
    },
    pane = {
      enabled = false,
    },
    cwd = {
      enabled = false,
    },
  },
})

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
      top_level = true,
    },
  },
  {
    key = 'd',
    mods = 'SHIFT|CMD',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
      top_level = false,
    },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}

return config