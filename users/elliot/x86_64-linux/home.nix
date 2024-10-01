{config, pkgs, ...}:{
  imports = [
    ../../../modules/terminal
    ../../../modules/desktop
  ];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.localsend
    pkgs.xfce.thunar
  ];
  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliotzen256@gmail.com";
  };
}
