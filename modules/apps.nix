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
    taps = [ "homebrew/services" "nikitabobko/tap" ];
    brews = [ "icu4c" ];
    casks = [
      "1password"
      "1password-cli"
      "aerospace"
      "arc"
      "clickup"
      "cursor"
      "diffusionbee"
      "karabiner-elements"
      "kdrive"
      "obsidian"
      "orbstack"
      "nordvpn"
      "raycast"
      "setapp"
      "spotify"
      "wezterm"
      "windsurf"
    ];
    masApps = { "Perplexity" = 6714467650; };
  };
}
