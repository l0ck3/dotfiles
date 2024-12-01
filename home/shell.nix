{ hostname, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # initExtra = ''
    #   export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    # '';
  };

  home.shellAliases = {
    k = "kubectl";
    "switch!" = "darwin-rebuild switch --flake .#${hostname}";
    "reload!" = "source ~/.zshrc";
  };
}