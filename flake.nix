{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nix-darwin, nixpkgs, home-manager,...}: 
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./hosts/nixos/configuration.nix 
          home-manager.nixosModules.home-manager {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elliot = import ./home/nixos;
          }
        ];
      };
      darwinConfigurations."zhaokaideMacBook-Pro" = nix-darwin.lib.darwinSystem{
        system = "aarch64-darwin";
        modules = [ 
          ./hosts/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elliot = import ./home/darwin;
          }
        ];
      };
    };
}
