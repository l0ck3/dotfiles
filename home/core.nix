{pkgs, ...}: {
  home.packages = with pkgs; [
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder
  ];

  programs = {
    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };
  };
}