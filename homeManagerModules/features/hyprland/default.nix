{pkgs, ...}: {
  imports = [
    ./keymaps.nix
    ./start.nix
    ./rules.nix
    ./hyprpaper.nix
  ];

  home.file."Pictures/wallhaven-gpr2g7.jpg".source = ./asset/wallhaven-gpr2g7.jpg;
  home.packages = with pkgs; [
    # Hyprland
    hyprland
    nwg-look

    nautilus
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = "HDMI-A-1, 1980x1080@200, 0x0, 1";
      env = [
        "XCURSOR_SIZE,24"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
    };
  };
}
