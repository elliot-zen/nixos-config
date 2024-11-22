{ outputs, ...}: {
  programs.bat.enable = true;
  home = {
    stateVersion = "24.05";
    username = "elliot";
    homeDirectory = "/Users/elliot";
  };
  myHomeManager = {
    bundles.general.enable = true;
  };
}
