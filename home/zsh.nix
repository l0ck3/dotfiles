{ hostname, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      export ERL_AFLAGS="-kernel shell_history enabled"
      eval "$(devbox global shellenv)"
      PATH="/Users/l0ck3/.bun/bin:$PATH"
    '';
  };

  home.shellAliases = {
    k = "kubectl";
    "switch!" = "darwin-rebuild switch --flake .#${hostname}";
    "reload!" = "source ~/.zshrc";
    "gst" = "git status";
    "cd" = "z";
  };
}
