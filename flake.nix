{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
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
      homeConfigurations = {
        "elliot@nixos" = mkHome "x86_64-linux" ./hosts/nixos/home.nix;
        "darwin" = mkHome "aarch64-darwin" ./hosts/darwin/home.nix;
      };
      homeManagerModules.default = ./homeManagerModules;
    };
}
