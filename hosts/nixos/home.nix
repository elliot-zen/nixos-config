{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    stateVersion = "24.11";
    username = "elliot";
    homeDirectory = "/home/elliot";
    packages = with pkgs; [
      ripgrep
    ];
  };
  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop.enable = true;
  };

  programs.bat.enable = true;
}
