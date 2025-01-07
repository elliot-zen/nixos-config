{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = "opacity 0.9 0.9,class:kitty";
    };
  };
}
