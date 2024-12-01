{pkgs, username, ...}: {
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
      
      # Enable Home Manager
      programs.home-manager.enable = true;

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