{config, lib, pkgs, ...}: {
  myHomeManager.zsh.enable = lib.mkDefault true;
  myHomeManager.tmux.enable = lib.mkDefault true;
  myHomeManager.hyprland.enable = lib.mkDefault true;
  programs.home-manager.enable = true;
  programs.bat.enable = true;

  home.packages = with pkgs;[
    wl-clipboard
  ];

  programs.git = {
    enable = true;
    userName = "elliot";
    userEmail = "elliotzen256@gmail.com";
  };
}
