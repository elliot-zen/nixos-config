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
    # envExtra = ''
    #   export NVM_DIR="$HOME/.nvm"
    #   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    #   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    #
    # '';
  };

}
