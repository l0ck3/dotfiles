{pkgs, username, hostname, ...}: {
  # User account configuration
  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
  };  

  # Home Manager configuration
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;

    users.${username} = {
      # Don't change this value
      home.stateVersion = "24.11";
      
      # Programs
      programs = {
        home-manager.enable = true;
        zsh = {
          enable = true;
          shellAliases = {
            "switch!" = "darwin-rebuild switch --flake .#${hostname}";
            "reload!" = "source ~/.zshrc";
          };          
        };
      };

      # User packages
      home.packages = with pkgs; [
        # Add your packages here
      ];

      # Environment variables
      home.sessionVariables = {
        EDITOR = "code";
      };
    };
  };
}