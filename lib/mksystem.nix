{nixpkgs, inputs} :
name:
{
  system,
    user,
    darwin ? false
}:
let 
  machineConfig = ../machines/${system}.nix;
  userConfig = ../users/${user}/${system};
  userHMConfig = ../users/${user}/${system}/home.nix;

  systemFunc = if darwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
  home-manager = if darwin then inputs.home-manager.darwinModules else inputs.home-manager.nixosModules;
in systemFunc rec {
  inherit system;

  modules = [
    {nixpkgs.config.allowUnfree = true; }
    machineConfig
    userConfig
    home-manager.home-manager {
      home-manager.backupFileExtension = "backup";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.elliot = import userHMConfig;
    }
  ];
}
