{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    shellIntegration = {
      enableZshIntegration = true;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      cursor_trail = 3;
    };
  };
}
