{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["clock" "pulseaudio" "network" "tray"];
        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
        };
        tray = {
          icon-size = 15;
          spacing = 10;
        };
        clock = {
          timezone = "Asia/Dubai";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = " {:%d/%m/%Y}";
          format = " {:%H:%M}";
        };
        backlight = {
          device = "intel_backlight";
          format = "{icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" " "];
          };
          on-click = "pavucontrol";
        };
        network = {
          format-wifi = "󰤨 ";
          format-disconnected = "󰤭 ";
          format-ethernet = "󰈀 ";
          tooltip = true;
          tooltip-format = "{signalStrength}%";
        };
      };
    };
    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      * {
        font-family: JetBrains Nerd Font Mono;
        font-size: 14px;
        min-height: 0;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces {
        border-radius: 1rem;
        background-color: @surface0;
      }

      #workspaces button {
        color: @pink;
        border-radius: 1rem;
        padding: 0 5px;
        margin: 0 5px;
        box-shadow: inset 0 -3px transparent;
        transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
        background-color: transparent;
      }

      #workspaces button.active {
        color: @flamingo;
        border-radius: 1rem;
      }

      #workspaces button:hover {
        color: @rosewater;
        border-radius: 1rem;
      }

      #tray,
      #network,
      #backlight,
      #clock,
      #pulseaudio {
        background-color: @surface0;
        border-radius: 1rem;
        padding: 2px 8px;
        margin: 0 2px;
      }

      #clock {
        color: @lavender;
      }

      #network {
          color: @flamingo;
      }

      #pulseaudio {
        color: @pink;
      }

      #pulseaudio.muted {
          color: @red;
      }

      #tray {
      }
    '';
  };
}
