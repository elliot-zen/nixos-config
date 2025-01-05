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
      name = "JetBrains Mono";
      size = 12;
    };
    settings = {
      cursor_trail = 3;
    };
  };
}
