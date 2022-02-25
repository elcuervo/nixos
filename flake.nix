{
  description = "NixOS configurations";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homemanager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nur, ... }@inputs:
    let
      sharedNixosConfiguration = { config, pkgs, ... }: {
        nix = {
          package = pkgs.nixFlakes;

          extraOptions = ''
            experimental-features = nix-command flakes
          '';

          binaryCaches = [ "https://cache.nixos.org" ];

          binaryCachePublicKeys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          ];

          gc = {
            automatic = true;
            persistent = true;
            dates = "weekly";
            options = "--delete-older-than 2w";
          };
        };

        nixpkgs = {
          config = {
            allowUnfree = true;
          };

          overlays = [
            self.overlay
            nur.overlay
          ];
        };
      };
    in
    {
      overlay = import ./overlays;

      nixosConfigurations = {
        talon = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            inputs.homemanager.nixosModules.home-manager
            inputs.agenix.nixosModules.age
            sharedNixosConfiguration
            ./machines/talon
            ./users/elcuervo
          ];

          specialArgs = {
            inherit inputs;
          };
        };
      };

      talon = self.nixosConfigurations.talon.config.system.build.toplevel;
    };
}
