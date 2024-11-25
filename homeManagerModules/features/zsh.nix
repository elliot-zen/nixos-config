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
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
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
