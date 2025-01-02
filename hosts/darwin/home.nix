{ pkgs,outputs, ...}: {
  programs.bat.enable = true;
  home = {
    stateVersion = "24.11";
    username = "elliot";
    homeDirectory = "/Users/elliot";
  };
  myHomeManager = {
    bundles.general.enable = true;
    alacritty.enable = true;
  };
  home.packages = with pkgs; [
    kubernetes-helm
    delta
  ];

}
