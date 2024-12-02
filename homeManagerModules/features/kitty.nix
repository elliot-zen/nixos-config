{
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "JetBrains Mono";
      size = 12;
    };
  };
}
