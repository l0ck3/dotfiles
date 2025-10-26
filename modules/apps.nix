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
      autoUpdate = true;
      cleanup = "zap";
    };
    taps = [ "homebrew/bundle" "homebrew/services" "nikitabobko/tap"  "supabase/tap"];
    brews = [ 
      "icu4c" 
      "mkcert"
      "node"
      "railway"    
      "supabase"  
      "uv"
      "watch"
    ];
    casks = [
      "1password"
      "1password-cli"
      "arc"
      "claude-code"
      "cloudflare-warp"
      "cursor"
      "flox"
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
      "visual-studio-code"
      "wezterm"
      "zen"
    ];
    masApps = { "Perplexity" = 6714467650; };
  };
}
