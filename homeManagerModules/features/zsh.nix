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
        "fzf"
      ];
    };
    plugins = [
    ];
    shellAliases = {
      gui = "gitui";
      v = "nvim";
    };
    initExtra = ''
      unset -m "DIRENV_*"
    '';
    envExtra = ''
      export EDITOR=vim
      export LC_ALL=en_US.UTF-8
    '';
  };
}
