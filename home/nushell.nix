{ hostname, ... }: {
  programs.nushell = {
    enable = true;
    # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
    configFile.source = ./configs/nushell/config.nu;
    # for editing directly to config.nu 
    shellAliases = {
      k = "kubectl";
      gst = "git status";
      nu-open = "open";
      open = "^open";
      ll = "ls -l";
      la = "ls -la";
      "switch!" = "darwin-rebuild switch --flake .#${hostname}";
      "reload!" = "exec nu";
    };
  };
}
