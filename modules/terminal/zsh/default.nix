{config, pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      theme = "robbyrussell";
      enable = true;
      plugins = [
        "git"
        "direnv"
      ];
    };
    shellAliases = {
      gui = "gitui";
    };
  };

}
