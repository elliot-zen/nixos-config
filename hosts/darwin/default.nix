{config, pkgs, ...}: {
  nix.settings.experimental-features = "nix-command flakes";
  services.nix-daemon.enable = true;
  system.stateVersion = 5;
  # $ nix-env -qaP | grep wget
  environment.systemPackages =[ 
    pkgs.neovim
    pkgs.direnv
  ];

  programs.zsh.enable = true;
  users.users.elliot = {
    name = "elliot";
    home = "/Users/elliot";
    shell = pkgs.zsh;
  };

}
