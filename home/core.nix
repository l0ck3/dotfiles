{pkgs, ...}: {
  home.packages = with pkgs; [
    jq # A lightweight and flexible command-line JSON processor
    neovim # A highly configurable text editor built to make you more productive
    fzf # A command-line fuzzy finder
  ];

  programs = {

    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [ "--disable-up-arrow" ];
    };

    carapace = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}