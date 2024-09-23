{config, pkgs,...}:{
  imports = [
    ../base/tui
  ];
  home.stateVersion = "24.05";
  home.username = "elliot";
  home.homeDirectory = "/Users/elliot";

  home.packages = [
    pkgs.fzf
    pkgs.neofetch
    pkgs.jq
    pkgs.ripgrep
    pkgs.bat
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; 
    nix-direnv.enable = true;
  };

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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;
}
