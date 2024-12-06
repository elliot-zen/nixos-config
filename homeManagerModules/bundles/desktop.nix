{
  pkgs,
  lib,
  ...
}: {
  myHomeManager = {
    hyprland.enable = lib.mkDefault true;
    rofi.enable = lib.mkDefault true;
    waybar.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
  };

  home.packages = with pkgs; [
    wl-clipboard

    firefox
    clash-nyanpasu
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    # font = {
    #   name = "Sans";
    #   size = 11;
    # };
  };
}
