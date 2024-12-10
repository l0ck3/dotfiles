{pkgs, ...}: {  
  environment.systemPackages = with pkgs; [
    defaultbrowser
    devbox
    gh
    nixfmt-classic
    vim
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;            
      cleanup = "zap";            
    };        
    taps = [
      "homebrew/services"
      "nikitabobko/tap"
    ];
    brews = [
    ];
    casks = [      
      "1password"
      "1password-cli"
      "aerospace"
      "arc"
      "cursor"
      "diffusionbee"
      "karabiner-elements"
      "orbstack"
      "raycast"
      "setapp"
      "spotify"
      "wezterm"
      "windsurf"
    ];
    masApps = {
      "Perplexity" = 6714467650;          
    };            
  };
} 