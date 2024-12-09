{ config, lib, hostname, ... }: 
let
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./configs/wezterm/base.lua;
  };

  home.file.".config/wezterm/config.lua".source = link "${config.home.homeDirectory}/dotfiles/home/configs/wezterm/config.lua";
  home.file.".config/wezterm/projects.lua".source = link "${config.home.homeDirectory}/dotfiles/home/configs/wezterm/projects.lua";
}
