{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Catppuccin
    catppuccin.url = "github:catppuccin/nix";

    # Stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    stylix,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      aorus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ ./hosts/hosts.nix ];
      };
    };

    homeConfigurations = {
      "gabriel@aorus" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/home.nix
          catppuccin.homeManagerModules.catppuccin
          stylix.homeManagerModules.stylix
        ];
      };
    };
  };
}
