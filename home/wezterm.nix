{ hostname, ... }: {
  programs.wezterm = {
    enable = true;
    
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = "Catppuccin Mocha"
      config.font_size = 13.0
      config.font = wezterm.font "FiraCode Nerd Font Mono"
      config.macos_window_background_blur = 30
      config.window_background_opacity = 1
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

      return config
    '';
  };
}
