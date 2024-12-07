{
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "run,drun,window";
      show-icons = true;
      icon-theme = "Oranchelo";
      font = "JetBrains Nerd Font Mono 14";
      terminal = "kitty";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = "   window";
      drun-display-format = "{icon} {name}";
    };
    theme = ./theme.rasi;
  };
}
