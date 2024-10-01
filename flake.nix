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

  outputs = {self, nixpkgs, home-manager,nix-darwin,...}@inputs: 
  let 
    mkSystem = import ./lib/mksystem.nix {
      inherit nixpkgs inputs;
    };
  in
    {
      nixosConfigurations.nixos = mkSystem "nixos"{
        system = "x86_64-linux";
        user = "elliot";
      };
      darwinConfigurations."zhaokaideMacBook-Pro" = mkSystem "zhaokaideMacBook-Pro"{
        system = "aarch64-darwin";
        user = "elliot";
      };
    };
}
