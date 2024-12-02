{ hostname, ... }: {
  programs.nushell = {
    enable = true;
    # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
    configFile.source = ./configs/config.nu;
    # for editing directly to config.nu 
    shellAliases = {
      k = "kubectl";
      "switch!" = "darwin-rebuild switch --flake .#${hostname}";
    };
  };
}
