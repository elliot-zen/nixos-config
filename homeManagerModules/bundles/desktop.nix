{
  pkgs,
  lib,
  ...
}: {
  myHomeManager = {
    hyprland.enable = lib.mkDefault true;
    # rofi.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
  };

  home.packages = with pkgs; [
    wl-clipboard

    firefox
    chromium
  ];
}
