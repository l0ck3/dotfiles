local wezterm = require 'wezterm'
-- local projects = require 'projects'
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font_size = 13.0
config.font = wezterm.font "FiraCode Nerd Font Mono"
config.macos_window_background_blur = 30
config.window_background_opacity = 0.83
config.window_decorations = 'RESIZE'
config.audible_bell = "Disabled"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.leader = { key = 'a', mods = 'OPT|CTRL|CMD', timeout_milliseconds = 2000 }

config.set_environment_variables = {
  PATH = '/opt/homebrew/bin:/etc/profiles/per-user/l0ck3/bin:' .. os.getenv('PATH')
}

config.keys = {
  { key = "Enter", mods = "SHIFT", action = wezterm.action { SendString = "\x1b\r" } },
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
    key = 'LeftArrow',
    mods = 'SHIFT|CMD',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT|CMD',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'SHIFT|CMD',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT|CMD',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  {
    key = ',',
    mods = 'CMD',
    action = wezterm.action.SpawnCommandInNewWindow {
      cwd = wezterm.home_dir,
      args = { 'cursor', 'dotfiles' },
    },
  },
  -- {
  --   key = 'Enter',
  --   mods = 'SHIFT',
  --   action = wezterm.action.SendString('\\\r\n'),
  -- },

  -- (Optional) Ctrl+Enter as an alternative multiline shortcut
  {
    key = 'Enter',
    mods = 'CTRL',
    action = wezterm.action.SendString('\\\r\n'),
  },
  -- {
  --   key = 'p',
  --   mods = 'LEADER',
  --   action = projects.choose_project(),
  -- },
  -- {
  --   key = 'f',
  --   mods = 'LEADER',
  --   action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  -- },
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
  options = {
    icons_enabled = true,
    theme = 'Catppuccin Mocha',
    color_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    tabline_a = { 'workspace' },
    tabline_b = { nil },
    tab_active = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { 'ram', 'cpu' },
    tabline_y = { 'battery' },
    tabline_z = { 'hostname' },
  },
  extensions = {},
})

tabline.apply_to_config(config)

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

workspace_switcher.apply_to_config(config)
workspace_switcher.switch_workspace({ extra_args = " | rg -Fxf ~/Workspace" })

-- wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
--   local gui_win = window:gui_window()
--   local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
--   gui_win:set_left_status(wezterm.format({
--     { Foreground = { Color = "green" } },
--     { Text = base_path .. "  " },
--   }))
-- end)

-- wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
--   local gui_win = window:gui_window()
--   local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
--   gui_win:set_left_status(wezterm.format({
--     { Foreground = { Color = "green" } },
--     { Text = base_path .. "  " },
--   }))
-- end)

-- local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")



return config
