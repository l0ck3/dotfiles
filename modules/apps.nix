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
    taps = [ "steveyegge/beads"];
    brews = [
      "bd"
      "elixir" 
      "icu4c" 
      "mkcert"
      "node"
      "railway"    
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
