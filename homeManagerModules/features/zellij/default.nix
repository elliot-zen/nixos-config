{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "ayu_mirage";
    };
  };
}
