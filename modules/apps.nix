{ pkgs, ... }: {
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
    taps = [ "homebrew/bundle" "homebrew/services" "nikitabobko/tap" ];
    brews = [ 
      "icu4c" 
      "mkcert"
      "railway"      
      "watch"
    ];
    casks = [
      "1password"
      "1password-cli"
      "aerospace"
      "arc"
      "clickup"
      "cloudflare-warp"
      "cursor"
      "diffusionbee"
      "google-chrome"
      "guitar-pro"
      "karabiner-elements"
      "kdrive"
      "notion-calendar"
      "obsidian"
      "orbstack"
      "nordvpn"
      "raycast"
      "setapp"
      "spotify"
      "wezterm"
      "zen"
    ];
    masApps = { "Perplexity" = 6714467650; };
  };
}
