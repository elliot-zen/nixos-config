{config, pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    defaultKeymap = "emacs";
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
      v = "nvim";
    };
  };

}
