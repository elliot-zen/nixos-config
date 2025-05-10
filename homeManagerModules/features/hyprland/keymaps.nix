{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Q, exec, kitty"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod SHIFT, return, fullscreen,"
        "$mainMod, L, exec, hyprlock"
        "ALT,Tab, cyclenext"
        "$mainMod SHIFT, C, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod SHIFT, left, swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy"

        # Move focus with mainMod + arrow keys"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        #Switch workspaces with mainMod + [0-9]"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "bind = $mainMod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "bind = $mainMod, mouse_down, workspace, e+1"
        "bind = $mainMod, mouse_up, workspace, e-1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
