{ outputs, ...}: {
  programs.bat.enable = true;
  home = {
    stateVersion = "24.05";
    username = "elliot";
    homeDirectory = "/home/elliot";
  };
  myHomeManager = {
    bundles.general.enable = true;
  };
}
