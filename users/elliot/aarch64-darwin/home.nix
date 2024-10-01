{config, pkgs, ...}:{
  imports = [
    ../../../modules/terminal
  ];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  home.packages = [];

  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliotzen256@gmail.com";
  };
}
