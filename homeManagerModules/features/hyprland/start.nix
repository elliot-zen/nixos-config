{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "fcitx5 -d -r"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
    };
  };
}
