{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./config/hyprland.conf;
  };

  home.packages = with pkgs; [
    # Hyprland
    hyprland
    hyprlock
    hyprpaper
    rofi-wayland
    waybar
    dunst
    nwg-look
  ];
}
