{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {...} @ inputs: let
    myLib = import ./lib/default.nix {
      inherit inputs;
    };
  in
    with myLib; {
      nixosConfigurations = {
        nixos = mkSystem ./hosts/nixos/configuration.nix;
      };
      darwinConfigurations = {
        "ElliotMBP" = mkDarwinSystem ./hosts/darwin/configuration.nix;
      };
      homeConfigurations = {
        "elliot@nixos" = mkHome "x86_64-linux" ./hosts/nixos/home.nix;
        "elliot" = mkHome "aarch64-darwin" ./hosts/darwin/home.nix;
      };
      homeManagerModules.default = ./homeManagerModules;
    };
}
