{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    stateVersion = "24.05";
    username = "elliot";
    homeDirectory = "/home/elliot";
    packages = with pkgs; [
      vscode
      inputs.ags.packages.${pkgs.system}.io
    ];
  };
  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktop.enable = true;
  };

  programs.bat.enable = true;
  programs.ags = {
    enable = true;
    extraPackages = with inputs; [
      ags.packages.${pkgs.system}.mpris
      ags.packages.${pkgs.system}.wireplumber
      ags.packages.${pkgs.system}.tray
      ags.packages.${pkgs.system}.network
      ags.packages.${pkgs.system}.battery
      ags.packages.${pkgs.system}.apps
      ags.packages.${pkgs.system}.auth
      ags.packages.${pkgs.system}.bluetooth
      ags.packages.${pkgs.system}.notifd
      ags.packages.${pkgs.system}.powerprofiles
      ags.packages.${pkgs.system}.hyprland
    ];
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
