{
  description = "L0ck3's macOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";   
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";    
    };
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, nixpkgs, home-manager, ... }:
  let
    username = "l0ck3";
    architecture = "aarch64-darwin";
    hostname = "l0ck3OS";     
  in
  {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./modules/system.nix
        ./modules/apps.nix
        home-manager.darwinModules.home-manager
        (import ./modules/home.nix { 
          inherit username; 
          pkgs = nixpkgs.legacyPackages.${architecture};
        })
        nix-homebrew.darwinModules.nix-homebrew
        {   
          nixpkgs.hostPlatform = architecture;
          nixpkgs.config.allowUnfree = true;          
          system.configurationRevision = self.rev or self.dirtyRev or null;
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "${username}";
            autoMigrate = true;        
          };          
        }      
      ];
    };   
  };
}