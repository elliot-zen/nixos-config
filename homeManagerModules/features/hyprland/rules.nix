{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      windowrulev2 = "opacity 0.9 0.9,class:kitty";
    };
  };
}
