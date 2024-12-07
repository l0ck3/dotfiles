local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Load the actual configuration from a separate file
local actual_config = dofile(wezterm.home_dir .. '/.config/wezterm/config.lua')
for k, v in pairs(actual_config) do
  config[k] = v
end

return config