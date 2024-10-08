{config, pkgs, lib,...}:{
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

  home.activation.configDotfile = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${../.config/nvim}/ ~/.config/nvim/
  '';
}
