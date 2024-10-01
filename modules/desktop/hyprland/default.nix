{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # xwayland.enable = true;
    extraConfig = builtins.readFile ./conf/hyprland.conf;
  };

  xdg.configFile = {
    "waybar" = {
      source = ./conf/waybar;
      recursive = true;
    };
    "rofi" = {
      source = ./conf/rofi;
      recursive = true;
    };
  };
}
