{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "fcitx5 -d -r"
        "wl-paste --watch cliphist store"
        "waybar"
      ];
    };
  };
}
