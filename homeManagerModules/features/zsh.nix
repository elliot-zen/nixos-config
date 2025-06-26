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
    syntaxHighlighting = {
      enable = true;
    };
    defaultKeymap = "emacs";
    plugins = [
      {
        name = "git";
        file = "init.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "zimfw";
          repo = "git";
          rev = "226b1dd1f0c5363f175dca677b49f43d24be9c11";
          sha256 = "sha256-O47n7a+0yokTu9pd5BKTNsthUQ7DxqW5z3ChaL8FZ8k=";
        };
      }
    ];
    shellAliases = {
      gui = "gitui";
      v = "nvim";
      k = "kubectl";
    };
    initContent = ''
      unset -m "DIRENV_*"
    '';
    envExtra = ''
      export EDITOR=vim
      export LC_ALL=en_US.UTF-8
    '';
  };
}
