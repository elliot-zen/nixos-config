{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;[
	vim
	neovim 
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      automatic = true;
      interval = [{ 
        Hour = 12;
        Minute = 30;
      }];
      options = "--delete-older-than 30d";
    };
  };
}
