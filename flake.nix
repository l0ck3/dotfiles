{
  description = "L0ck3's macOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";   
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, nixpkgs, ... }:
  let
    username = "l0ck3";
    architecture = "aarch64-darwin";
    hostname = "l0ck3OS";

    configuration = { pkgs, ... }: {
      # List packages installed in system profile
      environment.systemPackages = with pkgs; [
        defaultbrowser
        vim
      ];

      system = {
        stateVersion = 5;
        configurationRevision = self.rev or self.dirtyRev or null;      

        # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
        activationScripts.postUserActivation.text = ''
          defaultbrowser browser

          # activateSettings -u will reload the settings from the database and apply them to the current session,
          # so we do not need to logout and login again to make the changes take effect.
          /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
        '';

        defaults = {
          menuExtraClock.Show24Hour = true;  # show 24 hour clock

          finder = {
            ShowPathbar = true;
            _FXShowPosixPathInTitle = true;
          };
        };
      }; 

      # Necessary for using flakes on this system
      nix.settings.experimental-features = "nix-command flakes";

      # The platform the configuration will be used on
      nixpkgs.hostPlatform = architecture;
      nixpkgs.config.allowUnfree = true;     

      security.pam.enableSudoTouchIdAuth = true;

      # Enable homebrew
      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;            
          cleanup = "zap";            
        };        
        taps = [
          "homebrew/services"
        ];
        brews = [];
        casks = [
          "1password"
          "arc"
          "cursor"
        ];
        masApps = {
          "Perplexity" = 6714467650;          
        };            
      };
    };   
  in
  {
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
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