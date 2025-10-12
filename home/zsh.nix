{ hostname, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      export ERL_AFLAGS="-kernel shell_history enabled"
      eval "$(devbox global shellenv --init-hook)"
      PATH="/Users/l0ck3/.bun/bin:/Users/l0ck3/.local/bin:$PATH"
    '';
  };

  home.shellAliases = {
    k = "kubectl";
    "switch!" = "sudo darwin-rebuild switch --flake .#${hostname}";
    "reload!" = "source ~/.zshrc";
    "gst" = "git status";
    "cd" = "z";
  };
}
