{
  pkgs,
  config,
  lib,
  ...
}: {
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
    plugins = [
    ];
    shellAliases = {
      gui = "gitui";
      v = "nvim";

      ga = "git add";
      gaa = "git add --all";
      gcam = "git commit -a -m";
      ggl = "git pull origin $(current_branch)";
      ggp = "git push origin $(current_branch)";
      glo = "git log --oneline --decorate";
      glog = "git log --oneline --decorate --graph";
    };
  };
}
