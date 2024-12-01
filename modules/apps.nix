{pkgs, ...}: {  
  environment.systemPackages = with pkgs; [
    defaultbrowser
    nixfmt-classic
    vim
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;            
      cleanup = "zap";            
    };        
    taps = [
      "homebrew/services"
    ];
    brews = [];
    casks = [
      "1password"
      "arc"
      "cursor"
      "spotify"
      "wezterm"
    ];
    masApps = {
      "Perplexity" = 6714467650;          
    };            
  };
} 