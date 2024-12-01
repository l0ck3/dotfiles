{pkgs, ...}: {  
  environment.systemPackages = with pkgs; [
    defaultbrowser
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
    ];
    masApps = {
      "Perplexity" = 6714467650;          
    };            
  };
} 