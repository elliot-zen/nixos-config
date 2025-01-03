{pkgs, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [ (builtins.toString ./asset/wallhaven-gpr2g7.jpg) ];
      wallpaper = [
        ",${builtins.toString ./asset/wallhaven-gpr2g7.jpg}"
      ];
    };
  };
}
