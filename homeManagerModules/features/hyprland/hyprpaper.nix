{
  pkgs,
  lib,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [(builtins.toString ./asset/wallhaven-gpr2g7.jpg)];
      wallpaper = [
        ",${builtins.toString ./asset/wallhaven-gpr2g7.jpg}"
      ];
    };
  };

  systemd.user.services = {
    hyprpaper = {
      Unit.After = lib.mkForce "graphical-session.target";
    };
  };
}
