{config, pkgs, lib,...}:{
  imports = [
    ../../../modules/terminal
    ../../../modules/desktop
  ];
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.localsend
    pkgs.xfce.thunar
    pkgs.wl-clipboard
    pkgs.xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`

    pkgs.clash-verge-rev
    pkgs.rsync
  ];

  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliotzen256@gmail.com";
  };

  services.cliphist = {
    enable = true;
  };

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs = {
      enable = true;
    };
  };

  home.activation.configDotfile = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${../.config}/ ${config.xdg.configHome}/
  '';
}
