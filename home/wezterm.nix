{ hostname, ... }: {
  programs.wezterm = {
    enable = true;
    
    extraConfig = builtins.readFile ./configs/wezterm/config.lua;
  };
}
